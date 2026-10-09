#!/bin/bash
set -euo pipefail

[ "$#" -eq 4 ] || {
  echo "Usage: $0 <qemu-system-mipsel> <exact-uboot-payload.bin> <cudy-flash8m.bin> <work-dir>" >&2
  exit 1
}

QEMU="$1"
UBOOT="$2"
FLASH="$3"
WORK="$4"

mkdir -p "$WORK"
SERIAL="$WORK/RE-C15R2-EXACT-LAN.serial.log"
STDERR="$WORK/RE-C15R2-EXACT-LAN.qemu.stderr.log"
PCAP="$WORK/RE-C15R2-EXACT-LAN.pcap"
HTTP_OUT="$WORK/RE-C15R2-EXACT-LAN.http.body"
HTTP_ERR="$WORK/RE-C15R2-EXACT-LAN.http.stderr"
SSH_OUT="$WORK/RE-C15R2-EXACT-LAN.ssh.txt"

for f in "$QEMU" "$UBOOT" "$FLASH"; do
  [ -f "$f" ] || { echo "Missing input: $f" >&2; exit 1; }
done
[ -x "$QEMU" ] || chmod +x "$QEMU"

[ "$(stat -c%s "$FLASH")" -eq 8388608 ] || {
  echo "Expected exact 8 MiB flash image" >&2
  exit 1
}

rm -f "$SERIAL" "$STDERR" "$PCAP" "$HTTP_OUT" "$HTTP_ERR" "$SSH_OUT"

"$QEMU" \
  -M rt3883-f9k1103v1 \
  -m 64M \
  -bios "$UBOOT" \
  -kernel "$FLASH" \
  -display none \
  -monitor none \
  -serial "file:$SERIAL" \
  -netdev user,id=net0,net=192.168.1.0/24,hostfwd=tcp:127.0.0.1:18080-192.168.1.1:80,hostfwd=tcp:127.0.0.1:12222-192.168.1.1:22 \
  -object filter-dump,id=dump0,netdev=net0,file="$PCAP" \
  2>"$STDERR" &
PID=$!

cleanup() {
  kill "$PID" 2>/dev/null || true
  wait "$PID" 2>/dev/null || true
}
trap cleanup EXIT

# Candidate-15R2 reaches stable br-lan/wlan00 userspace in ~30 s on CI QEMU.
# Leave margin for slow hosts and JFFS2 fallback noise.
sleep "${RE_CUDY_BOOT_WAIT:-55}"

set +e
curl -fsS --max-time 8 http://127.0.0.1:18080/ >"$HTTP_OUT" 2>"$HTTP_ERR"
HTTP_RC=$?

python3 - "$SSH_OUT" <<'PY'
import socket, sys
out = sys.argv[1]
try:
    s = socket.create_connection(("127.0.0.1", 12222), timeout=4)
    s.settimeout(5)
    data = s.recv(256)
    with open(out, "wb") as f:
        f.write(data)
    s.close()
    raise SystemExit(0 if data.startswith(b"SSH-") else 2)
except Exception as exc:
    with open(out, "w", encoding="utf-8") as f:
        f.write(type(exc).__name__ + ": " + str(exc) + "\n")
    raise SystemExit(1)
PY
SSH_RC=$?
set -e

sleep 2

BOOT_PASS=NO
grep -aq 'br-lan: port 1(eth0.1) entered forwarding state' "$SERIAL" && \
grep -aq 'RT chipset 3883, rev 0400 detected' "$SERIAL" && BOOT_PASS=YES

HTTP_PASS=NO
[ "$HTTP_RC" -eq 0 ] && [ -s "$HTTP_OUT" ] && HTTP_PASS=YES

SSH_PASS=NO
[ "$SSH_RC" -eq 0 ] && SSH_PASS=YES

{
  echo "CUDY_C15R2_EXACT_BOOT=$BOOT_PASS"
  echo "CUDY_C15R2_HTTP=$HTTP_PASS"
  echo "CUDY_C15R2_SSH=$SSH_PASS"
  echo "HTTP_RC=$HTTP_RC"
  echo "SSH_RC=$SSH_RC"
  echo "FLASH_SHA256=$(sha256sum "$FLASH" | awk '{print $1}')"
  echo "UBOOT_PAYLOAD_SHA256=$(sha256sum "$UBOOT" | awk '{print $1}')"
  echo "SERIAL_SHA256=$(sha256sum "$SERIAL" | awk '{print $1}')"
  echo "PCAP_SHA256=$(sha256sum "$PCAP" | awk '{print $1}')"
} | tee "$WORK/RE-C15R2-EXACT-LAN-GATE.txt"

[ "$BOOT_PASS" = YES ] || exit 2
[ "$HTTP_PASS" = YES ] || exit 3
[ "$SSH_PASS" = YES ] || exit 4
