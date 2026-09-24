# Belkin F9K1103 v1 — OpenWrt 23.05.5 port

Status: **PORT-WIP / NOT-FLASH-VERIFIED**

This port is intentionally separate from the ASUS RT-N56U and Belkin F9K1109 profiles.

## Evidence used

### OpenWrt 23.05.5 shared Belkin platform
`rt3883_belkin_f9k110x.dtsi` supplies the common RT3883/F9K110x hardware:
- 8 MiB SPI-NOR
- U-Boot 0x00000..0x2ffff
- U-Boot env 0x30000..0x3ffff
- factory 0x40000..0x4ffff
- firmware 0x50000..0x7effff
- user-cfg 0x7f0000..0x7fffff
- RTL8367B/R-VB SMI on GPIO 1/2
- RT3883 WMAC EEPROM at factory+0
- RT3091/RT3092-class PCI radio EEPROM at factory+0x8000
- two USB ports

### F9K1103-specific board evidence
Padavan's long-standing `BN750DB` / `F9K1103` board definition gives:
- reset GPIO 25
- WPS GPIO 26
- power LED GPIO 0
- LAN LED GPIO 13
- WAN LED GPIO 12
- USB LED GPIO 9
- 3x3 5 GHz and 2x2 2.4 GHz
- gigabit LAN/WAN

The reset/WPS GPIOs and several LED GPIOs overlap the independently supported F9K1109 board, increasing confidence in the shared PCB/platform ancestry.

## Image format
The profile uses:
- `Device/uimage-lzma-loader`
- `IMAGE_SIZE := 7808k`
- `UIMAGE_NAME := N750F9K1103VB`

The latter is the Belkin N750 image name already used by OpenWrt's F9K1109 profile.

## Important
The first build is for controlled recovery/boot testing. It is **not claimed to be runtime verified** on a physical F9K1103 v1 yet.

Keep a known-good stock recovery image before flashing.
