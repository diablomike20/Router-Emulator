#!/bin/bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
ACTION="${1:-}"
shift || true

usage() {
  cat <<'EOF'
RE LT500D R25 emulator — macOS x86_64

Usage:
  RE-lt500d-r25.macos.sh Setup
  RE-lt500d-r25.macos.sh Check
  RE-lt500d-r25.macos.sh Build <LT500V2-R25-2.4.16-20250804-150319-flash.bin> [work-dir]
  RE-lt500d-r25.macos.sh Start [image.raw]
  RE-lt500d-r25.macos.sh Smoke
EOF
}

case "$ACTION" in
  Setup)
    command -v brew >/dev/null || { echo "ERROR: Homebrew is required for Setup"; exit 1; }
    brew install qemu squashfs e2fsprogs
    "$0" Check
    echo "MACOS_SETUP_GATE=PASS"
    ;;
  Check)
    "$ROOT/scripts/check.lt500d-r25-macos.sh"
    echo "MACOS_CHECK_GATE=PASS"
    ;;
  Build)
    [ "$#" -ge 1 ] || { usage; exit 1; }
    FW="$1"
    WORK="${2:-$ROOT/scratch/lt500d-r25-macos}"
    "$ROOT/scripts/make.lt500d-r25-emulator.macos.sh" "$FW" "$WORK"
    echo "MACOS_BUILD_GATE=PASS image=$WORK/image.raw"
    ;;
  Start)
    IMAGE="${1:-$ROOT/scratch/lt500d-r25-macos/image.raw}"
    exec "$ROOT/scripts/start.lt500d-r25.sh" "$IMAGE"
    ;;
  Smoke)
    "$ROOT/scripts/smoke.lt500d-r25-http.sh" /tmp/RE-lt500d-r25-macos-smoke
    echo "MACOS_SMOKE_GATE=PASS"
    ;;
  *)
    usage
    exit 1
    ;;
esac
