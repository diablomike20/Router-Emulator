#!/bin/sh
PATH=/sbin:/usr/sbin:/bin:/usr/bin
LOG=/tmp/RE-f9k1103-v1-candidate-15-emulator.log
log(){ echo "[F9K1103-V1-C15-EMU] $*" >> "$LOG"; echo "[F9K1103-V1-C15-EMU] $*" > /dev/console 2>/dev/null || true; }
fail(){ log "ERROR: $*"; exit 1; }
grep -qw 'F9K1103_V1_C15_EMU=1' /proc/cmdline 2>/dev/null || exit 0

i=0
while [ "$i" -lt 90 ]; do
  ip="$(uci -q get network.lan.ipaddr 2>/dev/null || true)"
  [ "$ip" = '192.168.10.2' ] && break
  sleep 1; i=$((i+1))
done
[ "$(uci -q get network.lan.ipaddr 2>/dev/null || true)" = '192.168.10.2' ] || fail 'network.lan.ipaddr did not become 192.168.10.2'
log 'F9K1103_V1_C15_LAN_UCI_GATE=PASS'

# LEDE 17.01.5 uses the interface device directly here because the emulator
# UCI override deliberately does not declare option type 'bridge'. The previous
# gate incorrectly waited for br-lan even though netifd had already assigned
# 192.168.10.2 to eth1.
LANDEV="$(uci -q get network.lan.ifname 2>/dev/null || true)"
[ "$LANDEV" = "eth1" ] || fail "unexpected emulator LAN device: $LANDEV"

i=0
while [ "$i" -lt 90 ]; do
  ifconfig "$LANDEV" 2>/dev/null | grep -q '192\.168\.10\.2' && break
  sleep 1; i=$((i+1))
done
ifconfig "$LANDEV" 2>/dev/null | grep -q '192\.168\.10\.2' || fail "$LANDEV did not acquire 192.168.10.2"
log 'F9K1103_V1_C15_LAN_IP_GATE=PASS'

while :; do
  if command -v iptables >/dev/null 2>&1; then
    for p in 80 443; do
      iptables -C INPUT -i "$LANDEV" -s 192.168.10.254 -p tcp --dport "$p" -j ACCEPT 2>/dev/null || iptables -I INPUT 1 -i "$LANDEV" -s 192.168.10.254 -p tcp --dport "$p" -j ACCEPT 2>/dev/null || true
      iptables -C OUTPUT -o "$LANDEV" -d 192.168.10.254 -p tcp --sport "$p" -j ACCEPT 2>/dev/null || iptables -I OUTPUT 1 -o "$LANDEV" -d 192.168.10.254 -p tcp --sport "$p" -j ACCEPT 2>/dev/null || true
    done
  fi
  {
    echo '[F9K1103-V1-C15-EMU] --- runtime diagnostic ---'
    uci -q show system
    uci -q show network
    uci -q show luci
    ifconfig -a
    route -n
    brctl show
    netstat -lnt
    ps w | grep -E '[u]httpd|[p]rocd|[u]busd|[n]etifd'
    ls -l /www/cgi-bin/luci /usr/lib/lua/luci/dispatcher.lua 2>/dev/null
  } > /dev/console 2>&1 || true
  sleep 10
done
