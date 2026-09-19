#!/bin/sh
# Cudy LT500D V2 / R25 emulator-only LAN attachment shim.
# Fidelity class: COMPATIBILITY_SHIMMED.
#
# The emulator copy of the donor owns br-lan=192.168.10.2/24.  Do not give the emulator
# management NIC a second management subnet; attach it to the donor LAN so
# LuCI sees the request as LAN traffic, like on the physical router.
PATH=/sbin:/usr/sbin:/bin:/usr/bin
LOG=/tmp/lt500d-r25-emulator.log
log(){ echo "[LT500D-EMU] $*" >> "$LOG"; }

console_log() {
  {
    echo "[LT500D-EMU] $*"
  } > /dev/console 2>/dev/null || true
}

i=0
while [ ! -e /sys/class/net/eth1 ] && [ "$i" -lt 60 ]; do sleep 1; i=$((i+1)); done
[ -e /sys/class/net/eth1 ] || { log "eth1 not found"; exit 1; }

i=0
while [ ! -e /sys/class/net/br-lan ] && [ "$i" -lt 60 ]; do sleep 1; i=$((i+1)); done
[ -e /sys/class/net/br-lan ] || { log "br-lan not found"; exit 1; }

# The donor owns the L3 address. eth1 is only an emulator-side LAN port.
ifconfig eth1 0.0.0.0 up
if ! brctl show br-lan 2>/dev/null | grep -qw eth1; then
  brctl addif br-lan eth1
fi
log "eth1 attached to donor br-lan; emulator donor br-lan address retained"

dump_diag() {
  console_log "network diagnostic begin"
  {
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

# netifd/firewall may reload during late boot. Reassert bridge membership only;
# do not add firewall bypasses. The donor's normal LAN policy must decide access.
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
