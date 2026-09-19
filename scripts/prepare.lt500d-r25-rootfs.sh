#!/bin/bash
set -euo pipefail
if [ "$#" -ne 1 ]; then echo "Usage: $0 <rootfs-directory>"; exit 1; fi
ROOT="$(cd "$1" && pwd)"
RAMIPS="$ROOT/lib/ramips.sh"
FACTORY="$ROOT/lib/preinit/82_factory_mac"
RCLOCAL="$ROOT/etc/rc.local"
SELF_DIR="$(cd "$(dirname "$0")" && pwd)"
for f in "$RAMIPS" "$FACTORY" "$RCLOCAL"; do [ -f "$f" ] || { echo "Missing donor file: $f"; exit 1; }; done

python3 - "$RAMIPS" <<'PY'
from pathlib import Path
import sys
p=Path(sys.argv[1]); s=p.read_text()
old='machine=$(awk \\'BEGIN{FS="[ \\\\t]+:[ \\\\t]"} /machine/ {print $2}\\' /proc/cpuinfo)'
new=old+'\\n\\n\\t# LT500D emulator compatibility: explicit profile marker overrides Malta identity.\\n\\tgrep -qw "LT500D_EMU=R25" /proc/cmdline 2>/dev/null && machine="R25"'
if 'LT500D emulator compatibility: explicit profile marker' not in s:
    if old not in s: raise SystemExit("ramips_board_detect signature not found; refusing blind patch")
    p.write_text(s.replace(old,new,1))
PY

python3 - "$FACTORY" <<'PY'
from pathlib import Path
import sys
p=Path(sys.argv[1]); s=p.read_text()
old='\\tlocal mtdblock=$(find_mtd_part factory)\\n\\tlocal magic=$(hexdump -n 4 -e \\'4/1 "%02x"\\' $mtdblock)'
new='\\tlocal mtdblock=$(find_mtd_part factory)\\n\\t# LT500D emulator compatibility: no factory MTD exists on Malta.\\n\\t[ -n "$mtdblock" ] && [ -e "$mtdblock" ] || return 0\\n\\tlocal magic=$(hexdump -n 4 -e \\'4/1 "%02x"\\' "$mtdblock")'
if 'LT500D emulator compatibility: no factory MTD' not in s:
    if old not in s: raise SystemExit("factory hook signature not found; refusing blind patch")
    p.write_text(s.replace(old,new,1))
PY

install -m 0755 "$SELF_DIR/lt500d-r25-management.sh" "$ROOT/usr/sbin/lt500d-r25-management"

python3 - "$RCLOCAL" <<'PY'
from pathlib import Path
import sys
p=Path(sys.argv[1]); s=p.read_text()
line='/usr/sbin/lt500d-r25-management >/tmp/lt500d-r25-management.out 2>&1 &'
if line not in s:
    if '\\nexit 0' not in s: raise SystemExit("rc.local exit marker not found; refusing blind patch")
    p.write_text(s.replace('\\nexit 0','\\n'+line+'\\n\\nexit 0',1))
PY

echo "LT500D R25 compatibility layer installed into: $ROOT"
