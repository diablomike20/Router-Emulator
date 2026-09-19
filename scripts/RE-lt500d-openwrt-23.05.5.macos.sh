#!/bin/bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"; A="${1:-}"; shift || true
usage(){ echo "Usage: $0 Setup|Check|Build|Start|Smoke [args]"; }
case "$A" in
 Setup) command -v brew >/dev/null || { echo 'Homebrew required'; exit 1; }; brew install qemu squashfs e2fsprogs; "$0" Check ;;
 Check) for c in qemu-system-mipsel qemu-img unsquashfs python3 curl; do command -v "$c" >/dev/null || { echo "MISS $c"; exit 1; }; done; for c in mke2fs debugfs; do [ -x "/usr/local/opt/e2fsprogs/sbin/$c" ] || [ -x "/opt/homebrew/opt/e2fsprogs/sbin/$c" ] || { echo "MISS Homebrew $c"; exit 1; }; done; echo LT500D_OWRT_MACOS_CHECK=PASS ;;
 Build) [ "$#" -ge 1 ] || { usage; exit 1; }; "$ROOT/scripts/RE-make.lt500d-openwrt-23.05.5-emulator.sh" "$1" "${2:-$ROOT/scratch/lt500d-openwrt-23.05.5}" ;;
 Start) exec "$ROOT/scripts/RE-start.lt500d-openwrt-23.05.5.sh" "${1:-$ROOT/scratch/lt500d-openwrt-23.05.5/image.raw}" ;;
 Smoke) "$ROOT/scripts/RE-smoke.lt500d-openwrt-23.05.5.sh" ;;
 *) usage; exit 1 ;;
esac
