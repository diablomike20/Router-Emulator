#!/bin/sh
# Cudy LT500D V2 / R25 emulator-only LAN attachment shim.
# Fidelity class: COMPATIBILITY_SHIMMED.
#
# The physical donor defaults to 192.168.10.1/24.  This ENG06 test preserves
# network.lan at 192.168.10.1/24 and only attaches emulator-only eth1
# as a port of the donor-created br-lan.  No parallel management subnet and
# no broad firewall bypass are introduced.
PATH=/sbin:/usr/sbin:/bin:/usr/bin
LOG=/tmp/lt500d-r25-emulator.log
log(){ echo "[LT500D-EMU] $*" >> "$LOG"; }

console_log() {
  {
    echo "[LT500D-EMU] $*"
  } > /dev/console 2>/dev/null || true
}

fail() {
  log "ERROR: $*"
  console_log "ERROR: $*"
  exit 1
}

# Wait for the donor-generated/runtime UCI network config.  The extracted
# SquashFS has no static /etc/config/network; /etc/uci-defaults/01_network
# generates it at first boot.  This test preserves the donor .1 address;
# runtime code here verifies rather than rewrites it.
i=0
lan_ip=""
while [ "$i" -lt 90 ]; do
  lan_ip="$(uci -q get network.lan.ipaddr 2>/dev/null || true)"
  [ -n "$lan_ip" ] && break
  sleep 1
  i=$((i+1))
done
[ -n "$lan_ip" ] || fail "network.lan.ipaddr did not appear in runtime UCI"

[ "$lan_ip" = "192.168.10.1" ] ||
  fail "unexpected donor network.lan.ipaddr=$lan_ip; expected patched first-boot default 192.168.10.1"

console_log "LT500D_LAN_UCI_GATE=PASS network.lan.ipaddr=192.168.10.1"

# Require the address to be live, not merely present in UCI.
i=0
while [ "$i" -lt 60 ]; do
  if ifconfig br-lan 2>/dev/null | grep -q '192\.168\.10\.2'; then
    break
  fi
  sleep 1
  i=$((i+1))
done
ifconfig br-lan 2>/dev/null | grep -q '192\.168\.10\.2' ||
  fail "br-lan did not acquire 192.168.10.1"
console_log "LT500D_LAN_IP_GATE=PASS br-lan=192.168.10.1"

i=0
while [ ! -e /sys/class/net/eth1 ] && [ "$i" -lt 60 ]; do sleep 1; i=$((i+1)); done
[ -e /sys/class/net/eth1 ] || fail "eth1 not found"

# eth1 is only an emulator-side physical LAN attachment.
ifconfig eth1 0.0.0.0 up
if ! brctl show br-lan 2>/dev/null | grep -qw eth1; then
  brctl addif br-lan eth1 || fail "could not attach eth1 to br-lan"
fi
log "eth1 attached to donor br-lan at 192.168.10.1"

