#!/bin/bash
set -euo pipefail
[ "$#" -eq 1 ] || { echo "Usage: $0 <rootfs-directory>"; exit 1; }
ROOT="$(cd "$1" && pwd)"
SELF_DIR="$(cd "$(dirname "$0")" && pwd)"
RAMIPS="$ROOT/lib/ramips.sh"
FACTORY="$ROOT/lib/preinit/82_factory_mac"
BOOT="$ROOT/etc/init.d/boot"
RCLOCAL="$ROOT/etc/rc.local"
SHADOW="$ROOT/etc/shadow"
for f in "$RAMIPS" "$BOOT" "$RCLOCAL" "$SHADOW"; do [ -f "$f" ] || { echo "Missing Candidate-15 file: $f"; exit 1; }; done

python3 - "$RAMIPS" <<'PY'
from pathlib import Path
import sys
p=Path(sys.argv[1]); s=p.read_text(); marker='F9K1103 v1 Candidate-15 emulator identity override'
if marker not in s:
    old='machine=$(awk \'BEGIN{FS="[ \\t]+:[ \\t]"} /machine/ {print $2}\' /proc/cpuinfo)'
    if old not in s: raise SystemExit('ramips machine-detection signature missing')
    new=old+'\n\n\t# '+marker+'\n\tgrep -qw "F9K1103_V1_C15_EMU=1" /proc/cmdline 2>/dev/null && machine="Belkin F9K1103 Version 1.0"'
    p.write_text(s.replace(old,new,1))
PY

if [ -f "$FACTORY" ]; then
python3 - "$FACTORY" <<'PY'
from pathlib import Path
import sys
p=Path(sys.argv[1]); s=p.read_text(); marker='F9K1103 v1 Candidate-15 emulator: no factory MTD'
if marker not in s:
    old='\tlocal mtdblock=$(find_mtd_part factory)\n\tlocal magic=$(hexdump -n 4 -e \'4/1 "%02x"\' $mtdblock)'
    if old in s:
        new='\tlocal mtdblock=$(find_mtd_part factory)\n\t# '+marker+'\n\tif grep -qw "F9K1103_V1_C15_EMU=1" /proc/cmdline 2>/dev/null; then\n\t\t[ -n "$mtdblock" ] && [ -e "$mtdblock" ] || return 0\n\tfi\n\tlocal magic=$(hexdump -n 4 -e \'4/1 "%02x"\' "$mtdblock")'
        p.write_text(s.replace(old,new,1))
PY
fi

python3 - "$BOOT" <<'PY'
from pathlib import Path
import sys
p=Path(sys.argv[1]); s=p.read_text(); marker='F9K1103 v1 Candidate-15 emulator: skip physical target kmodloader'
if marker not in s:
    old='\t/sbin/kmodloader\n'
    if old not in s: raise SystemExit('boot kmodloader signature missing')
    new='\t# '+marker+'\n\tif grep -qw "F9K1103_V1_C15_EMU=1" /proc/cmdline 2>/dev/null; then\n\t\techo "F9K1103_V1_C15_EMU: skip target kmodloader" > /dev/console 2>/dev/null || true\n\telse\n\t\t/sbin/kmodloader\n\tfi\n'
    p.write_text(s.replace(old,new,1))
PY

python3 - "$SHADOW" <<'PY'
from pathlib import Path
import sys
p=Path(sys.argv[1]); lines=p.read_text().splitlines(); out=[]; found=False
for line in lines:
    if line.startswith('root:'):
        parts=line.split(':'); parts[1]='$1$f9k1103$pgbkgRJw/lb5D49bxJRK2/'; line=':'.join(parts); found=True
    out.append(line)
if not found: raise SystemExit('root shadow entry missing')
p.write_text('\n'.join(out)+'\n')
PY

install -m 0755 "$SELF_DIR/RE-f9k1103-v1-candidate-15-network.sh" "$ROOT/etc/uci-defaults/99-f9k1103-v1-c15-emulator-network"
install -m 0755 "$SELF_DIR/RE-f9k1103-v1-candidate-15-management.sh" "$ROOT/usr/sbin/RE-f9k1103-v1-candidate-15-management"
python3 - "$RCLOCAL" <<'PY'
from pathlib import Path
import sys
p=Path(sys.argv[1]); s=p.read_text(); line='/usr/sbin/RE-f9k1103-v1-candidate-15-management >/tmp/RE-f9k1103-v1-c15-management.out 2>&1 &'
if line not in s:
    marker='\nexit 0'
    if marker not in s: raise SystemExit('rc.local exit marker missing')
    p.write_text(s.replace(marker,'\n'+line+'\n\nexit 0',1))
PY

echo 'F9K1103_V1_CANDIDATE15_PREPARE_GATE=PASS'
