#!/bin/bash
set -euo pipefail
[ "$#" -ge 3 ] || exit 1
KERNEL="$1"; IMAGE="$2"; LOG="$3"
exec qemu-system-mipsel -M malta -m 256 -cpu 24Kc -kernel "$KERNEL" -drive if=ide,format=raw,file="$IMAGE"  -append 'firmadyne.syscall=1 root=/dev/sda1 console=ttyS0 rw debug ignore_loglevel print-fatal-signals=1 FIRMAE_NET=true FIRMAE_NVRAM=true FIRMAE_KERNEL=true FIRMAE_ETC=true user_debug=31 LT500D_OWRT_EMU=1'  -device e1000,netdev=wan0 -netdev user,id=wan0,net=10.0.3.0/24  -device e1000,netdev=lan1 -netdev user,id=lan1,net=192.168.10.0/24,host=192.168.10.254,hostfwd=tcp:127.0.0.1:18080-192.168.10.2:80,hostfwd=tcp:127.0.0.1:18443-192.168.10.2:443  -serial "file:$LOG" -display none
