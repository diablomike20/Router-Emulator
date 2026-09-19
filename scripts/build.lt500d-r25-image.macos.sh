#!/bin/bash
# Build a bootable LT500D R25 ext2 disk image on macOS without loop mounts.
# Requires: qemu-img, e2fsprogs (mke2fs), fakeroot, genext2fs.
set -euo pipefail
if [ "$#" -lt 2 ]; then echo "Usage: $0 <prepared-rootfs-dir> <image.raw> [size-MiB]"; exit 1; fi
ROOTFS="$(cd "$1" && pwd)"
OUT="$2"
SIZE="${3:-512}"
for c in qemu-img mke2fs genext2fs fakeroot; do command -v "$c" >/dev/null || { echo "Missing $c"; exit 1; }; done
[ -x "$ROOTFS/sbin/procd" ] || { echo "Not an OpenWrt/Cudy rootfs: missing sbin/procd"; exit 1; }
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT
FS="$TMP/root.ext2"
BLOCKS=$((SIZE*1024))
# genext2fs populates an ext2 filesystem directly from a directory: no macOS mount/loop device.
fakeroot genext2fs -d "$ROOTFS" -b "$BLOCKS" -i 32768 -U "$FS"
# FirmAE kernel expects /dev/sda1, so wrap filesystem in an MBR partition at sector 2048.
qemu-img create -f raw "$OUT" "$((SIZE+2))M" >/dev/null
python3 - "$OUT" "$FS" <<'PY'
from pathlib import Path
import os, struct, sys
out, fs = sys.argv[1:3]
fs_size=os.path.getsize(fs)
start=2048
sectors=(fs_size+511)//512
mbr=bytearray(512)
# Linux partition type 0x83. CHS fields deliberately saturated/ignored by modern kernels.
entry=bytearray(16)
entry[0]=0
entry[1:4]=b'\xfe\xff\xff'
entry[4]=0x83
entry[5:8]=b'\xfe\xff\xff'
entry[8:12]=struct.pack('<I',start)
entry[12:16]=struct.pack('<I',sectors)
mbr[446:462]=entry
mbr[510:512]=b'\x55\xaa'
with open(out,'r+b') as o:
    o.write(mbr)
    o.seek(start*512)
    with open(fs,'rb') as f:
        while True:
            b=f.read(1024*1024)
            if not b: break
            o.write(b)
print(f"image={out} start_sector={start} fs_bytes={fs_size} sectors={sectors}")
PY
echo "PASS: LT500D image created: $OUT"
