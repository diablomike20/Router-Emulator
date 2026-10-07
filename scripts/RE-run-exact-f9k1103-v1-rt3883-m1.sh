#!/bin/bash
set -euo pipefail

[ "$#" -eq 3 ] || {
  echo "Usage: $0 <qemu-system-mipsel> <recovered-zip-or-dir> <work-dir>" >&2
  exit 1
}

QEMU="$1"
SOURCE="$2"
WORK="$3"
mkdir -p "$WORK"

if [ ! -x "$QEMU" ]; then
  echo "QEMU binary is not executable: $QEMU" >&2
  exit 1
fi

INPUT_ROOT="$SOURCE"
if [ -f "$SOURCE" ]; then
  case "$SOURCE" in
    *.zip)
      INPUT_ROOT="$WORK/recovered"
      rm -rf "$INPUT_ROOT"
      mkdir -p "$INPUT_ROOT"
      unzip -q "$SOURCE" -d "$INPUT_ROOT"
      ;;
    *)
      echo "Expected recovered ZIP or extracted directory: $SOURCE" >&2
      exit 1
      ;;
  esac
fi

MTD0="$(find "$INPUT_ROOT" -type f -name 'RE-mtd0-u-boot.bin' -print -quit)"
[ -n "$MTD0" ] || { echo "RE-mtd0-u-boot.bin not found" >&2; exit 1; }
MTD_DIR="$(dirname "$MTD0")"

MTD1="$MTD_DIR/RE-mtd1-uboot-env.bin"
MTD2="$MTD_DIR/RE-mtd2-factory.bin"
MTD3="$MTD_DIR/RE-mtd3-firmware.bin"
MTD7="$MTD_DIR/RE-mtd7-user-cfg.bin"

for f in "$MTD0" "$MTD1" "$MTD2" "$MTD3" "$MTD7"; do
  [ -f "$f" ] || { echo "Missing exact MTD input: $f" >&2; exit 1; }
done

python3 - "$MTD0" "$MTD1" "$MTD2" "$MTD3" "$MTD7" \
             "$WORK/RE-F9K1103-EXACT-FLASH8M.bin" \
             "$WORK/RE-F9K1103-EXACT-UBOOT-PAYLOAD.bin" <<'PY'
from pathlib import Path
import struct
import sys
import zlib

mtd0, mtd1, mtd2, mtd3, mtd7, flash_out, payload_out = map(Path, sys.argv[1:])

expected_sizes = {
    mtd0: 0x30000,
    mtd1: 0x10000,
    mtd2: 0x10000,
    mtd3: 0x7a0000,
    mtd7: 0x10000,
}
for p, size in expected_sizes.items():
    actual = p.stat().st_size
    if actual != size:
        raise SystemExit(f"{p.name}: expected 0x{size:x}, got 0x{actual:x}")

u = mtd0.read_bytes()
if struct.unpack(">I", u[0:4])[0] != 0x27051956:
    raise SystemExit("mtd0 does not begin with a legacy uImage header")

stored_hcrc = struct.unpack(">I", u[4:8])[0]
hdr = bytearray(u[:64])
hdr[4:8] = b"\0" * 4
calc_hcrc = zlib.crc32(hdr) & 0xffffffff
if calc_hcrc != stored_hcrc:
    raise SystemExit(f"U-Boot header CRC mismatch {calc_hcrc:08x}!={stored_hcrc:08x}")

payload_size, load, entry, stored_dcrc = struct.unpack(">IIII", u[12:28])
payload = u[64:64 + payload_size]
calc_dcrc = zlib.crc32(payload) & 0xffffffff
if calc_dcrc != stored_dcrc:
    raise SystemExit(f"U-Boot data CRC mismatch {calc_dcrc:08x}!={stored_dcrc:08x}")

name = u[32:64].split(b"\0", 1)[0]
if not name.startswith(b"N750F9K1103VB"):
    raise SystemExit(f"unexpected U-Boot image identity: {name!r}")
if load != 0x80200000 or entry != 0x80200000:
    raise SystemExit(f"unexpected U-Boot load/entry: {load:08x}/{entry:08x}")

