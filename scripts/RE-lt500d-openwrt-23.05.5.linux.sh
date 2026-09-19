#!/bin/bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"; A="${1:-}"; shift || true
usage(){ echo "Usage: $0 Setup|Check|Build|Start|Smoke [args]"; }
case "$A" in
 Setup) sudo apt-get update; sudo apt-get install -y qemu-system-mips qemu-utils squashfs-tools e2fsprogs unzip curl python3 perl libdigest-sha-perl ca-certificates file binutils; "$0" Check ;;
 Check) for c in qemu-system-mipsel qemu-img unsquashfs python3 curl mke2fs debugfs; do command -v "$c" >/dev/null || { echo "MISS $c"; exit 1; }; done; echo LT500D_OWRT_LINUX_CHECK=PASS ;;
 Build) [ "$#" -ge 1 ] || { usage; exit 1; }; "$ROOT/scripts/RE-make.lt500d-openwrt-23.05.5-emulator.sh" "$1" "${2:-$ROOT/scratch/lt500d-openwrt-23.05.5}" ;;
 Start) exec "$ROOT/scripts/RE-start.lt500d-openwrt-23.05.5.sh" "${1:-$ROOT/scratch/lt500d-openwrt-23.05.5/image.raw}" ;;
 Smoke) "$ROOT/scripts/RE-smoke.lt500d-openwrt-23.05.5.sh" ;;
 *) usage; exit 1 ;;
esac
