#!/bin/bash
set -euo pipefail
if [ "$#" -ne 1 ]; then echo "Usage: $0 <rootfs-directory>"; exit 1; fi
ROOT="$(cd "$1" && pwd)"
RAMIPS="$ROOT/lib/ramips.sh"
FACTORY="$ROOT/lib/preinit/82_factory_mac"
RCLOCAL="$ROOT/etc/rc.local"
NETWORK="$ROOT/etc/config/network"
SELF_DIR="$(cd "$(dirname "$0")" && pwd)"
for f in "$RAMIPS" "$FACTORY" "$RCLOCAL" "$NETWORK"; do [ -f "$f" ] || { echo "Missing donor file: $f"; exit 1; }; done

python3 - "$RAMIPS" <<'PY'
from pathlib import Path
import sys
p = Path(sys.argv[1])
s = p.read_text()
old = """machine=$(awk 'BEGIN{FS="[ \\t]+:[ \\t]"} /machine/ {print $2}' /proc/cpuinfo)"""
marker = "LT500D emulator compatibility: explicit profile marker"
if marker not in s:
    if old not in s:
        raise SystemExit("ramips_board_detect signature not found; refusing blind patch")
    new = old + '\n\n\t# ' + marker + ' overrides Malta identity.\n\tgrep -qw "LT500D_EMU=R25" /proc/cmdline 2>/dev/null && machine="R25"'
    p.write_text(s.replace(old, new, 1))
PY

python3 - "$FACTORY" <<'PY'
from pathlib import Path
import sys
p = Path(sys.argv[1])
s = p.read_text()
old = """\tlocal mtdblock=$(find_mtd_part factory)
\tlocal magic=$(hexdump -n 4 -e '4/1 "%02x"' $mtdblock)"""
marker = "LT500D emulator compatibility: no factory MTD"
if marker not in s:
    if old not in s:
        raise SystemExit("factory hook signature not found; refusing blind patch")
    new = '\tlocal mtdblock=$(find_mtd_part factory)\n\t# ' + marker + ' exists on Malta.\n\t[ -n "$mtdblock" ] && [ -e "$mtdblock" ] || return 0\n\tlocal magic=$(hexdump -n 4 -e \'4/1 "%02x"\' "$mtdblock")'
    p.write_text(s.replace(old, new, 1))
PY


python3 - "$NETWORK" <<'PY'
from pathlib import Path
import re, sys

p = Path(sys.argv[1])
s = p.read_text()
target_ip = "192.168.10.2"

# Only alter the donor LAN interface block in the emulator copy.
m = re.search(r"(?ms)^config\s+interface\s+['\"]?lan['\"]?\s*$.*?(?=^config\s|\Z)", s)
if not m:
    raise SystemExit("donor network.lan block not found; refusing blind LAN-IP patch")

block = m.group(0)
ip_pat = re.compile(r"(?m)^(\s*option\s+ipaddr\s+)(['\"]?)192\.168\.10\.1\2(\s*)$")
if target_ip in block:
    new_block = block
else:
    new_block, n = ip_pat.subn(lambda x: x.group(1) + x.group(2) + target_ip + x.group(2) + x.group(3), block, count=1)
    if n != 1:
        raise SystemExit("expected donor LAN ipaddr 192.168.10.1 not found exactly once; refusing blind patch")

p.write_text(s[:m.start()] + new_block + s[m.end():])
PY

install -m 0755 "$SELF_DIR/lt500d-r25-management.sh" "$ROOT/usr/sbin/lt500d-r25-management"

python3 - "$RCLOCAL" <<'PY'
from pathlib import Path
import sys
p = Path(sys.argv[1])
s = p.read_text()
line = '/usr/sbin/lt500d-r25-management >/tmp/lt500d-r25-management.out 2>&1 &'
if line not in s:
    marker = "\nexit 0"
    if marker not in s:
        raise SystemExit("rc.local exit marker not found; refusing blind patch")
    p.write_text(s.replace(marker, "\n" + line + "\n\nexit 0", 1))
PY

echo "LT500D R25 compatibility layer installed into: $ROOT"
