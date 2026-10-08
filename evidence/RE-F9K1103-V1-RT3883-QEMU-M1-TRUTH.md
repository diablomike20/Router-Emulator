# F9K1103 v1 RT3883 QEMU source truth — M1

## Scope

Belkin F9K1103 v1 / RT3883 original U-Boot and Linux boot on the custom QEMU machine.

## Exact binary contracts

- exact physical mtd0 SHA-256: `3498feb4d33fe678319510af47b0ad5607c9a0006e217ad8babe6fc5317dadf7`
- exact U-Boot payload: legacy uImage `N750F9K1103VB`, load/entry `0x80200000`, payload 168748 bytes
- exact physical mtd1 SHA-256: `000fe3eef5f03ca8a0ee43c7779e7562f42d1ddc51e8e304484b6d06a8df8adc`
- active env: first `0x1000` bytes, CRC verified
- normal firmware flash offset: `0x00050000`
- hidden bootloader flash offset: `0x00000000`
- exact reset helper: literal `1` to `0xb0000034`

Private recovered MTD bytes are never committed to the public repository.

## Current main branch

`f9k1103-v1-rt3883-uboot-emulator-m1`

Current HEAD:
`6e2725da8b3f170ddaa3d5ee5f1372a6fdd65920`

Latest CI:
run `37714685665` — SUCCESS

## CI-verified machine gates

- flash alias
- GPIO25 recovery input
- GPIO24..39 bank semantics
- 500 MHz / DDR2 SYSCFG0
- RT3883 REVID 1 / ECO 5 source value
- 64 MiB SDRAM mirror
- PCI host no-link behavior
- two-port USB host model
- peripheral reset isolation
- SPI RDID
- SPI RDSR STARTWR/STARTRD self-clearing strobe behavior
- whole-system reset
- RT3883 WMAC 0x10180000 / 0x40000 MMIO identity window
- WMAC MAC_CSR0 identity `0x38830400`
- WMAC BBP indirect BUSY/read/write handshake
- WMAC RFCSR indirect BUSY/read/write handshake
- RT3883 FE/PDMA TX completion lifecycle and CPU IRQ5 signaling

## Exact runtime progression

Exact physical Belkin U-Boot and exact reconstructed 8 MiB flash have been executed locally.

Verified runtime chain:

1. original Belkin U-Boot 1.7.4 executes
2. 64 MiB DRAM and 500 MHz CPU path
3. MX25L6405D RDID
4. exact mtd1 environment reads correctly
5. original RTL8367R-VB U-Boot vendor init continues with the SMI model
6. exact `N750F9K1103VB` firmware image is found
7. legacy uImage checksum verifies
8. LZMA kernel decompresses
9. Linux 4.4.140 receives control
10. Linux detects 64 MiB RAM
11. RT3883 PCI host probe completes with an honest empty/no-link downstream bus
12. SPI NOR and all F9K1103 partitions enumerate
13. SquashFS root mounts
14. init/watchdog start
15. Frame Engine reaches fixed-link eth0 setup
16. EHCI at `0x101c0000` starts successfully
17. JFFS2 overlay mounts
18. procd enters early/watchdog/ubus/init
19. normal module loading begins
20. RT3883 integrated WMAC driver reaches factory EEPROM load

## RTL8367 status

U-Boot side:
- GPIO1 SDA / GPIO2 SCK SMI runtime path: LIFECYCLE_VERIFIED
- original Belkin vendor switch init no longer fails at the former `0x13C2` write

Linux side:
- `rtl8367b` identifies an RTL8367R-VB chip
- earlier exact runtime on the WMAC-shell branch verified the Linux CHIP_RESET self-clear fix through `libphy: rtl8367: probed`
- that reset behavior has been reintegrated into the current M1 branch
- current integrated HEAD still requires a fresh exact-runtime revalidation after the recent WMAC/PDMA changes

## USB status

EHCI:
- exact Linux runtime reaches `USB 2.0 started, EHCI 1.00`
- this closes the former `0x101c0000` data-bus-error blocker

OHCI:
- controller is mapped and probed
- reset currently times out
- failure is non-fatal to the boot path observed so far

## Current exact-runtime blocker

