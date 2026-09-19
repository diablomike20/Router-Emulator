#!/bin/bash
# Turn a FirmAE-extracted LT500D rootfs into the LT500D v1 guest tree.
set -euo pipefail
ROOT="${1:?Usage: $0 <rootfs-dir>}"
SELF="$(cd "$(dirname "$0")" && pwd)"
"$SELF/prepare.lt500d-r25-rootfs.sh" "$ROOT"
"$SELF/verify.lt500d-r25-rootfs.sh" "$ROOT"

# FirmAE kernel helpers needed by the donor userspace.
mkdir -p "$ROOT/firmadyne" "$ROOT/firmadyne/libnvram" "$ROOT/firmadyne/libnvram.override"
for n in busybox console gdb gdbserver strace libnvram.so libnvram_ioctl.so; do
  src="$SELF/../binaries/$n.mipsel"
  [ -f "$src" ] || { echo "Missing FirmAE helper: $src (run ./download.sh)"; exit 1; }
  cp "$src" "$ROOT/firmadyne/$n"
  chmod +x "$ROOT/firmadyne/$n" 2>/dev/null || true
done
cp "$SELF/preInit.sh" "$ROOT/firmadyne/preInit.sh"
cp "$SELF/run_service.sh" "$ROOT/firmadyne/run_service.sh"
chmod +x "$ROOT/firmadyne/"*.sh
ln -sf /firmadyne/busybox "$ROOT/firmadyne/sh"
echo "PASS: LT500D R25 guest tree ready"
