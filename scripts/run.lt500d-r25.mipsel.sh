#!/bin/bash
# LT500D R25 QEMU launcher.
# Requires a FirmAE-prepared mipsel image.raw and FirmAE v4 mipsel kernel.
set -euo pipefail

if [ "$#" -lt 3 ]; then
  echo "Usage: $0 <vmlinux.mipsel.4> <image.raw> <serial.log> [extra-kernel-args...]"
  exit 1
fi

KERNEL="$1"
IMAGE="$2"
SERIAL_LOG="$3"
shift 3
EXTRA_ARGS="$*"

exec qemu-system-mipsel \
  -M malta \
  -m 256 \
  -cpu 24Kc \
  -kernel "$KERNEL" \
  -drive if=ide,format=raw,file="$IMAGE" \
  -append "firmadyne.syscall=1 root=/dev/sda1 console=ttyS0 rw debug ignore_loglevel print-fatal-signals=1 FIRMAE_NET=true FIRMAE_NVRAM=true FIRMAE_KERNEL=true FIRMAE_ETC=true user_debug=31 LT500D_EMU=R25 $EXTRA_ARGS" \
  -device e1000,netdev=donor0 \
  -netdev user,id=donor0,net=10.0.3.0/24 \
  -device e1000,netdev=mgmt1 \
  -netdev user,id=mgmt1,net=10.0.2.0/24,hostfwd=tcp:127.0.0.1:8080-10.0.2.15:80,hostfwd=tcp:127.0.0.1:8443-10.0.2.15:443 \
  -serial "file:$SERIAL_LOG" \
  -display none
