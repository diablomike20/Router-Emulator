#!/bin/bash
set -euo pipefail
[ "$#" -eq 2 ] || { echo "Usage: $0 <openwrt-23.05.5-ramips-mt76x8-cudy_lt500-v2.bin> <work-dir>"; exit 1; }
ROOT="$(cd "$(dirname "$0")/.." && pwd)"; FW="$(cd "$(dirname "$1")" && pwd)/$(basename "$1")"; WORK="$2"
EXPECTED_SHA=3d8bb8eac7396f8263e90ecf14eca0f324ea6dbb295106e72b0a96753f31255b
EXPECTED_SIZE=9306901
SQUASH_OFFSET=2630830
hashval(){ if command -v sha256sum >/dev/null; then sha256sum "$1"|awk '{print $1}'; else shasum -a 256 "$1"|awk '{print $1}'; fi; }
[ -f "$FW" ] || { echo "Missing firmware: $FW"; exit 1; }
[ "$(hashval "$FW")" = "$EXPECTED_SHA" ] || { echo "Firmware SHA256 mismatch"; exit 1; }
[ "$(wc -c < "$FW" | tr -d ' ')" = "$EXPECTED_SIZE" ] || { echo "Firmware size mismatch"; exit 1; }
for c in python3 unsquashfs; do command -v "$c" >/dev/null || { echo "Missing $c"; exit 1; }; done
mkdir -p "$WORK"; DONOR="$WORK/source-rootfs"; GUEST="$WORK/rootfs"; SQUASH="$WORK/rootfs.squashfs"; IMAGE="$WORK/image.raw"
rm -rf "$DONOR" "$GUEST" "$SQUASH"
python3 - "$FW" "$SQUASH" "$SQUASH_OFFSET" <<'PY'
from pathlib import Path
import sys
src,dst,off=sys.argv[1],sys.argv[2],int(sys.argv[3]); b=Path(src).read_bytes(); data=b[off:]
if data[:4]!=b'hsqs': raise SystemExit('SquashFS magic mismatch')
Path(dst).write_bytes(data); print('squashfs_offset=%d squashfs_bytes=%d'%(off,len(data)))
PY
unsquashfs -d "$DONOR" "$SQUASH" >"$WORK/unsquashfs.log" 2>&1 || { tail -50 "$WORK/unsquashfs.log"; exit 1; }
for p in sbin/procd etc/openwrt_release etc/board.d/02_network lib/preinit/02_sysinfo usr/sbin/uhttpd www/cgi-bin/luci; do [ -e "$DONOR/$p" ] || { echo "Extracted rootfs missing /$p"; exit 1; }; done
rm -rf "$GUEST"; mkdir -p "$GUEST"; cp -a "$DONOR"/. "$GUEST"/
"$ROOT/scripts/RE-prepare.lt500d-openwrt-23.05.5-rootfs.sh" "$GUEST"
"$ROOT/scripts/RE-verify.lt500d-openwrt-23.05.5-rootfs.sh" "$GUEST"
"$ROOT/scripts/RE-bootstrap.lt500d-openwrt-23.05.5.sh"
mkdir -p "$GUEST/firmadyne" "$GUEST/firmadyne/libnvram" "$GUEST/firmadyne/libnvram.override"
for n in busybox console gdb gdbserver strace libnvram.so libnvram_ioctl.so; do cp "$ROOT/binaries/$n.mipsel" "$GUEST/firmadyne/$n"; chmod +x "$GUEST/firmadyne/$n" 2>/dev/null || true; done
cp "$ROOT/scripts/preInit.sh" "$GUEST/firmadyne/preInit.sh"; cp "$ROOT/scripts/run_service.sh" "$GUEST/firmadyne/run_service.sh"; chmod +x "$GUEST/firmadyne/"*.sh; ln -sf /firmadyne/busybox "$GUEST/firmadyne/sh"
rm -f "$IMAGE"; "$ROOT/scripts/RE-build.lt500d-openwrt-23.05.5-image.sh" "$GUEST" "$IMAGE"
echo LT500D_OPENWRT_BUILD_GATE=PASS
echo "image=$IMAGE"
echo 'HTTP=http://127.0.0.1:18080/ HTTPS=https://127.0.0.1:18443/'
