#!/bin/bash
set -euo pipefail
[ "$#" -eq 1 ] || { echo "Usage: $0 <rootfs-dir>"; exit 1; }
ROOT="$(cd "$1" && pwd)"
SYSINFO="$ROOT/lib/preinit/02_sysinfo"
NETWORK="$ROOT/etc/board.d/02_network"
BOOT="$ROOT/etc/init.d/boot"
MOUNTROOT="$ROOT/lib/preinit/80_mount_root"
DONE="$ROOT/etc/init.d/done"
UHTTPD="$ROOT/etc/config/uhttpd"
RCLOCAL="$ROOT/etc/rc.local"
for f in "$ROOT/etc/openwrt_release" "$SYSINFO" "$NETWORK" "$BOOT" "$MOUNTROOT" "$DONE" "$UHTTPD" "$RCLOCAL"; do
  [ -f "$f" ] || { echo "Missing target file: $f"; exit 1; }
done
grep -q "DISTRIB_RELEASE='23.05.5'" "$ROOT/etc/openwrt_release"
grep -q "DISTRIB_TARGET='ramips/mt76x8'" "$ROOT/etc/openwrt_release"
grep -q "DISTRIB_ARCH='mipsel_24kc'" "$ROOT/etc/openwrt_release"
python3 - "$SYSINFO" "$NETWORK" "$BOOT" "$MOUNTROOT" "$DONE" "$UHTTPD" "$RCLOCAL" <<'PY'
from pathlib import Path
import sys
sysinfo,network,boot,mountroot,done,uhttpd,rclocal=map(Path,sys.argv[1:])
s=sysinfo.read_text(); marker='LT500D OpenWrt 23.05.5 emulator: force cudy,lt500-v2 identity'
if marker not in s:
 old='do_sysinfo_generic() {\n\t[ -d /proc/device-tree ] || return\n'
 new='do_sysinfo_generic() {\n\t# '+marker+'\n\tif grep -qw "LT500D_OWRT_EMU=1" /proc/cmdline 2>/dev/null; then\n\t\tmkdir -p /tmp/sysinfo\n\t\techo "cudy,lt500-v2" > /tmp/sysinfo/board_name\n\t\techo "Cudy LT500D V2 (OpenWrt 23.05.5 emulator)" > /tmp/sysinfo/model\n\t\treturn 0\n\tfi\n\t[ -d /proc/device-tree ] || return\n'
 if old not in s: raise SystemExit('02_sysinfo signature not found')
 sysinfo.write_text(s.replace(old,new,1))
s=network.read_text(); marker='LT500D OpenWrt 23.05.5 emulator: QEMU physical network mapping'
if marker not in s:
 old='\tcudy,lt500-v2)\n\t\tucidef_add_switch "switch0" \\\n\t\t\t"0:lan" "1:lan" "2:lan" "4:lan" "3:wan" "6@eth0"\n\t\t;;'
 new='\tcudy,lt500-v2)\n\t\t# '+marker+'\n\t\tif grep -qw "LT500D_OWRT_EMU=1" /proc/cmdline 2>/dev/null; then\n\t\t\tucidef_set_interface "lan" device "eth1" protocol "static" ipaddr "192.168.10.2" netmask "255.255.255.0"\n\t\t\tucidef_set_interface "wan" device "eth0" protocol "dhcp"\n\t\telse\n\t\t\tucidef_add_switch "switch0" \\\n\t\t\t\t"0:lan" "1:lan" "2:lan" "4:lan" "3:wan" "6@eth0"\n\t\tfi\n\t\t;;'
 if old not in s: raise SystemExit('LT500D 02_network signature not found')
 network.write_text(s.replace(old,new,1))
s=boot.read_text(); marker='LT500D OpenWrt 23.05.5 emulator: skip incompatible target kmodloader'
if marker not in s:
 old='\t/sbin/kmodloader\n'
 new='\t# '+marker+'\n\tif grep -qw "LT500D_OWRT_EMU=1" /proc/cmdline 2>/dev/null; then\n\t\techo "LT500D_OWRT_EMU: skip target kmodloader" > /dev/console 2>/dev/null || true\n\telse\n\t\t/sbin/kmodloader\n\tfi\n'
 if s.count(old)!=1: raise SystemExit('boot kmodloader signature not found')
 boot.write_text(s.replace(old,new,1))
s=mountroot.read_text(); marker='LT500D OpenWrt 23.05.5 emulator: writable ext2 root'
if marker not in s:
 old='do_mount_root() {\n\tmount_root\n\tboot_run_hook preinit_mount_root\n}'
 new='do_mount_root() {\n\t# '+marker+'\n\tif grep -qw "LT500D_OWRT_EMU=1" /proc/cmdline 2>/dev/null; then\n\t\tboot_run_hook preinit_mount_root\n\t\treturn 0\n\tfi\n\tmount_root\n\tboot_run_hook preinit_mount_root\n}'
 if old not in s: raise SystemExit('80_mount_root signature not found')
 mountroot.write_text(s.replace(old,new,1))
s=done.read_text(); marker='LT500D OpenWrt 23.05.5 emulator: no overlay finalization'
if marker not in s:
 old='\tmount_root done\n'
 new='\t# '+marker+' on ext2 root\n\tgrep -qw "LT500D_OWRT_EMU=1" /proc/cmdline 2>/dev/null || mount_root done\n'
 if s.count(old)!=1: raise SystemExit('done mount_root signature not found')
 done.write_text(s.replace(old,new,1))
s=uhttpd.read_text()
if 'option rfc1918_filter\t1' in s: s=s.replace('option rfc1918_filter\t1','option rfc1918_filter\t0',1)
elif 'option rfc1918_filter 1' in s: s=s.replace('option rfc1918_filter 1','option rfc1918_filter 0',1)
elif not ('option rfc1918_filter\t0' in s or 'option rfc1918_filter 0' in s): raise SystemExit('uhttpd rfc1918_filter signature not found')
uhttpd.write_text(s)
s=rclocal.read_text(); line='echo "LT500D_OWRT_EMU_BOOT=PASS" > /tmp/RE-lt500d-openwrt-23.05.5-boot-gate'
if line not in s:
 if '\nexit 0' not in s: raise SystemExit('rc.local exit marker not found')
 rclocal.write_text(s.replace('\nexit 0','\n'+line+'\n\nexit 0',1))
PY
find "$ROOT" -name '.DS_Store' -type f -delete 2>/dev/null || true
echo "LT500D_OPENWRT_PREPARE_GATE=PASS"