The former fatal WMAC-unmapped blocker at physical `0x10180000` is closed at the model/CI level.

A later exact runtime reached:
- WMAC identity: RT3883 rev `0x0400`
- RF identity: RF3853
- BBP indirect access at `WMAC+0x101c`

The current branch now additionally models:
- BBP indirect BUSY self-clear/read/write
- RFCSR indirect BUSY self-clear/read/write
- FE/PDMA TX completion + IRQ5

These newest semantics are CI-verified but still require a fresh integrated exact-runtime run before they can be promoted to LIFECYCLE_VERIFIED.

Status:
`CURRENT_NEXT_BLOCKER = TARGET_RUNTIME_REQUIRED_AFTER_WMAC_RFCSR_PDMA_INTEGRATION`

## F9K1109 v1 donor runtime evidence

Classification: `DONOR_RUNTIME_VERIFIED` — not a substitute for F9K1103 exact evidence, but unusually strong because the F9K1109 v1 is the same RT3883 / RTL8367R-VB Belkin family and OpenWrt still uses the stock image identity `N750F9K1103VB`.

Public OpenWrt device-page UART logs provide both OEM and OpenWrt boots.

OEM bootlog confirms:
- ARC U-Boot 1.7.4 / Ralink U-Boot 3.5.2.0
- RT3883_MP
- DDR2, 64 MiB
- CPU 500 MHz
- MX25L6405D JEDEC `c2 20 17`
- 64 KiB I-cache / 32 KiB D-cache, 4-way, 32-byte lines
- RTL8367R-VB identity `0x1010`
- stock image name `N750F9K1103VB`
- CPU PRId `0x0001974c`

OpenWrt bootlog confirms:
- RT3883 ver 1 / eco 5
- MIPS 74Kc PRId `0x0001974c`
- 64 MiB RAM
- same SPI NOR and 0x30000/0x10000/0x10000/0x7a0000/0x10000 partition scheme
- Frame Engine at `0x10100000`, CPU IRQ5, fixed 1000/full link
- PCI radio: RT chipset 3071 rev `0x021c`, RF chipset `0x0008`
- SoC WMAC: RT chipset 3883 rev `0x0400`, RF chipset 3853
- both radios load EEPROM from the `factory` partition

This donor log independently validates the emulator's current RT3883 identity, RF3853 WMAC path, FE IRQ5 wiring, SPI layout, cache geometry target and RTL8367R-VB identity.

OpenWrt support-lineage evidence:
- initial support commit: `f2c83532f92c5fa43165e1c5a3cd7f5cf4e9e3b3`
- the commit deliberately split the shared hardware description into `F9K110x.dtsi`
- maintainer note explicitly says this was done "to prepare for a possible F9K1103 patch"
- shared source contract includes RT3883, exact 8 MiB partition map, fixed 1G RGMII, WMAC EEPROM at factory+0, PCI RT3091 EEPROM at factory+0x8000, EHCI/OHCI, and the stock image identity `N750F9K1103VB`
- classification: `SOURCE_VERIFIED_SHARED_F9K110X_LINEAGE`


## Fidelity boundary

- BootROM: `DIRECT_UBOOT_ENTRY_SHIM`
- CPU: QEMU `74Kf` compatibility baseline
- physical F9K1103 CPU evidence: PRId `0x0001974c`, 64 KiB I-cache, 32 KiB D-cache, 4-way, 32-byte lines
- current exact-runtime logs from older artifacts can still show QEMU PRId/cache geometry; this is a known fidelity gap
- FE/PDMA packet transport is not yet full host-network dataplane fidelity
- integrated 2.4 GHz PCI RT309x endpoint is not yet modeled
- WMAC BBP/RFCSR semantics are present but full radio dataplane/IRQ/DMA fidelity is not yet claimed

## User-input dependency

None.

UART MUST NOT BE REQUESTED. Historical F9K1103 boot evidence plus exact recovered flash provide the required physical truth for current work.

## Project purpose

This emulator is not an end in itself. The target is a sufficiently faithful virtual F9K1103 platform on which the Cudy firmware / adapted Cudy build can be exercised before risking the physical Belkin hardware.
