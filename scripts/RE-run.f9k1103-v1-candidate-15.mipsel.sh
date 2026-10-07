#!/bin/bash
set -euo pipefail
[ "$#" -ge 3 ] || { echo "Usage: $0 <vmlinux.mipsel.4> <image.raw> <serial.log> [extra-kernel-args...]"; exit 1; }
KERNEL="$1"; IMAGE="$2"; SERIAL_LOG="$3"; shift 3; EXTRA_ARGS="$*"
exec qemu-system-mipsel -M malta -m 256 -cpu 74Kf -kernel "$KERNEL" -drive if=ide,format=raw,file="$IMAGE" -append "firmadyne.syscall=1 root=/dev/sda1 console=ttyS0 rw debug ignore_loglevel print-fatal-signals=1 FIRMAE_NET=true FIRMAE_NVRAM=true FIRMAE_KERNEL=true FIRMAE_ETC=true user_debug=31 F9K1103_V1_C15_EMU=1 $EXTRA_ARGS" -device e1000,netdev=wan0 -netdev user,id=wan0,net=10.0.3.0/24 -device e1000,netdev=lan1 -netdev user,id=lan1,net=192.168.10.0/24,host=192.168.10.254,hostfwd=tcp:127.0.0.1:18080-192.168.10.2:80,hostfwd=tcp:127.0.0.1:18443-192.168.10.2:443 -serial "file:$SERIAL_LOG" -display none
