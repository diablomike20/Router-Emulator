# RE-F9K1103 Cudy Candidate-15R2 lifecycle truth

## Scope

Firmware-first validation of the Cudy-derived F9K1103 Candidate-15R2 on the
custom RT3883/QEMU machine, using the recovered original Belkin U-Boot and an
8 MiB flash assembled from the exact Belkin layout.

## Firmware under test

- image: `RE-F9K1103-CUDY-WR1200E-CANDIDATE-15R2-BOOTFIRST-sysupgrade.bin`
- SHA-256: `8401d09c91fb94ff17f6f84afe786167e62db3721bc8a0419b6a80e41ad45937`
- legacy uImage identity: `N750F9K1103VB`
- status: `FLASH_AUTHORIZATION=NO`

No physical flash authorization is implied by emulator success.

## Emulator source used for the LAN breakthrough

Cudy-port branch:
`f9k1103-v1-rt3883-cudy-port-v1`

Critical RX producer reset fix:
`c3cd50b156135f680765d70df005b3c8737f33dc`

CI:
run `37868695809` — SUCCESS

The bug was that the guest's real `FE_PST_DRX_IDX0` reset cleared the visible
`RX_DRX_IDX0` register but the emulator's private RX producer cursor remained
at its old descriptor index.  After a network down/up cycle Linux restarted
from descriptor 0 while QEMU continued at a stale slot.  The fix resets both
the hardware-visible DRX index and the emulator producer cursor.

## Exact lifecycle verified

The following chain is now runtime verified:

1. original Belkin U-Boot 1.7.4 executes
2. exact Belkin flash layout is visible
3. Candidate-15R2 legacy uImage is found and accepted
4. Linux 4.4.140 starts
5. SquashFS root and overlay/userspace start
6. procd / ubus / init run
7. RTL8367R-VB is detected
8. RT3883 integrated WMAC identifies as RT3883 rev 0x0400 / RF3853
9. eth0.1 joins br-lan and reaches forwarding state
10. wlan00 joins br-lan and reaches forwarding state
11. host-to-guest Ethernet enters the guest PDMA RX ring
12. FE RX_DONE IRQ reaches Linux
13. Linux acknowledges the FE RX interrupt and advances RX_CALC_IDX
14. guest replies to host ARP for 192.168.1.1
15. bidirectional IPv4/TCP traffic is observed
16. uhttpd answers the host-forwarded request with HTTP 200
17. `/cgi-bin/luci/` executes through uhttpd/Lua/LuCI and reaches the Cudy
    bootstrap authentication template

Classification through item 16:
`LIFECYCLE_VERIFIED`

## Host network evidence

Guest LAN:
`192.168.1.1/24`

The earlier 192.168.10.x value belongs to the WISP/uplink side and MUST NOT be
used as the Candidate LAN address.

A successful post-fix capture contains:
- ARP request(s) for 192.168.1.1
- a guest ARP reply from 192.168.1.1
- guest-originated IPv4 frames
- bidirectional TCP frames for the forwarded HTTP session

Root HTTP request result:
`HTTP/1.1 200 OK`

The root page redirects to:
`cgi-bin/luci/`

## Current firmware-side blocker

Direct request:
`/cgi-bin/luci/`

The Cudy/LEDE bootstrap login HTML begins rendering and the Lua/LuCI dispatcher
executes, but template rendering terminates with:

```
Failed to execute template 'sysauth'.
Failed to execute template 'themes/bootstrap/sysauth'.
[string "/usr/lib/lua/luci/view/themes/bootstrap/sys..."]:16:
bad argument #1 to 'find' (string expected, got nil)
```

Therefore the current blocker is no longer Ethernet, PDMA, Slirp, uhttpd, or
basic LuCI CGI execution.  It is a Candidate firmware/UI runtime adaptation
issue in the exact Cudy `themes/bootstrap/sysauth` template or one of the
template variables it consumes.

Status:
`CUDY_LUCI_SYSAUTH_TEMPLATE = NEXT_FIRMWARE_BLOCKER`

## SSH status

The host-forwarded TCP connection to guest port 22 is accepted, but the
connection closes before an SSH banner is returned.

- SSH TCP connect: PASS
- SSH banner: UNVERIFIED / FAIL
- interactive shell: NOT CLAIMED

## Privacy

No recovered private MTD, factory calibration, U-Boot environment contents,
serial number, PIN or unique MAC address is stored in this public evidence
file.

## Physical-flash gate

Still required before any physical installation:
- exact board/layout verification
- artifact hash verification
- `sysupgrade -T`
- explicit user approval

Never use blind `sysupgrade -F`.

## Project priority

Firmware-first.  Fix and validate the Cudy LuCI runtime and then move toward a
physical preflight candidate.  Windows emulator packaging remains secondary.
