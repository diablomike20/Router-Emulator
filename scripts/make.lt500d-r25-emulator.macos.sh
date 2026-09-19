#!/bin/bash
# LT500D R25 Emulator v1 one-shot macOS pipeline:
# original Cudy flash.bin -> donor SquashFS -> compatibility guest -> image.raw.
set -euo pipefail
if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <LT500V2-R25-2.4.16-20250804-150319-flash.bin> <work-dir>"
  exit 1
fi
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
FLASH="$(cd "$(dirname "$1")" && pwd)/$(basename "$1")"
WORK="$2"
DONOR="$WORK/donor-rootfs"
GUEST="$WORK/rootfs"
IMAGE="$WORK/image.raw"
SQUASH="$WORK/rootfs.squashfs"
EXPECTED_SHA="57aed945a9f485d178d73a844e420fc2b441e60821e243d3d19d07dd4a3143d6"
EXPECTED_SIZE=12124315
SQUASH_OFFSET=$((0x2a7d4d))

[ -f "$FLASH" ] || { echo "Missing donor firmware: $FLASH"; exit 1; }
ACTUAL_SHA="$(shasum -a 256 "$FLASH" | awk '{print $1}')"
ACTUAL_SIZE="$(wc -c < "$FLASH" | tr -d ' ')"
[ "$ACTUAL_SHA" = "$EXPECTED_SHA" ] || { echo "Donor SHA256 mismatch: $ACTUAL_SHA"; exit 1; }
[ "$ACTUAL_SIZE" = "$EXPECTED_SIZE" ] || { echo "Donor size mismatch: $ACTUAL_SIZE"; exit 1; }

mkdir -p "$WORK"
echo "[1/6] Host prerequisites + FirmAE runtime artifacts"
"$ROOT/scripts/check.lt500d-r25-macos.sh"
"$ROOT/scripts/bootstrap.lt500d-r25.macos.sh"

echo "[2/6] Extract verified donor SquashFS at 0x2a7d4d"
rm -rf "$DONOR" "$SQUASH"
python3 - "$FLASH" "$SQUASH" "$SQUASH_OFFSET" <<'PY'
import sys
src, dst, off = sys.argv[1], sys.argv[2], int(sys.argv[3])
with open(src, "rb") as f:
    f.seek(off)
    data=f.read()
if data[:4] != b"hsqs":
    raise SystemExit("SquashFS magic not found at verified offset")
with open(dst, "wb") as f:
    f.write(data)
print("squashfs_bytes=%d" % len(data))
PY
unsquashfs -d "$DONOR" "$SQUASH" >/dev/null
[ -x "$DONOR/sbin/procd" ] || { echo "Extracted donor rootfs missing /sbin/procd"; exit 1; }

echo "[3/6] Copy donor rootfs (extraction remains untouched)"
rm -rf "$GUEST"
mkdir -p "$GUEST"
cp -a "$DONOR"/. "$GUEST"/

echo "[4/6] Assemble LT500D compatibility guest"
"$ROOT/scripts/assemble.lt500d-r25-guest.sh" "$GUEST"

echo "[5/6] Build mountless MBR/ext2 disk"
rm -f "$IMAGE"
"$ROOT/scripts/build.lt500d-r25-image.macos.sh" "$GUEST" "$IMAGE"

echo "[6/6] Ready"
echo "Start: $ROOT/scripts/start.lt500d-r25.sh $IMAGE"
echo "Gate:  $ROOT/scripts/smoke.lt500d-r25-http.sh"
