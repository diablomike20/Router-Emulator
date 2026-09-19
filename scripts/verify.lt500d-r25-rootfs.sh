#!/bin/bash
set -euo pipefail
ROOT="$1"
fail=0
check(){ if grep -Fq "$2" "$ROOT/$1"; then echo "PASS $1 :: $2"; else echo "FAIL $1 :: $2"; fail=1; fi; }
check lib/ramips.sh 'LT500D emulator compatibility: explicit profile marker'
check lib/preinit/82_factory_mac 'LT500D emulator compatibility: no factory MTD'
check etc/rc.local '/usr/sbin/lt500d-r25-management'
check usr/sbin/lt500d-r25-management "uci set network.lan.ipaddr='192.168.10.2'"
check usr/sbin/lt500d-r25-management 'LT500D_LAN_IP_GATE=PASS'
[ -x "$ROOT/usr/sbin/lt500d-r25-management" ] && echo "PASS management shim executable" || { echo "FAIL management shim executable"; fail=1; }
exit "$fail"
