#!/bin/bash
set -euo pipefail
missing=0
for c in qemu-system-mipsel qemu-img curl python3 unsquashfs; do
 if command -v "$c" >/dev/null; then echo "PASS $c: $(command -v "$c")"; else echo "MISS $c"; missing=1; fi
done
MKE2FS="$(command -v mke2fs || true)"
[ -n "$MKE2FS" ] || [ ! -x /usr/local/opt/e2fsprogs/sbin/mke2fs ] || MKE2FS=/usr/local/opt/e2fsprogs/sbin/mke2fs
[ -n "$MKE2FS" ] || [ ! -x /opt/homebrew/opt/e2fsprogs/sbin/mke2fs ] || MKE2FS=/opt/homebrew/opt/e2fsprogs/sbin/mke2fs
if [ -n "$MKE2FS" ]; then echo "PASS mke2fs: $MKE2FS"; else echo "MISS mke2fs (brew install e2fsprogs)"; missing=1; fi
exit "$missing"
