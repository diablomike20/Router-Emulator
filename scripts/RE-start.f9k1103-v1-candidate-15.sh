#!/bin/bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"; IMAGE="${1:-$ROOT/scratch/f9k1103-v1-candidate-15/image.raw}"; KERNEL="${F9K1103_C15_KERNEL:-$ROOT/binaries/vmlinux.mipsel.4}"; LOG="${F9K1103_C15_SERIAL_LOG:-$ROOT/scratch/f9k1103-v1-candidate-15/qemu.serial.log}"
[ -f "$IMAGE" ] || { echo "Missing image: $IMAGE"; exit 1; }; [ -f "$KERNEL" ] || { echo "Missing kernel: $KERNEL"; exit 1; }; mkdir -p "$(dirname "$LOG")"
echo 'F9K1103 v1 Candidate-15 emulator'; echo 'HTTP  http://127.0.0.1:18080/'; echo 'HTTPS https://127.0.0.1:18443/'
exec "$ROOT/scripts/RE-run.f9k1103-v1-candidate-15.mipsel.sh" "$KERNEL" "$IMAGE" "$LOG"
