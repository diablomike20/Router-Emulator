#!/bin/bash
# LT500D R25 Emulator v1 host pipeline (macOS).
set -euo pipefail
if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <extracted-donor-rootfs> <work-dir>"
  exit 1
fi
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
DONOR="$(cd "$1" && pwd)"
WORK="$2"
GUEST="$WORK/rootfs"
IMAGE="$WORK/image.raw"
mkdir -p "$WORK"
echo "[1/5] Host prerequisites + FirmAE kernel"
"$ROOT/scripts/bootstrap.lt500d-r25.macos.sh"
echo "[2/5] Copy donor rootfs (original remains untouched)"
rm -rf "$GUEST"
mkdir -p "$GUEST"
cp -a "$DONOR"/. "$GUEST"/
echo "[3/5] Assemble LT500D compatibility guest"
"$ROOT/scripts/assemble.lt500d-r25-guest.sh" "$GUEST"
echo "[4/5] Build mountless MBR/ext2 disk"
rm -f "$IMAGE"
"$ROOT/scripts/build.lt500d-r25-image.macos.sh" "$GUEST" "$IMAGE"
echo "[5/5] Ready"
echo "Start: $ROOT/scripts/start.lt500d-r25.sh $IMAGE"
echo "Gate:  $ROOT/scripts/smoke.lt500d-r25-http.sh"
