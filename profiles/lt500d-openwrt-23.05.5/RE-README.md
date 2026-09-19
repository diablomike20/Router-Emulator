# RE — Cudy LT500D V2 / OpenWrt 23.05.5 Emulator

Branch: `lt500d-openwrt-23.05.5-emulator-v1`

This profile emulates the **Cudy LT500D V2 OpenWrt 23.05.5 userspace/web stack** with a FirmAE MIPSLE kernel on QEMU Malta.

Verified input firmware:

- `openwrt-23.05.5-ramips-mt76x8-cudy_lt500-v2.bin`
- size: `9306901` bytes
- SHA-256: `3d8bb8eac7396f8263e90ecf14eca0f324ea6dbb295106e72b0a96753f31255b`
- SquashFS offset: `2630830` (`0x2824ae`)
- OpenWrt `23.05.5 r24106-10cc5fcd00`
- `ramips/mt76x8`, `mipsel_24kc`
- guest board identity: `cudy,lt500-v2`

## Fidelity

`COMPATIBILITY_SHIMMED`.

This is not MT7628 hardware emulation. The guest keeps the LT500D V2 OpenWrt board identity and userspace, while QEMU e1000 NICs replace the physical switch:

- `eth1` -> LAN, `192.168.10.2/24`
- `eth0` -> WAN DHCP
- HTTP -> `http://127.0.0.1:18080/`
- HTTPS -> `https://127.0.0.1:18443/`

Only with `LT500D_OWRT_EMU=1`, the compatibility layer forces the LT500D board identity before board detection, replaces the physical switch topology with QEMU NICs, skips incompatible OpenWrt 5.15.167 target kernel modules, skips squashfs/jffs2 overlay switching on the writable ext2 emulator root, and disables uHTTPd RFC1918 filtering for localhost forwarding.

## Linux

Install `qemu-system-mips qemu-utils squashfs-tools e2fsprogs curl python3`, then:

```sh
scripts/RE-make.lt500d-openwrt-23.05.5-emulator.sh /path/openwrt-23.05.5-ramips-mt76x8-cudy_lt500-v2.bin scratch/lt500d-openwrt-23.05.5
scripts/RE-start.lt500d-openwrt-23.05.5.sh scratch/lt500d-openwrt-23.05.5/image.raw
```

In a second terminal:

```sh
scripts/RE-smoke.lt500d-openwrt-23.05.5.sh
```

## macOS Intel

Install `qemu squashfs e2fsprogs` with Homebrew, then use the same `RE-make...`, `RE-start...`, and `RE-smoke...` commands.

## Windows 10/11

Requires WSL2 + Ubuntu. Double-click:

`scripts/RE-lt500d-openwrt-23.05.5.windows.bat`

Menu order: Setup -> Check -> Build -> Start -> Smoke.

## Evidence status

- Firmware/rootfs identity: `SOURCE_VERIFIED` against the supplied image/rootfs.
- Compatibility rootfs transformation: local static verification `PASS`.
- GitHub branch static shell/PowerShell/BAT gate: required.
- QEMU runtime gate: workflow-dispatch supports a reachable firmware URL, or run locally with the supplied firmware.
- Physical MT7628 radio/switch/modem behavior is not claimed by this emulator.
