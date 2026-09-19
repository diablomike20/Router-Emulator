#!/bin/sh
# Cudy LT500D V2 / R25 emulator-only LAN attachment shim.
# Fidelity class: COMPATIBILITY_SHIMMED.
#
# The physical donor defaults to 192.168.10.1/24.  The emulator copy moves
# network.lan to 192.168.10.2/24 at runtime, then attaches emulator-only eth1
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

# Wait for the donor-generated/runtime UCI network config.  The R25 SquashFS
# does not contain a static /etc/config/network in the extracted rootfs.
i=0
lan_ip=""
while [ "$i" -lt 90 ]; do
  lan_ip="$(uci -q get network.lan.ipaddr 2>/dev/null || true)"
  [ -n "$lan_ip" ] && break
  sleep 1
  i=$((i+1))
done
[ -n "$lan_ip" ] || fail "network.lan.ipaddr did not appear in runtime UCI"

case "$lan_ip" in
  192.168.10.1)
    console_log "moving emulator donor LAN 192.168.10.1 -> 192.168.10.2"
    uci set network.lan.ipaddr='192.168.10.2' || fail "uci set network.lan.ipaddr failed"
    uci commit network || fail "uci commit network failed"
    ifup lan >/dev/console 2>&1 || fail "ifup lan failed after emulator LAN rewrite"
    ;;
  192.168.10.2)
    console_log "emulator donor LAN already 192.168.10.2"
    ;;
  *)
    fail "unexpected donor network.lan.ipaddr=$lan_ip; refusing blind rewrite"
    ;;
esac

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
  fail "br-lan did not acquire 192.168.10.2"
console_log "LT500D_LAN_IP_GATE=PASS br-lan=192.168.10.2"

i=0
while [ ! -e /sys/class/net/eth1 ] && [ "$i" -lt 60 ]; do sleep 1; i=$((i+1)); done
[ -e /sys/class/net/eth1 ] || fail "eth1 not found"

# eth1 is only an emulator-side physical LAN attachment.
ifconfig eth1 0.0.0.0 up
if ! brctl show br-lan 2>/dev/null | grep -qw eth1; then
  brctl addif br-lan eth1 || fail "could not attach eth1 to br-lan"
fi
log "eth1 attached to donor br-lan at 192.168.10.2"

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

# netifd may rebuild the bridge during late boot. Reassert only eth1 membership;
# UCI now owns the .2 address, so normal donor reloads retain it.
diag_tick=0
while :; do
  if [ -e /sys/class/net/br-lan ]; then
    ifconfig eth1 0.0.0.0 up 2>/dev/null || true
    brctl show br-lan 2>/dev/null | grep -qw eth1 || brctl addif br-lan eth1 2>/dev/null || true
  fi
  if [ "$diag_tick" -eq 0 ]; then
    dump_diag
  fi
  diag_tick=$(( (diag_tick + 1) % 4 ))
  sleep 5
done
