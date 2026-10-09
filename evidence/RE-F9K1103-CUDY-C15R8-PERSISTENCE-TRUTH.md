# F9K1103 Cudy Candidate-15R8 exact persistent lifecycle truth

## Firmware

- image: `RE-F9K1103-CUDY-WR1200E-CANDIDATE-15R8-BOOTFIRST-sysupgrade.bin`
- SHA-256: `03c6bcc370ceba9bdd9dc7a068cdb7679ce12a720bd99446146759ba950674a5`
- firmware source branch: `re-f9k1103-cudy-candidate-15r8-persistent-overlay`
- firmware source head: `9cf929aee85d3452de1533d800de9896808b4cbd`
- successful firmware workflow run: `37976150560`
- artifact: `RE-CUDY-CANDIDATE-15R8-BOOTFIRST`
- artifact digest: `sha256:966270937b5eb15d140ad622a20f7caa0c0544bf0ca9dc431547bc890000b83a`
- `UNIFIED_FROM=C15R6_AUTH_PLUS_C15R5_DASHBOARD`
- `FLASH_AUTHORIZATION=NO`

## R8 image-layout gates

Static validation:

- legacy uImage name: `N750F9K1103VB`
- header CRC: PASS
- payload CRC: PASS
- 7224 KiB firmware partition fit: PASS
- SquashFS offset: `1380799 / 0x1511bf`
- SquashFS bytes-used: `4883400 / 0x4a83c8`
- squashfs-split / rootfs_data boundary: firmware-relative `0x5fa000`
- LEDE pad-rootfs marker: firmware-relative `0x600000`
- marker bytes: `de ad c0 de`
- erased FF gap before marker: PASS
- SquashFS build: `NOPAD_LEDE17`

The exact post-sysupgrade 8 MiB virtual flash preserves original Belkin
U-Boot/env/factory/user-cfg and writes the R8 kernel/rootfs through the
`deadc0de` marker while omitting the fwtool trailer from on-flash rootfs_data.

## Emulator

Persistent RT3883 SPI model:
`b7a6a16cd29822566fca4548a6895bc63ae0204c`

CI:
`37980023402` — SUCCESS

Supported persistence mechanisms used by this lifecycle:
- MX25L6405D 4 KiB erase command
- 64 KiB sector erase
- page program
- dirty range tracking
- SPI backing-file writeback on transaction completion

## Exact Boot A/B/C lifecycle

### Boot A — erased rootfs_data

- R8 kernel/userspace boot: PASS
- kernel squashfs-split creates `rootfs_data` at physical flash offset `0x64a000`
- first boot uses temporary tmpfs overlay while JFFS2 initializes
- JFFS2 end marker detected
- erase/program operations mutate the persistent SPI backing file
- JFFS2 initialization completes

### Boot B — same mutated flash

- `mount_root: switching to jffs2 overlay`: PASS
- Cudy Create administrator password view: PASS
- real password creation POST: HTTP 302 + `sysauth` cookie
- authenticated Cudy landing page: HTTP 200
- fresh unauthenticated request shows normal Login, not Create-password
- fresh-session re-login with created password: HTTP 302 + new `sysauth` cookie
- real `/admin/system` CBI write/apply:
  - harmless disabled remote-management HTTPS port marker `443 -> 4443`
  - response: HTTP 200
  - `X-CBI-State: 2`
  - same-boot readback: `4443`

### Boot C — same flash after Boot B

- `mount_root: switching to jffs2 overlay`: PASS
- normal Login state, not Create-password: PASS
- created administrator password remains valid: PASS
- fresh login returns HTTP 302 + new `sysauth` cookie
- persisted CBI marker readback: `4443`
- `/admin/system`: HTTP 200, no template/Lua error

## Authenticated regression matrix

All tested endpoints returned HTTP 200 with no detected template/Lua/body error:

1. `/`
2. `/admin/wizard`
3. `/admin/setup`
4. `/admin/parental_control`
5. `/admin/panel`
6. `/admin/tools`
7. `/admin/system`
8. `/admin/setup?active=wisp`
9. `/admin/setup?active=wireless_2g`
10. `/admin/setup?active=vpn`
11. `/admin/network/bandwidth?iface=wlan00&icon=icon-wifi&i18name=Wireless%202.4G`
12. `/admin/status/bandwidth?iface=wlan00`

## Classification

`LIFECYCLE_VERIFIED` through:

- exact original Belkin U-Boot boot
- R8 kernel/userspace
- RTL8367R-VB / RT3883 WMAC path
- LAN TX/RX
- Cudy firstboot password creation
- native LEDE credential persistence
- authenticated Cudy UI
- dashboard/XHR compatibility
- real CBI configuration write/apply
- persistent JFFS2 overlay
- reboot
- administrator password persistence
- UCI configuration persistence

## Remaining physical gate

Candidate-15R8 is now the primary firmware candidate for target preflight.

Physical flash remains unauthorized until:

1. target board/model identity is rechecked
2. target MTD layout is rechecked
3. exact candidate SHA-256 is verified on target
4. recovery/backups are confirmed present
5. `sysupgrade -T` returns success on the exact candidate
6. the user explicitly approves the actual flash

Never use blind `sysupgrade -F`.
