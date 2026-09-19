#!/bin/bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
IMAGE="${1:-$ROOT/scratch/lt500d-openwrt-23.05.5/image.raw}"
KERNEL="${LT500D_OWRT_KERNEL:-$ROOT/binaries/vmlinux.mipsel.4}"
LOG="${LT500D_OWRT_SERIAL_LOG:-$ROOT/scratch/lt500d-openwrt-23.05.5/qemu.serial.log}"
[ -f "$IMAGE" ] || { echo "Missing image: $IMAGE"; exit 1; }
[ -f "$KERNEL" ] || { echo "Missing kernel: $KERNEL"; exit 1; }
mkdir -p "$(dirname "$LOG")"
echo 'HTTP  http://127.0.0.1:18080/'
echo 'HTTPS https://127.0.0.1:18443/'
exec "$ROOT/scripts/RE-run.lt500d-openwrt-23.05.5.mipsel.sh" "$KERNEL" "$IMAGE" "$LOG"
