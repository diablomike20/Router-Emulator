#!/bin/bash
set -euo pipefail
missing=0
for c in qemu-system-mipsel qemu-img curl python3 unsquashfs; do
 if command -v "$c" >/dev/null; then echo "PASS $c: $(command -v "$c")"; else echo "MISS $c"; missing=1; fi
done
find_e2tool() {
 local n="$1" p
 if [ "$(uname -s)" = "Darwin" ]; then
   for p in "/usr/local/opt/e2fsprogs/sbin/$n" "/opt/homebrew/opt/e2fsprogs/sbin/$n"; do
     [ -x "$p" ] && { echo "$p"; return; }
   done
 fi
 p="$(command -v "$n" || true)"
 [ -n "$p" ] && { echo "$p"; return; }
 for p in "/usr/local/opt/e2fsprogs/sbin/$n" "/opt/homebrew/opt/e2fsprogs/sbin/$n"; do
   [ -x "$p" ] && { echo "$p"; return; }
 done
 return 1
}
for c in mke2fs debugfs; do
 p="$(find_e2tool "$c" || true)"
 if [ -n "$p" ]; then echo "PASS $c: $p"; else echo "MISS $c (provided by e2fsprogs)"; missing=1; fi
done
exit "$missing"
