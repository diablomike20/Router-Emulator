#!/bin/sh
# Cudy LT500D V2 / R25 emulation management shim.
# Classification: COMPATIBILITY_SHIMMED (not donor-faithful hardware).
# Keeps donor eth0/VLAN/br-lan ownership untouched and exposes a separate
# emulator-only management NIC on eth1.

PATH=/sbin:/usr/sbin:/bin:/usr/bin
LOG=/tmp/lt500d-r25-emulator.log

log() { echo "[LT500D-EMU] $*" >> "$LOG"; }

# Wait for QEMU's second e1000 NIC.
i=0
while [ ! -e /sys/class/net/eth1 ] && [ "$i" -lt 60 ]; do
    sleep 1
    i=$((i + 1))
done

if [ ! -e /sys/class/net/eth1 ]; then
    log "eth1 not found; management shim inactive"
    exit 1
fi

ifconfig eth1 10.0.2.15 netmask 255.255.255.0 up
log "eth1 configured as 10.0.2.15/24"

# Do not add eth1 to the donor LAN bridge or UCI network model.
# Permit only web management ingress on this emulator-only interface.
if command -v iptables >/dev/null 2>&1; then
    iptables -C INPUT -i eth1 -p tcp -m multiport --dports 80,443 -j ACCEPT 2>/dev/null ||
        iptables -I INPUT 1 -i eth1 -p tcp -m multiport --dports 80,443 -j ACCEPT
    log "iptables INPUT exception installed for eth1 tcp/80,443"
fi

exit 0
