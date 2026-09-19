#!/bin/bash
set -euo pipefail
missing=0
for c in qemu-system-mipsel qemu-img curl python3; do
 if command -v "$c" >/dev/null; then echo "PASS $c: $(command -v "$c")"; else echo "MISS $c"; missing=1; fi
done
for c in genext2fs fakeroot; do
 if command -v "$c" >/dev/null; then echo "PASS $c: $(command -v "$c")"; else echo "MISS $c (brew install genext2fs fakeroot)"; missing=1; fi
done
exit "$missing"
