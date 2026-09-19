#!/bin/sh
# Cudy LT500D V2 / R25 emulator-only management shim.
# Fidelity class: COMPATIBILITY_SHIMMED.
PATH=/sbin:/usr/sbin:/bin:/usr/bin
LOG=/tmp/lt500d-r25-emulator.log
log(){ echo "[LT500D-EMU] $*" >> "$LOG"; }

i=0
while [ ! -e /sys/class/net/eth1 ] && [ "$i" -lt 60 ]; do sleep 1; i=$((i+1)); done
[ -e /sys/class/net/eth1 ] || { log "eth1 not found"; exit 1; }

ifconfig eth1 10.0.2.15 netmask 255.255.255.0 up
log "eth1=10.0.2.15/24; donor eth0 untouched"

# Donor firewall may reload after rc.local. Reassert only the two emulator
# management permits; never flush donor chains or change default policies.
while :; do
  if command -v iptables >/dev/null 2>&1; then
    for p in 80 443; do
      iptables -C INPUT -i eth1 -p tcp --dport "$p" -j ACCEPT 2>/dev/null ||
        iptables -I INPUT 1 -i eth1 -p tcp --dport "$p" -j ACCEPT 2>/dev/null || true
    done
  fi
  sleep 5
done
