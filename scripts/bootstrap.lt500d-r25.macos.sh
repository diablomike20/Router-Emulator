#!/bin/bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
BIN="$ROOT/binaries"
mkdir -p "$BIN"
for c in qemu-system-mipsel curl shasum; do command -v "$c" >/dev/null || { echo "ERROR: missing $c"; exit 1; }; done
KERNEL="$BIN/vmlinux.mipsel.4"
URL="https://github.com/pr0v3rbs/FirmAE_kernel-v4.1/releases/download/v1.0/vmlinux.mipsel.4"
if [ ! -s "$KERNEL" ]; then
  curl -fL --retry 3 -o "$KERNEL.part" "$URL"
  mv "$KERNEL.part" "$KERNEL"
fi
qemu-system-mipsel --version | head -1
echo "Kernel: $KERNEL"
shasum -a 256 "$KERNEL"
echo "Host bootstrap PASS"
