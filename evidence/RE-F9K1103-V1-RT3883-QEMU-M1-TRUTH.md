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
`feaef6f250f23c901a7ed26f1f2ba1ab42efe84d`

Latest CI:
run `37710026437` — SUCCESS

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
- `rtl8367b` now identifies an RTL8367R-VB chip
- chip reset currently times out
- Linux-side switch reset/register lifecycle is therefore still incomplete

## USB status

EHCI:
- exact Linux runtime reaches `USB 2.0 started, EHCI 1.00`
- this closes the former `0x101c0000` data-bus-error blocker

OHCI:
- controller is mapped and probed
- reset currently times out
- failure is non-fatal to the boot path observed so far

## Current exact-runtime blocker

The next fatal blocker is the integrated RT3883 WMAC at:

- physical `0x10180000`
- KSEG1 `0xb0180000`

Linux `rt2800_wmac` loads EEPROM data from the exact `factory` partition and then performs MMIO against the WMAC region. The current machine does not yet model that region, causing a data bus error during `rt2800soc` probe.

Status:
`RT3883_WMAC_0x10180000 = REQUIRED / NEXT_FATAL_BLOCKER`

## Fidelity boundary

- BootROM: `DIRECT_UBOOT_ENTRY_SHIM`
- CPU: QEMU `74Kf` compatibility baseline
- physical F9K1103 CPU evidence: PRId `0x0001974c`, 64 KiB I-cache, 32 KiB D-cache, 4-way, 32-byte lines
- current exact-runtime logs from older artifacts can still show QEMU PRId/cache geometry; this is a known fidelity gap
- FE/PDMA packet transport is not yet full network lifecycle fidelity
- integrated 2.4 GHz PCI RT309x endpoint is not yet modeled
- RT3883 integrated WMAC is the current fatal boot blocker

## User-input dependency

None.

UART MUST NOT BE REQUESTED. Historical F9K1103 boot evidence plus exact recovered flash provide the required physical truth for current work.

## Project purpose

This emulator is not an end in itself. The target is a sufficiently faithful virtual F9K1103 platform on which the Cudy firmware / adapted Cudy build can be exercised before risking the physical Belkin hardware.
