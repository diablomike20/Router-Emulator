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
    FW="$(cd "$(dirname "$1")" && pwd)/$(basename "$1")"
    WORK="${2:-$ROOT/scratch/lt500d-r25-macos}"
    mkdir -p "$WORK"
    WORK="$(cd "$WORK" && pwd)"

    # The donor SquashFS contains Linux filenames that differ only by case
    # (for example xt_DSCP.ko / xt_dscp.ko). Default macOS APFS is normally
    # case-insensitive, so extract/build inside a temporary HFSX volume.
    TMP="$(mktemp -d)"
    DISK="$TMP/RE-LT500D-case-sensitive.sparseimage"
    MOUNT="$TMP/mnt"
    mkdir -p "$MOUNT"
    cleanup_case_volume() {
      hdiutil detach "$MOUNT" -quiet >/dev/null 2>&1 || true
      rm -rf "$TMP"
    }
    trap cleanup_case_volume EXIT INT TERM

    hdiutil create -quiet -size 2g -type SPARSE -fs HFSX -volname RE_LT500D_CASE "$DISK"
    hdiutil attach -quiet -mountpoint "$MOUNT" "$DISK"
    CASE_WORK="$MOUNT/work"
    mkdir -p "$CASE_WORK"

    "$ROOT/scripts/make.lt500d-r25-emulator.macos.sh" "$FW" "$CASE_WORK"
    cp "$CASE_WORK/image.raw" "$WORK/image.raw"
    [ ! -f "$CASE_WORK/unsquashfs.log" ] || cp "$CASE_WORK/unsquashfs.log" "$WORK/unsquashfs.log"
    sync
    cleanup_case_volume
    trap - EXIT INT TERM
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
