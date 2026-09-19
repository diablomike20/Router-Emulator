#!/bin/bash
# Build a bootable LT500D R25 ext2 disk image on macOS without loop mounts.
# Requires qemu-img, python3 and Homebrew e2fsprogs (mke2fs + debugfs).
set -euo pipefail
if [ "$#" -lt 2 ]; then echo "Usage: $0 <prepared-rootfs-dir> <image.raw> [size-MiB]"; exit 1; fi
ROOTFS="$(cd "$1" && pwd)"
OUT="$2"
SIZE="${3:-512}"

find_e2tool() {
  local n="$1" p
  p="$(command -v "$n" || true)"
  [ -n "$p" ] && { echo "$p"; return; }
  for p in "/usr/local/opt/e2fsprogs/sbin/$n" "/opt/homebrew/opt/e2fsprogs/sbin/$n"; do
    [ -x "$p" ] && { echo "$p"; return; }
  done
  return 1
}
MKE2FS="$(find_e2tool mke2fs || true)"
DEBUGFS="$(find_e2tool debugfs || true)"
for c in qemu-img python3; do command -v "$c" >/dev/null || { echo "Missing $c"; exit 1; }; done
[ -n "$MKE2FS" ] && [ -n "$DEBUGFS" ] || { echo "Missing e2fsprogs tools (mke2fs/debugfs)."; echo "Verified Homebrew formula: e2fsprogs"; exit 1; }
[ -x "$ROOTFS/sbin/procd" ] || { echo "Not an OpenWrt/Cudy rootfs: missing sbin/procd"; exit 1; }

TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT
FS="$TMP/root.ext2"
BLOCKS=$((SIZE*1024))

# -d populates from the donor tree without a macOS loop mount.
# Keep the on-disk format conservative for the FirmAE 4.1 kernel.
"$MKE2FS" -q -t ext2 -b 1024 -I 128 -O ^metadata_csum,^64bit -d "$ROOTFS" "$FS" "$BLOCKS"

# unsquashfs on an unprivileged macOS host cannot be trusted to materialize
# Linux character devices. Create the minimal early-boot nodes directly in
# the ext2 image; debugfs edits the image file and does not require host mknod.
ensure_dir() {
  local rel="${1#/}" out
  out="$("$DEBUGFS" -R "stat $rel" "$FS" 2>&1 || true)"
  if ! printf '%s\n' "$out" | grep -q "Inode:"; then
    out="$("$DEBUGFS" -w -R "mkdir $rel" "$FS" 2>&1)" || {
      echo "debugfs mkdir failed for /$rel"
      printf '%s\n' "$out"
      exit 1
    }
  fi
}

ensure_node() {
  local path="$1" type="$2" major="$3" minor="$4" rel out
  rel="${path#/}"
  out="$("$DEBUGFS" -R "stat $rel" "$FS" 2>&1 || true)"
  if ! printf '%s\n' "$out" | grep -q "Inode:"; then
    out="$("$DEBUGFS" -w -R "mknod $rel $type $major $minor" "$FS" 2>&1)" || {
      echo "debugfs mknod failed for $path"
      printf '%s\n' "$out"
      exit 1
    }
  fi
  out="$("$DEBUGFS" -R "stat $rel" "$FS" 2>&1 || true)"
  if ! printf '%s\n' "$out" | grep -q "Inode:"; then
    echo "Failed to create $path"
    printf '%s\n' "$out"
    exit 1
  fi
}

ensure_dir /dev
ensure_node /dev/console c 5 1
ensure_node /dev/null c 1 3
ensure_node /dev/zero c 1 5
ensure_node /dev/tty c 5 0
ensure_node /dev/ptmx c 5 2
ensure_node /dev/ttyS0 c 4 64
ensure_node /dev/random c 1 8
ensure_node /dev/urandom c 1 9

# FirmAE kernel expects /dev/sda1, so wrap the filesystem in an MBR partition.
qemu-img create -f raw "$OUT" "$((SIZE+2))M" >/dev/null
python3 - "$OUT" "$FS" <<'PY'
import os, struct, sys
out, fs = sys.argv[1:3]
fs_size=os.path.getsize(fs)
start=2048
sectors=(fs_size+511)//512
mbr=bytearray(512)
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
