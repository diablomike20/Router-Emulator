# F9K1103 Cudy Candidate-15R3 exact lifecycle truth

## Firmware

- image: `RE-F9K1103-CUDY-WR1200E-CANDIDATE-15R3-BOOTFIRST-sysupgrade.bin`
- SHA-256: `b97ecfaaf21d4b28f0eea0a86e0c0bd6c8f31f7e45e54b2ec81390a20d57edcd`
- legacy uImage identity: `N750F9K1103VB`
- firmware source branch: `re-f9k1103-cudy-candidate-15r3-luci`
- successful source commit: `4d92d870bc709589823409ddb4af07077d896e4c`
- firmware workflow run: `37870826905` — SUCCESS
- `FLASH_AUTHORIZATION=NO`

## Candidate-15R3 repair

Candidate-15R2 reached the Cudy bootstrap authentication template but failed because the
Cudy sysauth template indexed an empty LuCI language registry.

Exact WR1200E R62 2.4.25 donor analysis proved the base `/etc/config/luci`
languages section is intentionally empty. The donor's
`/etc/uci-defaults/luci-i18n-business-*` scripts populate the runtime registry.
Candidate-15R3 reproduces only that exact resulting language map without importing
or executing donor rc.d, hotplug, or uci-defaults wholesale.

Exact recovered codes:
`de,en,es,fr,he,it,ko,pt,ru,uk`.

## Exact runtime result

Using the original recovered Belkin U-Boot payload and the exact 8 MiB F9K1103
flash layout, Candidate-15R3 reaches:

1. original Belkin U-Boot
2. Candidate-15R3 image validation and kernel handoff
3. Linux 4.4.140
4. SquashFS/userspace
5. procd / ubus / init
6. RTL8367R-VB detection and probe
7. RT3883 WMAC identification as RT3883 rev 0x0400 / RF3853
8. eth0.1 and wlan00 forwarding through br-lan
9. host-to-guest PDMA RX and RX_DONE lifecycle
10. bidirectional IPv4/TCP over Slirp
11. root HTTP: `HTTP/1.1 200 OK`
12. `/cgi-bin/luci/`: `HTTP/1.1 403 Forbidden` as the expected unauthenticated login response
13. clean Cudy login modal rendering with no template exception
14. exact donor language options rendered
15. footer reports `FW: 2.4.25-F9K1103-Cudy-C15R3`
16. host-forwarded SSH returns `SSH-2.0-dropbear`

Gate summary:

```
CUDY_C15R3_EXACT_BOOT=YES
CUDY_C15R3_ROOT_HTTP=YES
CUDY_C15R3_LUCI_CLEAN=YES
CUDY_C15R3_LOGIN_FORM=YES
CUDY_C15R3_LANGUAGE_REGISTRY=YES
CUDY_C15R3_SSH_BANNER=YES
```

Classification:
`LIFECYCLE_VERIFIED` for boot, LAN, HTTP, unauthenticated LuCI login rendering,
and SSH transport.

## Current next gate

Firmware-first priority:
- validate LuCI authentication/session creation
- validate post-login dashboard/core pages
- validate config write/apply/reload
- validate reboot persistence

Interactive SSH authentication is not yet claimed.

Physical flash remains explicitly unauthorized until target-side board/layout/hash
checks and `sysupgrade -T` pass and the user explicitly approves the flash.
Never use blind `sysupgrade -F`.

No private MTD bytes, serial number, PIN, factory calibration or unique MAC address
are stored in this evidence file.
