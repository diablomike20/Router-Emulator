#!/bin/bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"; BIN="$ROOT/binaries"; mkdir -p "$BIN"
for c in qemu-system-mipsel curl; do command -v "$c" >/dev/null || { echo "ERROR: missing $c"; exit 1; }; done
fetch(){ local n="$1" u="$2"; if [ ! -s "$BIN/$n" ]; then curl -fL --retry 3 --retry-delay 1 -o "$BIN/$n.part" "$u"; mv "$BIN/$n.part" "$BIN/$n"; fi; }
fetch vmlinux.mipsel.4 https://github.com/pr0v3rbs/FirmAE_kernel-v4.1/releases/download/v1.0/vmlinux.mipsel.4
for n in busybox console gdb gdbserver strace; do fetch "$n.mipsel" "https://github.com/pr0v3rbs/FirmAE/releases/download/v1.0/$n.mipsel"; done
for n in libnvram.so libnvram_ioctl.so; do fetch "$n.mipsel" "https://github.com/pr0v3rbs/FirmAE/releases/download/v1.0/$n.mipsel"; done
qemu-system-mipsel --version | head -1
for n in vmlinux.mipsel.4 busybox.mipsel console.mipsel gdb.mipsel gdbserver.mipsel strace.mipsel libnvram.so.mipsel libnvram_ioctl.so.mipsel; do [ -s "$BIN/$n" ] || exit 1; done
echo LT500D_OPENWRT_BOOTSTRAP_GATE=PASS