payload_out.write_bytes(payload)

flash = bytearray(b"\xff" * 0x800000)
layout = [
    (mtd0, 0x000000),
    (mtd1, 0x030000),
    (mtd2, 0x040000),
    (mtd3, 0x050000),
    (mtd7, 0x7f0000),
]
for p, off in layout:
    b = p.read_bytes()
    flash[off:off + len(b)] = b
flash_out.write_bytes(flash)

print(f"RE_UBOOT_NAME={name.decode('ascii', 'replace')}")
print(f"RE_UBOOT_PAYLOAD_SIZE={payload_size}")
print(f"RE_UBOOT_LOAD=0x{load:08x}")
print(f"RE_UBOOT_ENTRY=0x{entry:08x}")
print("RE_UBOOT_HEADER_CRC=PASS")
print("RE_UBOOT_DATA_CRC=PASS")
print("RE_FLASH8M_LAYOUT=PASS")
PY

KNOWN_MTD0_SHA="3498feb4d33fe678319510af47b0ad5607c9a0006e217ad8babe6fc5317dadf7"
KNOWN_MTD1_SHA="000fe3eef5f03ca8a0ee43c7779e7562f42d1ddc51e8e304484b6d06a8df8adc"

ACTUAL_MTD0_SHA="$(sha256sum "$MTD0" | awk '{print $1}')"
ACTUAL_MTD1_SHA="$(sha256sum "$MTD1" | awk '{print $1}')"
[ "$ACTUAL_MTD0_SHA" = "$KNOWN_MTD0_SHA" ] || {
  echo "Exact physical mtd0 SHA mismatch" >&2
  exit 1
}
[ "$ACTUAL_MTD1_SHA" = "$KNOWN_MTD1_SHA" ] || {
  echo "Exact physical mtd1 SHA mismatch" >&2
  exit 1
}

SERIAL="$WORK/RE-F9K1103-EXACT-UBOOT-M1.serial.log"
rm -f "$SERIAL"

set +e
timeout 20s "$QEMU" \
  -M rt3883-f9k1103v1 \
  -m 64M \
  -bios "$WORK/RE-F9K1103-EXACT-UBOOT-PAYLOAD.bin" \
  -kernel "$WORK/RE-F9K1103-EXACT-FLASH8M.bin" \
  -display none \
  -monitor none \
  -serial "file:$SERIAL"
RC=$?
set -e

[ "$RC" -eq 0 ] || [ "$RC" -eq 124 ] || {
  echo "QEMU terminated unexpectedly: rc=$RC" >&2
  [ -f "$SERIAL" ] && cat "$SERIAL"
  exit 1
}

{
  echo "phase=M1_EXACT_BELKIN_UBOOT_EXECUTION"
  echo "mtd0_sha256=$ACTUAL_MTD0_SHA"
  echo "mtd1_sha256=$ACTUAL_MTD1_SHA"
  echo "flash8m_sha256=$(sha256sum "$WORK/RE-F9K1103-EXACT-FLASH8M.bin" | awk '{print $1}')"
  echo "uboot_payload_sha256=$(sha256sum "$WORK/RE-F9K1103-EXACT-UBOOT-PAYLOAD.bin" | awk '{print $1}')"
  echo "serial_sha256=$(sha256sum "$SERIAL" | awk '{print $1}')"
  echo "qemu_exit=$RC"
  if grep -aEq 'U-Boot|RT3883|Ralink|Belkin|N750' "$SERIAL"; then
    echo "early_banner_evidence=OBSERVED"
  else
    echo "early_banner_evidence=NOT_OBSERVED"
  fi
} > "$WORK/RE-F9K1103-EXACT-UBOOT-M1-EVIDENCE.txt"

cat "$WORK/RE-F9K1103-EXACT-UBOOT-M1-EVIDENCE.txt"
echo
echo "----- exact U-Boot serial -----"
cat "$SERIAL" || true
echo
echo "RE_F9K1103_EXACT_UBOOT_M1_RUN_COMPLETE=YES"
