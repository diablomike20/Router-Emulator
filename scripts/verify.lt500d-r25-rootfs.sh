#!/bin/bash
set -euo pipefail
ROOT="$1"
fail=0
check(){ if grep -Fq "$2" "$ROOT/$1"; then echo "PASS $1 :: $2"; else echo "FAIL $1 :: $2"; fail=1; fi; }
check lib/ramips.sh 'LT500D emulator compatibility: explicit profile marker'
check lib/preinit/82_factory_mac 'LT500D emulator compatibility: no factory MTD'
check etc/rc.local '/usr/sbin/lt500d-r25-management'
check etc/config/network '192.168.10.2'
if grep -Fq '192.168.10.1' "$ROOT/etc/config/network"; then
  echo "FAIL etc/config/network still contains 192.168.10.1"
  fail=1
else
  echo "PASS etc/config/network old LAN IP removed"
fi
[ -x "$ROOT/usr/sbin/lt500d-r25-management" ] && echo "PASS management shim executable" || { echo "FAIL management shim executable"; fail=1; }
exit "$fail"
