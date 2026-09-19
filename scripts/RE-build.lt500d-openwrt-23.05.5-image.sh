#!/bin/bash
set -euo pipefail
[ "$#" -ge 2 ] || { echo "Usage: $0 <rootfs-dir> <image.raw> [size-MiB]"; exit 1; }
ROOTFS="$(cd "$1" && pwd)"; OUT="$2"; SIZE="${3:-512}"
find_e2(){ local n="$1" p; if [ "$(uname -s)" = Darwin ]; then for p in "/usr/local/opt/e2fsprogs/sbin/$n" "/opt/homebrew/opt/e2fsprogs/sbin/$n"; do [ -x "$p" ] && { echo "$p"; return; }; done; fi; p="$(command -v "$n" || true)"; [ -n "$p" ] && { echo "$p"; return; }; return 1; }
MKE2FS="$(find_e2 mke2fs || true)"; DEBUGFS="$(find_e2 debugfs || true)"
for c in qemu-img python3; do command -v "$c" >/dev/null || { echo "Missing $c"; exit 1; }; done
[ -n "$MKE2FS" ] && [ -n "$DEBUGFS" ] || { echo 'Missing e2fsprogs'; exit 1; }
TMP="$(mktemp -d)"; trap 'rm -rf "$TMP"' EXIT; FS="$TMP/root.ext2"; BLOCKS=$((SIZE*1024))
"$MKE2FS" -q -t ext2 -b 1024 -I 128 -O ^metadata_csum,^64bit -d "$ROOTFS" "$FS" "$BLOCKS"
ensure_dir(){ local rel="${1#/}" o; o="$("$DEBUGFS" -R "stat /$rel" "$FS" 2>&1 || true)"; printf '%s
' "$o"|grep -q Inode: || "$DEBUGFS" -w -R "mkdir /$rel" "$FS" >/dev/null 2>&1 || true; }
ensure_node(){ local path="$1" type="$2" major="$3" minor="$4" rel="${1#/}" parent base o cmd; parent="${rel%/*}"; base="${rel##*/}"; o="$("$DEBUGFS" -R "stat /$rel" "$FS" 2>&1 || true)"; if ! printf '%s
' "$o"|grep -q Inode:; then cmd="$TMP/mknod.cmd"; printf 'cd /%s
mknod %s %s %s %s
' "$parent" "$base" "$type" "$major" "$minor" >"$cmd"; "$DEBUGFS" -w -f "$cmd" "$FS" >/dev/null 2>&1 || true; fi; "$DEBUGFS" -R "stat /$rel" "$FS" 2>&1|grep -q Inode: || exit 1; }
ensure_dir /dev
ensure_node /dev/console c 5 1; ensure_node /dev/null c 1 3; ensure_node /dev/zero c 1 5; ensure_node /dev/tty c 5 0; ensure_node /dev/ptmx c 5 2; ensure_node /dev/ttyS0 c 4 64; ensure_node /dev/random c 1 8; ensure_node /dev/urandom c 1 9
qemu-img create -f raw "$OUT" "$((SIZE+2))M" >/dev/null
python3 - "$OUT" "$FS" <<'PY'
import os,struct,sys
out,fs=sys.argv[1:3]; n=os.path.getsize(fs); start=2048; sectors=(n+511)//512
m=bytearray(512); e=bytearray(16); e[1:4]=b'þÿÿ'; e[4]=0x83; e[5:8]=b'þÿÿ'; e[8:12]=struct.pack('<I',start); e[12:16]=struct.pack('<I',sectors); m[446:462]=e; m[510:512]=b'Uª'
with open(out,'r+b') as o:
 o.write(m); o.seek(start*512)
 with open(fs,'rb') as f:
  while True:
   b=f.read(1048576)
   if not b: break
   o.write(b)
print('image=%s rootfs_bytes=%d'%(out,n))
PY
echo LT500D_OPENWRT_IMAGE_GATE=PASS
