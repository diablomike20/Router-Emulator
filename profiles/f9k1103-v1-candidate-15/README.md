# Belkin F9K1103 v1 — Cudy Candidate-15R2 emulator profile

Branch: `f9k1103-v1-candidate-15-emulator-v1`

Subject under test:

- hardware target: **Belkin F9K1103 v1 / N750 DB**
- firmware: `RE-F9K1103-CUDY-WR1200E-CANDIDATE-15R2-BOOTFIRST-sysupgrade.bin`
- firmware SHA-256: `8401d09c91fb94ff17f6f84afe786167e62db3721bc8a0419b6a80e41ad45937`
- firmware size: `6267492` bytes
- Candidate ROM version: `2.4.25-F9K1103-Cudy-C15R2`
- source lineage: physically boot-proven WIP03 RADIOFIX + WR1200E R62 2.4.25 Cudy application layer

This profile is deliberately named after the real hardware revision. Candidate-15R2 is a firmware build label, not a router revision.

## Purpose

Use FirmAE/QEMU to test the Candidate-15R2 userspace and Cudy web stack before another physical flash.

Primary emulator gates:

1. MIPS userspace reaches procd/runtime.
2. uHTTPd serves HTTP/HTTPS.
3. Cudy static assets are reachable.
4. LuCI/Cudy login HTML renders.
5. The emulator-only test password authenticates through the Candidate-15 admin -> root verifier contract.
6. Post-login Dashboard HTML renders instead of returning a blank/login page.
7. Serial and web evidence are saved for missing helper/library/controller/model failures.

## Fidelity

`COMPATIBILITY_SHIMMED`.

This is **not RT3883 hardware emulation**. QEMU Malta + FirmAE supplies the kernel and e1000 NICs.

The emulator must not be used as proof for RTL8367R switch behavior, RT309x/RT3883 radios, GPIO, EEPROM/factory MTD, or physical sysupgrade/recovery.

The emulator copy uses:

- `eth1` as LAN, `192.168.10.2/24`
- `eth0` as WAN DHCP
- HTTP `127.0.0.1:18080 -> 192.168.10.2:80`
- HTTPS `127.0.0.1:18443 -> 192.168.10.2:443`
- emulator-only root password: `candidate15`

The test password exists only in the extracted emulator guest tree. It is not written back into the physical firmware image.
