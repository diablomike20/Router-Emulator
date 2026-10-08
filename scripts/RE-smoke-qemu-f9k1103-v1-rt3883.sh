#!/bin/bash
set -euo pipefail
[ "$#" -eq 2 ] || { echo "Usage: $0 <qemu> <work-dir>" >&2; exit 1; }
ROOT="$(cd "$(dirname "$0")/.." && pwd)"; QEMU="$1"; WORK="$2"; mkdir -p "$WORK"
AS="${CROSS_COMPILE:-mipsel-linux-gnu-}as"; LD="${CROSS_COMPILE:-mipsel-linux-gnu-}ld"; OBJCOPY="${CROSS_COMPILE:-mipsel-linux-gnu-}objcopy"
"$AS" -32 -o "$WORK/probe.o" "$ROOT/qemu/f9k1103-v1-rt3883/RE-rt3883-probe.S"
"$LD" -m elf32ltsmip -Ttext 0x80200000 -e _start -o "$WORK/probe.elf" "$WORK/probe.o"
"$OBJCOPY" -O binary -j .text -j .rodata -j .data "$WORK/probe.elf" "$WORK/probe.bin"
PROBE_SIZE="$(stat -c %s "$WORK/probe.bin")"
[ "$PROBE_SIZE" -gt 0 ] && [ "$PROBE_SIZE" -le 196608 ] || { echo "invalid compact probe size: $PROBE_SIZE" >&2; exit 1; }
echo "RT3883_F9K1103V1_PROBE_SIZE=$PROBE_SIZE"
python3 - "$WORK/flash.bin" <<'PY'
from pathlib import Path
import sys
b=bytearray(b'\xff'*(8*1024*1024)); b[0]=0x5a; Path(sys.argv[1]).write_bytes(b)
PY
SERIAL="$WORK/serial.log"; rm -f "$SERIAL"
set +e
timeout 8s "$QEMU" -M rt3883-f9k1103v1 -m 64M -bios "$WORK/probe.bin" -kernel "$WORK/flash.bin" -display none -monitor none -serial "file:$SERIAL"
rc=$?
set -e
[ "$rc" -eq 0 ] || [ "$rc" -eq 124 ] || { cat "$SERIAL" || true; exit 1; }
for gate in \
  RT3883_F9K1103V1_FLASH_ALIAS_GATE=PASS \
  RT3883_F9K1103V1_GPIO25_RECOVERY_GATE=PASS \
  RT3883_F9K1103V1_GPIO24_39_BANK_GATE=PASS \
  RT3883_F9K1103V1_SYSCFG0_500_DDR2_GATE=PASS RT3883_F9K1103V1_REVID_1_5_GATE=PASS RT3883_F9K1103V1_SDRAM_64M_MIRROR_GATE=PASS RT3883_F9K1103V1_PCI_HOST_NOLINK_GATE=PASS RT3883_F9K1103V1_USB_HOST_2PORT_GATE=PASS RT3883_F9K1103V1_WMAC_RT3883_REV0400_GATE=PASS RT3883_F9K1103V1_WMAC_BBP_INDIRECT_GATE=PASS RT3883_F9K1103V1_WMAC_RFCSR_INDIRECT_GATE=PASS \
  RT3883_F9K1103V1_PERIPHERAL_RESET_ISOLATION_GATE=PASS \
  RT3883_F9K1103V1_SPI_RDID_GATE=PASS RT3883_F9K1103V1_SPI_RDSR_STROBE_GATE=PASS \
  RT3883_F9K1103V1_SYSTEM_RESET_GATE=PASS \
  RT3883_F9K1103V1_MACHINE_M1_PREP_GATE=PASS; do
  grep -q "$gate" "$SERIAL" || { cat "$SERIAL" || true; echo "missing gate: $gate" >&2; exit 1; }
done
cat "$SERIAL"; echo RT3883_F9K1103V1_QEMU_M1_PREP_SMOKE_GATE=PASS
