# Cudy LT500D V2 R25 emulator profile (v1)

Target donor: `LT500V2-R25-2.4.16-20250804-150319-flash.bin`.

This branch turns the previously demonstrated FirmAE bring-up into an explicit LT500D profile. The donor userspace remains the subject under test; emulator-only changes are isolated and labelled.

## Known bring-up state inherited from FE evidence

- MIPS little-endian donor userspace runs with the FirmAE v4 MIPS kernel.
- Root filesystem mounts and donor init reaches `procd`.
- R25 board identity and the missing factory-MTD dependency require compatibility handling.
- Donor `uhttpd` has been observed bound to TCP 80/443.
- Donor LAN remains `br-lan=192.168.10.1`.
- A second emulator-only NIC (`eth1=10.0.2.15/24`) is used for host management.
- The remaining observed blocker was donor firewall rejection of traffic entering through emulator-only eth1.

## v1 management design

`eth0` is reserved for donor networking and is not added to a new management bridge.

`eth1` is an emulator-only management interface. `lt500d-r25-management.sh` assigns 10.0.2.15/24 and adds only an INPUT exception for TCP 80/443 on eth1.

The host launcher forwards:

- http://127.0.0.1:8080 -> 10.0.2.15:80
- https://127.0.0.1:8443 -> 10.0.2.15:443

This is a **COMPATIBILITY_SHIMMED** path, not TARGET_VERIFIED and not a claim that MT7628 Ethernet/switch hardware is faithfully emulated.

## Integration into a FirmAE-prepared image

Install `scripts/lt500d-r25-management.sh` into the guest, for example as
`/firmadyne/lt500d-r25-management.sh`, make it executable, and invoke it after
the donor firewall has initialized. Do not replace the donor network config or
flush the complete firewall.

The stock FirmAE `scripts/network.sh` contains a generic loop that flushes
iptables and sets INPUT ACCEPT. Do **not** use that generic firewall bypass as
LT500D fidelity evidence. The LT500D profile deliberately limits the exception
to emulator-only eth1 TCP 80/443.

## macOS role

macOS can run the final QEMU command, but the stock FirmAE image-building
pipeline is Linux-specific (loop devices, fdisk/mkfs/mount/chroot and related
tooling). Build/prep `image.raw` with FirmAE in a Linux environment, then the
resulting kernel + image can be launched on Intel macOS with
`scripts/run.lt500d-r25.mipsel.sh`.

## First v1 gate

Success requires an actual HTTP response from `127.0.0.1:8080`, not merely an
`uhttpd` process or listening socket inside the guest.
