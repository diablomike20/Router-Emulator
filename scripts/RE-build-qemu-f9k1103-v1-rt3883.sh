#!/bin/bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
WORK="${1:-$ROOT/.work/rt3883-qemu}"
QEMU_TAG="${QEMU_TAG:-v8.2.10}"
QEMU_SRC="$WORK/qemu"; QEMU_BUILD="$WORK/build"
mkdir -p "$WORK"
if [ ! -d "$QEMU_SRC/.git" ]; then
  git clone --depth 1 --branch "$QEMU_TAG" https://github.com/qemu/qemu.git "$QEMU_SRC"
fi
cp "$ROOT/qemu/f9k1103-v1-rt3883/RE-rt3883-f9k1103v1.c" "$QEMU_SRC/hw/mips/rt3883_f9k1103v1.c"
python3 - "$QEMU_SRC/hw/mips/meson.build" <<'PY'
from pathlib import Path
import sys
p=Path(sys.argv[1]); s=p.read_text()
line="mips_ss.add(files('rt3883_f9k1103v1.c'))"
if line not in s:
    anchor="mips_ss.add(files('bootloader.c', 'mips_int.c'))"
    if anchor not in s: raise SystemExit("QEMU mips meson anchor not found")
    p.write_text(s.replace(anchor,anchor+"\n"+line,1))
PY
rm -rf "$QEMU_BUILD"; mkdir -p "$QEMU_BUILD"; cd "$QEMU_BUILD"
"$QEMU_SRC/configure" \
  --target-list=mipsel-softmmu \
  --disable-werror \
  --disable-jpeg \
  --disable-png \
  --disable-sdl \
  --disable-gtk \
  --disable-opengl
ninja qemu-system-mipsel
BIN="$QEMU_BUILD/qemu-system-mipsel"
"$BIN" -M help | grep -q 'rt3883-f9k1103v1'
echo RT3883_F9K1103V1_QEMU_BUILD_GATE=PASS
echo "qemu=$BIN"
