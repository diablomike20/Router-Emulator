#!/bin/bash
set -euo pipefail
ROOT="${1:?Usage: $0 <rootfs-dir>}"
SELF="$(cd "$(dirname "$0")" && pwd)"
"$SELF/RE-prepare.f9k1103-v1-candidate-15-rootfs.sh" "$ROOT"
for required in sbin/procd bin/busybox etc/preinit lib/ramips.sh usr/lib/lua/luci/dispatcher.lua www/cgi-bin/luci etc/rom_version; do
  [ -e "$ROOT/$required" ] || { echo "Missing Candidate-15R2 /$required"; exit 1; }
done
grep -q '2.4.25-F9K1103-Cudy-C15R2' "$ROOT/etc/rom_version"
grep -q 'checkuser = (user == "admin") and "root" or user' "$ROOT/usr/lib/lua/luci/dispatcher.lua"
mkdir -p "$ROOT/firmadyne" "$ROOT/firmadyne/libnvram" "$ROOT/firmadyne/libnvram.override"
for n in busybox console gdb gdbserver strace libnvram.so libnvram_ioctl.so; do
  src="$SELF/../binaries/$n.mipsel"; [ -f "$src" ] || { echo "Missing FirmAE helper: $src"; exit 1; }
  cp "$src" "$ROOT/firmadyne/$n"; chmod +x "$ROOT/firmadyne/$n" 2>/dev/null || true
done
cp "$SELF/preInit.sh" "$ROOT/firmadyne/preInit.sh"
cp "$SELF/run_service.sh" "$ROOT/firmadyne/run_service.sh"
chmod +x "$ROOT/firmadyne/"*.sh
ln -sf /firmadyne/busybox "$ROOT/firmadyne/sh"
echo 'F9K1103_V1_CANDIDATE15_GUEST_GATE=PASS'
