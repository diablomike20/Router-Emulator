#!/bin/bash
set -euo pipefail
[ "$#" -eq 1 ] || exit 1
R="$(cd "$1" && pwd)"; fail=0
ck(){ grep -Fq "$2" "$R/$1" && echo "PASS $1" || { echo "FAIL $1 :: $2"; fail=1; }; }
ck etc/openwrt_release "DISTRIB_RELEASE='23.05.5'"
ck etc/openwrt_release "DISTRIB_TARGET='ramips/mt76x8'"
ck etc/openwrt_release "DISTRIB_ARCH='mipsel_24kc'"
ck lib/preinit/02_sysinfo 'echo "cudy,lt500-v2" > /tmp/sysinfo/board_name'
ck etc/board.d/02_network 'ucidef_set_interface "lan" device "eth1" protocol "static" ipaddr "192.168.10.2"'
ck etc/board.d/02_network 'ucidef_set_interface "wan" device "eth0" protocol "dhcp"'
ck etc/init.d/boot 'skip incompatible target kmodloader'
ck lib/preinit/80_mount_root 'writable ext2 root'
ck etc/init.d/done 'no overlay finalization'
ck etc/rc.local 'LT500D_OWRT_EMU_BOOT=PASS'
grep -Eq 'option rfc1918_filter[[:space:]]+0' "$R/etc/config/uhttpd" || fail=1
[ -x "$R/sbin/procd" ] || fail=1
[ -x "$R/usr/sbin/uhttpd" ] || fail=1
[ -e "$R/www/cgi-bin/luci" ] || fail=1
for f in "$R/lib/preinit/02_sysinfo" "$R/etc/board.d/02_network" "$R/etc/init.d/boot" "$R/lib/preinit/80_mount_root" "$R/etc/init.d/done" "$R/etc/rc.local"; do sh -n "$f" || fail=1; done
[ "$fail" -eq 0 ] || exit 1
echo LT500D_OPENWRT_ROOTFS_GATE=PASS
