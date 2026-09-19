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

console_log() {
  {
    echo "[LT500D-EMU] $*"
  } > /dev/console 2>/dev/null || true
}

dump_diag() {
  console_log "network diagnostic begin"
  {
    echo "[LT500D-EMU] ifconfig eth1"
    ifconfig eth1 2>&1 || true
    echo "[LT500D-EMU] route -n"
    route -n 2>&1 || true
    echo "[LT500D-EMU] listeners"
    netstat -lnt 2>&1 || true
    if command -v iptables >/dev/null 2>&1; then
      echo "[LT500D-EMU] INPUT"
      iptables -nvL INPUT --line-numbers 2>&1 || true
    fi
    echo "[LT500D-EMU] network diagnostic end"
  } > /dev/console 2>&1 || true
}

# Donor firewall may reload after rc.local. Reassert only the two emulator
# management permits; never flush donor chains or change default policies.
diag_tick=0
while :; do
  if command -v iptables >/dev/null 2>&1; then
    for p in 80 443; do
      iptables -C INPUT -i eth1 -p tcp --dport "$p" -j ACCEPT 2>/dev/null ||
        iptables -I INPUT 1 -i eth1 -p tcp --dport "$p" -j ACCEPT 2>/dev/null || true
    done
  fi
  if [ "$diag_tick" -eq 0 ]; then
    dump_diag
  fi
  diag_tick=$(( (diag_tick + 1) % 4 ))
  sleep 5
done
