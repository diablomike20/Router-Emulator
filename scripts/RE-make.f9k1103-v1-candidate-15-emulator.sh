#!/bin/bash
set -euo pipefail
[ "$#" -eq 2 ] || { echo "Usage: $0 <Candidate-15-sysupgrade.bin> <work-dir>"; exit 1; }
ROOT="$(cd "$(dirname "$0")/.." && pwd)"; FLASH="$(cd "$(dirname "$1")" && pwd)/$(basename "$1")"; WORK="$2"
SQUASH="$WORK/rootfs.squashfs"; DONOR="$WORK/rootfs-extracted"; GUEST="$WORK/rootfs"; IMAGE="$WORK/image.raw"
EXPECTED_SHA='007246db91aa6661d3f2055ae35b3fbcec399ed238202867206e460bbab06e54'; EXPECTED_SIZE=6267492
[ -f "$FLASH" ] || { echo "Missing Candidate-15 image: $FLASH"; exit 1; }
ACTUAL_SHA="$(sha256sum "$FLASH" | awk '{print $1}')"; ACTUAL_SIZE="$(stat -c %s "$FLASH" 2>/dev/null || wc -c < "$FLASH" | tr -d ' ')"
[ "$ACTUAL_SHA" = "$EXPECTED_SHA" ] || { echo "Candidate-15 SHA mismatch: $ACTUAL_SHA"; exit 1; }
[ "$ACTUAL_SIZE" = "$EXPECTED_SIZE" ] || { echo "Candidate-15 size mismatch: $ACTUAL_SIZE"; exit 1; }
mkdir -p "$WORK"
bash "$ROOT/scripts/bootstrap.lt500d-r25.macos.sh"
python3 - "$FLASH" "$SQUASH" <<'PY'
from pathlib import Path
import struct,sys
src,dst=sys.argv[1:3]; b=Path(src).read_bytes(); off=b.find(b'hsqs')
if off<0: raise SystemExit('SquashFS magic missing')
used=struct.unpack_from('<Q',b,off+40)[0]
if off+used>len(b): raise SystemExit('invalid SquashFS bytes_used')
Path(dst).write_bytes(b[off:off+used]); print(f'squashfs_offset={off} squashfs_bytes={used}')
PY
rm -rf "$DONOR" "$GUEST"
if [ "$(id -u)" -eq 0 ]; then unsquashfs -no-progress -d "$DONOR" "$SQUASH" >/dev/null; elif command -v sudo >/dev/null 2>&1; then sudo unsquashfs -no-progress -d "$DONOR" "$SQUASH" >/dev/null; sudo chown -R "$(id -u):$(id -g)" "$DONOR"; else set +e; unsquashfs -no-progress -d "$DONOR" "$SQUASH" >/tmp/RE-f9k1103-c15-unsquashfs.log 2>&1; rc=$?; set -e; [ "$rc" -eq 0 ] || echo "WARN unsquashfs rc=$rc"; fi
for required in sbin/procd bin/busybox lib/ramips.sh etc/rom_version usr/lib/lua/luci/dispatcher.lua; do [ -e "$DONOR/$required" ] || { echo "Extracted Candidate-15 missing /$required"; exit 1; }; done
mkdir -p "$GUEST"; cp -a "$DONOR"/. "$GUEST"/
bash "$ROOT/scripts/RE-assemble.f9k1103-v1-candidate-15-guest.sh" "$GUEST"
bash "$ROOT/scripts/RE-build.f9k1103-v1-candidate-15-image.sh" "$GUEST" "$IMAGE"
echo 'F9K1103_V1_CANDIDATE15_MAKE_GATE=PASS'; echo "image=$IMAGE"
