# F9K1103 Cudy Candidate-15R7 unified lifecycle truth

## Firmware

- image: `RE-F9K1103-CUDY-WR1200E-CANDIDATE-15R7-BOOTFIRST-sysupgrade.bin`
- SHA-256: `58179c2c6fa7e784d395263c35350a45206dec986b6bd8f363e58dcb30c8b4d4`
- firmware source branch: `re-f9k1103-cudy-candidate-15r7-unified`
- firmware source head: `69c081ba26dc88bc8bff70e744a4debb3c485f94`
- successful firmware workflow run: `37973664504`
- `UNIFIED_FROM=C15R6_AUTH_PLUS_C15R5_DASHBOARD`
- `FLASH_AUTHORIZATION=NO`

## Unified firmware fixes

Candidate-15R7 combines:
- C15R6 browser-compatible firstboot administrator password lifecycle
- persistent `luci.sauth.defpasswd` ownership
- native LEDE root password storage
- WR1200E language registry lifecycle result
- LEDE 17 mcore shell escaping compatibility
- C15R5 dashboard/XHR iface accessor repair:
  `formvaluex("iface") -> formvalue("iface")` in the two Cudy statistic views

## Exact runtime

Original Belkin U-Boot + exact 8 MiB F9K1103 flash layout:

- Linux/userspace boot: PASS
- RT3883 WMAC rev 0x0400 / RF3853: PASS
- RTL8367R-VB path: PASS
- LAN TX/RX: PASS
- Dropbear transport: PASS
- fresh Cudy Create administrator password page: PASS
- fresh-session re-login with created password: PASS
- authenticated root page: HTTP 200
- real top-level Cudy menu routes: PASS
- WISP / Wireless 2.4G / VPN setup routes: PASS
- former bandwidth XHR blocker endpoints: HTTP 200, no Lua/template errors

Representative runtime route matrix:
- `/`
- `/admin/wizard`
- `/admin/setup`
- `/admin/parental_control`
- `/admin/panel`
- `/admin/tools`
- `/admin/setup?active=wisp`
- `/admin/setup?active=wireless_2g`
- `/admin/setup?active=vpn`
- `/admin/network/bandwidth?iface=wlan00&icon=icon-wifi&i18name=Wireless%202.4G`
- `/admin/status/bandwidth?iface=wlan00`

All listed routes returned HTTP 200 with no detected template/Lua/body error after authentication.

## Persistent SPI/JFFS2 lifecycle

Emulator source commit:
`b7a6a16cd29822566fca4548a6895bc63ae0204c`
(`RE: persist RT3883 SPI NOR program and erase operations`)

CI run:
`37980023402`

The RT3883 SPI model now writes page-program/erase dirty ranges back to the flash
backing file on CS release. Smoke evidence includes:
`RT3883_SPI_BACKING_FLUSH off=00001000 len=4096`

The prior 4 KiB MX25L6405D erase gate is also PASS.

Correct post-flash image construction leaves `rootfs_data` erased after the exact
SquashFS bytes-used boundary. For C15R7:
- SquashFS start: firmware-relative `0x1511bf`
- SquashFS bytes-used: `0x4a83cc`
- exact SquashFS end: `0x5f958b`
- 4 KiB split: `0x5fa000`
- raw sysupgrade end: `0x5fa264`
- raw sysupgrade overhang into rootfs_data: `0x264` bytes

The virtual post-flash image therefore copies only through the exact SquashFS end
and leaves rootfs_data erased.

### Boot A
- empty rootfs_data
- first boot temporarily uses tmpfs overlay while JFFS2 is initialized
- SPI backing file changes on guest erase/program operations
- JFFS2 initialization observed

### Boot B
- same mutated flash backing file
- `mount_root: switching to jffs2 overlay` — PASS
- administrator password created through real Cudy firstboot web form
- fresh-session re-login with that password — PASS
- authenticated Cudy `/admin/system` CBI form used for real config write/apply
- harmless disabled remote-management HTTPS port marker changed `443 -> 4443`
- CBI response HTTP 200 / `X-CBI-State: 2`
- readback on same boot: `4443`

### Boot C
- same flash backing file
- `mount_root: switching to jffs2 overlay` — PASS
- normal login state, not Create-password state
- created administrator password still valid — PASS
- fresh login returns HTTP 302 + new sysauth cookie
- persisted config marker readback: `4443`
- no tested Lua/template/body error

Classification:
`LIFECYCLE_VERIFIED` through exact boot, firstboot auth, authenticated Cudy UI,
dashboard/XHR compatibility, real LuCI config write/apply, persistent JFFS2 overlay,
reboot, administrator credential persistence and UCI configuration persistence.

## Remaining gate before physical flash

Physical flash remains unauthorized.

Required next:
1. physical target board/hash/layout recheck
2. verify exact candidate file SHA on target
3. `sysupgrade -T` must PASS
4. preserve recovery path and current MTD backups
5. explicit user approval before flash

Never use blind `sysupgrade -F`.
