# F9K1103 Cudy Candidate-15R6 exact lifecycle truth

## Firmware

- image: `RE-F9K1103-CUDY-WR1200E-CANDIDATE-15R6-BOOTFIRST-sysupgrade.bin`
- SHA-256: `08d1500c3e4bc713815c6ddd143361f9107799d317f482fcb8dbb48a2130ca7b`
- source branch: `re-f9k1103-cudy-candidate-15r6-authstate`
- build source/workflow head: `fd95fb7527740ff35815fe4cfb5c195baf547e09`
- build workflow run: `37875263918` — SUCCESS
- `FLASH_AUTHORIZATION=NO`

## Exact virtual F9K1103 runtime verified

- original Belkin U-Boot execution
- C15R6 kernel/userspace boot
- RT3883 WMAC rev `0x0400` / RF3853
- RTL8367R-VB path
- bidirectional LAN / HTTP transport
- Cudy Create administrator password page rendered
- donor-compatible minimum password length: 8
- real password creation POST -> HTTP 302 + `sysauth` session cookie
- fresh-cookie re-login with the newly created password -> HTTP 302 + new `sysauth` cookie
- authenticated Cudy landing page -> HTTP 200
- authenticated top-level menu renders
- Dropbear SSH transport responds

Classification:
`LIFECYCLE_VERIFIED` through browser-compatible firstboot password creation,
fresh-session re-login, authenticated landing page, LAN/HTTP and SSH transport.

## Current blocker

Configuration/reboot persistence is still `UNVERIFIED` because the current
virtual flash lifecycle does not yet provide a verified persistent JFFS2
`rootfs_data` overlay across reboot.

A previous raw post-flash image construction allowed the sysupgrade fwtool trailer
to pollute the area that should become `rootfs_data`; that pollution was identified
and removed. The current QEMU execution still falls back to tmpfs overlay, so this is
classified as an emulator/storage-lifecycle blocker, not a demonstrated C15R6
firmware failure.

## Next firmware-first gate

1. make virtual `rootfs_data` JFFS2 lifecycle persistent
2. authenticated config write/apply
3. service/network reload
4. reboot
5. verify configuration and administrator credential persistence
6. target-side board/hash/layout preflight
7. `sysupgrade -T` PASS
8. explicit user approval before any physical flash

Never use blind `sysupgrade -F`.
