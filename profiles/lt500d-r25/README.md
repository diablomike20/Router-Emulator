# Cudy LT500D V2 R25 emulator profile (v1)

Target donor: `LT500V2-R25-2.4.16-20250804-150319-flash.bin`.

This branch turns the previously demonstrated FirmAE bring-up into an explicit LT500D profile. The donor userspace remains the subject under test; emulator-only changes are isolated and labelled.

## Known bring-up state inherited from FE evidence

- MIPS little-endian donor userspace runs with the FirmAE v4 MIPS kernel.
- Root filesystem mounts and donor init reaches `procd`.
- R25 board identity and the missing factory-MTD dependency require compatibility handling.
- Donor `uhttpd` has been observed bound to TCP 80/443.
- The emulator copy rewrites only the donor LAN address to `br-lan=192.168.10.2` to avoid colliding with the physical router at `192.168.10.1`.
- A second emulator-only NIC (`eth1`) is attached as a port of the donor `br-lan` bridge.
- The donor LAN topology is retained, but the emulator-only copy uses `br-lan=192.168.10.2/24`.
- Host management reaches the guest through the donor LAN path rather than a synthetic management subnet.

## v1 management design

`eth0` is reserved for donor networking and is not added to a new management bridge.

`eth1` is an emulator-only physical LAN attachment. `lt500d-r25-management.sh` gives it no L3 address and adds it to the donor-created `br-lan` bridge. No emulator-only firewall ACCEPT rule is installed; the donor LAN policy remains authoritative.

The host launcher uses a `192.168.10.0/24` QEMU user network and forwards:

- http://127.0.0.1:8080 -> 192.168.10.2:80
- https://127.0.0.1:8443 -> 192.168.10.2:443

This is a **COMPATIBILITY_SHIMMED** path, not TARGET_VERIFIED and not a claim that MT7628 Ethernet/switch hardware is faithfully emulated.

## Integration into a FirmAE-prepared image

Install `scripts/lt500d-r25-management.sh` into the guest, for example as
`/firmadyne/lt500d-r25-management.sh`, make it executable, and invoke it after
the donor firewall has initialized. Do not replace the donor network config or
flush the complete firewall.

The stock FirmAE `scripts/network.sh` contains a generic loop that flushes
iptables and sets INPUT ACCEPT. Do **not** use that generic firewall bypass as
LT500D fidelity evidence. The LT500D profile no longer requires a separate eth1 firewall exception; management traffic enters through the donor `br-lan` path.

## macOS build path

The branch now has a native, mountless macOS image builder. It uses Homebrew
e2fsprogs `mke2fs -d` to populate ext2 directly from the donor tree and
`debugfs` to create the minimal Linux device nodes that an unprivileged macOS
SquashFS extraction cannot reliably materialize. No loop device, Linux mount,
fakeroot, or genext2fs is required by this path.

The one-shot entry point is:

```sh
./scripts/make.lt500d-r25-emulator.macos.sh /path/to/LT500V2-R25-2.4.16-20250804-150319-flash.bin scratch/lt500d-r25
```

It refuses a donor whose size or SHA-256 differs from the verified R25 image,
extracts SquashFS at the verified offset, downloads only the FirmAE runtime
artifacts required by this profile, applies the LT500D compatibility layer,
and builds the MBR/ext2 image.

Then start QEMU and run the host gate:

```sh
./scripts/start.lt500d-r25.sh scratch/lt500d-r25/image.raw
./scripts/smoke.lt500d-r25-http.sh
```

## First v1 gate

Success requires an actual HTTP response from `127.0.0.1:8080`, not merely an
`uhttpd` process or listening socket inside the guest.


## Donor architecture

Donor metadata: LEDE 17.01.5 / build 2.4.16; target ramips/mt7628; architecture mipsel_24kc. The v1 launcher therefore pins qemu-system-mipsel, Malta compatibility machine, and 24Kc CPU. Malta is an emulation compatibility choice, not MT7628 hardware-fidelity evidence.
