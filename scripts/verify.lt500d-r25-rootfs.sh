#!/bin/bash
set -euo pipefail
ROOT="$1"
fail=0
check(){ if grep -Fq "$2" "$ROOT/$1"; then echo "PASS $1 :: $2"; else echo "FAIL $1 :: $2"; fail=1; fi; }
check lib/ramips.sh 'LT500D emulator compatibility: explicit profile marker'
check lib/preinit/82_factory_mac 'LT500D emulator compatibility: no factory MTD'
check etc/rc.local '/usr/sbin/lt500d-r25-management'
check etc/uci-defaults/01_network 'uci set network.lan.def_ipaddr="192.168.10.2"'
check etc/uci-defaults/01_network "uci set network.lan.ipaddr='192.168.10.2'"
if grep -Fq '192.168.10.1' "$ROOT/etc/uci-defaults/01_network"; then
  echo "FAIL etc/uci-defaults/01_network still contains donor LAN 192.168.10.1"
  fail=1
else
  echo "PASS donor LAN default generator no longer contains 192.168.10.1"
fi
check usr/sbin/lt500d-r25-management 'LT500D_LAN_UCI_GATE=PASS'
check usr/sbin/lt500d-r25-management 'LT500D_LAN_IP_GATE=PASS'
check usr/sbin/lt500d-r25-management 'INPUT -i br-lan -s 192.168.10.254'
check usr/sbin/lt500d-r25-management 'OUTPUT -o br-lan -d 192.168.10.254'
[ -x "$ROOT/usr/sbin/lt500d-r25-management" ] && echo "PASS management shim executable" || { echo "FAIL management shim executable"; fail=1; }
exit "$fail"
