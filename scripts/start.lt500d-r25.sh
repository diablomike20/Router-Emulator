#!/bin/bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
IMAGE="${1:-$ROOT/scratch/lt500d-r25/image.raw}"
KERNEL="${LT500D_KERNEL:-$ROOT/binaries/vmlinux.mipsel.4}"
LOG="${LT500D_SERIAL_LOG:-$ROOT/scratch/lt500d-r25/qemu.serial.log}"
[ -f "$KERNEL" ] || { echo "Missing kernel: $KERNEL"; exit 1; }
[ -f "$IMAGE" ] || { echo "Missing prepared image: $IMAGE"; exit 1; }
mkdir -p "$(dirname "$LOG")"
exec "$ROOT/scripts/run.lt500d-r25.mipsel.sh" "$KERNEL" "$IMAGE" "$LOG"
