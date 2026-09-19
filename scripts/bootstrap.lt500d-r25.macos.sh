#!/bin/bash
# Fetch only the FirmAE artifacts required by the LT500D R25 macOS guest.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
BIN="$ROOT/binaries"
mkdir -p "$BIN"
for c in qemu-system-mipsel curl shasum; do command -v "$c" >/dev/null || { echo "ERROR: missing $c"; exit 1; }; done

fetch() {
  local name="$1" url="$2"
  if [ ! -s "$BIN/$name" ]; then
    echo "Fetching $name"
    curl -fL --retry 3 --retry-delay 1 -o "$BIN/$name.part" "$url"
    mv "$BIN/$name.part" "$BIN/$name"
  fi
}

fetch vmlinux.mipsel.4 https://github.com/pr0v3rbs/FirmAE_kernel-v4.1/releases/download/v1.0/vmlinux.mipsel.4
for name in busybox console gdb gdbserver strace; do
  fetch "$name.mipsel" "https://github.com/pr0v3rbs/FirmAE/releases/download/v1.0/$name.mipsel"
done
for name in libnvram.so libnvram_ioctl.so; do
  fetch "$name.mipsel" "https://github.com/pr0v3rbs/FirmAE/releases/download/v1.0/$name.mipsel"
done

qemu-system-mipsel --version | head -1
echo "FirmAE artifacts:"
for name in vmlinux.mipsel.4 busybox.mipsel console.mipsel gdb.mipsel gdbserver.mipsel strace.mipsel libnvram.so.mipsel libnvram_ioctl.so.mipsel; do
  [ -s "$BIN/$name" ] || { echo "ERROR: missing/empty $BIN/$name"; exit 1; }
  shasum -a 256 "$BIN/$name"
done
echo "Host bootstrap PASS"
