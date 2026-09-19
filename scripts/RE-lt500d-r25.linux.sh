#!/bin/bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
ACTION="${1:-}"
shift || true

usage() {
  cat <<'EOF'
RE LT500D R25 emulator — Linux x86_64

Usage:
  RE-lt500d-r25.linux.sh Setup
  RE-lt500d-r25.linux.sh Check
  RE-lt500d-r25.linux.sh Build <LT500V2-R25-2.4.16-20250804-150319-flash.bin> [work-dir]
  RE-lt500d-r25.linux.sh Start [image.raw]
  RE-lt500d-r25.linux.sh Smoke
EOF
}

case "$ACTION" in
  Setup)
    command -v sudo >/dev/null || { echo "ERROR: sudo is required for Setup"; exit 1; }
    sudo apt-get update
    sudo apt-get install -y qemu-system-mips qemu-utils squashfs-tools e2fsprogs unzip curl python3 perl libdigest-sha-perl ca-certificates file binutils
    "$0" Check
    echo "LINUX_SETUP_GATE=PASS"
    ;;
  Check)
    "$ROOT/scripts/check.lt500d-r25-macos.sh"
    echo "LINUX_CHECK_GATE=PASS"
    ;;
  Build)
    [ "$#" -ge 1 ] || { usage; exit 1; }
    FW="$1"
    WORK="${2:-$ROOT/scratch/lt500d-r25-linux}"
    "$ROOT/scripts/make.lt500d-r25-emulator.macos.sh" "$FW" "$WORK"
    echo "LINUX_BUILD_GATE=PASS image=$WORK/image.raw"
    ;;
  Start)
    IMAGE="${1:-$ROOT/scratch/lt500d-r25-linux/image.raw}"
    exec "$ROOT/scripts/start.lt500d-r25.sh" "$IMAGE"
    ;;
  Smoke)
    "$ROOT/scripts/smoke.lt500d-r25-http.sh" /tmp/RE-lt500d-r25-linux-smoke
    echo "LINUX_SMOKE_GATE=PASS"
    ;;
  *)
    usage
    exit 1
    ;;
esac