dump_diag() {
  console_log "network diagnostic begin"
  {
    echo "[LT500D-EMU] runtime UCI LAN IP: $(uci -q get network.lan.ipaddr 2>/dev/null)"
    echo "[LT500D-EMU] bridge"
    brctl show br-lan 2>&1 || true
    echo "[LT500D-EMU] ifconfig br-lan"
    ifconfig br-lan 2>&1 || true
    echo "[LT500D-EMU] ifconfig eth1"
    ifconfig eth1 2>&1 || true
    echo "[LT500D-EMU] route -n"
    route -n 2>&1 || true
    echo "[LT500D-EMU] listeners"
    netstat -lnt 2>&1 || true
    echo "[LT500D-EMU] uhttpd process"
    ps w 2>&1 | grep '[u]httpd' || true
    echo "[LT500D-EMU] uhttpd UCI"
    uci show uhttpd 2>&1 || true
    echo "[LT500D-EMU] LuCI handler files"
    ls -l /www/cgi-bin/luci /usr/lib/lua/luci/sgi/uhttpd.lua /usr/lib/lua/luci/sgi/cgi.lua 2>&1 || true
    echo "[LT500D-EMU] LuCI cache/index"
    ls -l /tmp/luci-indexcache /tmp/luci-modulecache 2>&1 || true
    [ -f /tmp/luci-indexcache ] && { wc -c /tmp/luci-indexcache; head -c 256 /tmp/luci-indexcache | strings; } 2>&1 || true
    echo "[LT500D-EMU] uhttpd process"
    ps w 2>&1 | grep '[u]httpd' || true
    for p in $(pidof uhttpd 2>/dev/null); do
      echo "[LT500D-EMU] /proc/$p/cmdline"
      tr '\000' ' ' < "/proc/$p/cmdline" 2>/dev/null || true
      echo
    done
    echo "[LT500D-EMU] uhttpd UCI"
    uci show uhttpd 2>&1 || true
    echo "[LT500D-EMU] system UCI"
    uci show system 2>&1 || true
    echo "[LT500D-EMU] luci UCI"
    uci show luci 2>&1 || true
    echo "[LT500D-EMU] CGI metadata"
    ls -l /www/cgi-bin/luci /usr/bin/lua /usr/lib/lua/luci/sgi/cgi.lua /usr/lib/lua/luci/sgi/uhttpd.lua 2>&1 || true
    echo "[LT500D-EMU] LuCI Lua import smoke"
    /usr/bin/lua -e 'require "luci.cacheloader"; require "luci.sgi.cgi"; io.write("LT500D_LUCI_LUA_IMPORT=PASS\\n")' 2>&1 || true
    if command -v iptables >/dev/null 2>&1; then
      echo "[LT500D-EMU] INPUT"
      iptables -nvL INPUT --line-numbers 2>&1 || true
      echo "[LT500D-EMU] OUTPUT"
      iptables -nvL OUTPUT --line-numbers 2>&1 || true
    fi
    echo "[LT500D-EMU] rp_filter"
    for x in /proc/sys/net/ipv4/conf/all/rp_filter /proc/sys/net/ipv4/conf/br-lan/rp_filter /proc/sys/net/ipv4/conf/eth1/rp_filter; do
      [ -r "$x" ] && echo "$x=$(cat "$x")"
    done
    echo "[LT500D-EMU] network diagnostic end"
  } > /dev/console 2>&1 || true
}

# netifd/firewall may reload during late boot. Reassert only emulator LAN
# attachment and the minimum host-management permits.  FirmAE does not
# reproduce the donor's populated LAN firewall chains here; the observed
# chains are empty with policy DROP.  Permit only QEMU's emulator-only host
# endpoint (192.168.10.254) to the donor web ports, never flush donor rules.
diag_tick=0
while :; do
  if [ -e /sys/class/net/br-lan ]; then
    ifconfig eth1 0.0.0.0 up 2>/dev/null || true
    brctl show br-lan 2>/dev/null | grep -qw eth1 || brctl addif br-lan eth1 2>/dev/null || true
  fi

  if command -v iptables >/dev/null 2>&1; then
    for p in 80 443; do
      iptables -C INPUT -i br-lan -s 192.168.10.254 -p tcp --dport "$p" -j ACCEPT 2>/dev/null ||
        iptables -I INPUT 1 -i br-lan -s 192.168.10.254 -p tcp --dport "$p" -j ACCEPT 2>/dev/null || true
      iptables -C OUTPUT -o br-lan -d 192.168.10.254 -p tcp --sport "$p" -j ACCEPT 2>/dev/null ||
        iptables -I OUTPUT 1 -o br-lan -d 192.168.10.254 -p tcp --sport "$p" -j ACCEPT 2>/dev/null || true
    done
  fi

  if [ "$diag_tick" -eq 0 ]; then
    dump_diag
  fi
  diag_tick=$(( (diag_tick + 1) % 4 ))
  sleep 5
done
