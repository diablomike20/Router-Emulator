# F9K1103 v1 RT3883 QEMU source truth — M1

## Scope

Belkin F9K1103 v1 / RT3883 original U-Boot QEMU M1 preparation.

## Exact binary contracts carried into M1

- exact physical mtd0 SHA-256: `3498feb4d33fe678319510af47b0ad5607c9a0006e217ad8babe6fc5317dadf7`
- exact U-Boot payload: legacy uImage, `N750F9K1103VB`, load/entry `0x80200000`, payload 168748 bytes
- exact physical mtd1 SHA-256: `000fe3eef5f03ca8a0ee43c7779e7562f42d1ddc51e8e304484b6d06a8df8adc`
- active env: first `0x1000` bytes, CRC verified
- normal recovery firmware flash offset: `0x00050000`
- hidden bootloader flash offset: `0x00000000`
- exact reset helper at `0x8021e850`: write literal `1` to `0xb0000034`

## Bootstrap contract

Historical F9K1103 v1 boot evidence reports 500 MHz CPU and DDR2.
MediaTek RT3883 source decodes that as:

- `SYSCFG0[9:8] = 3` -> 500 MHz CPU
- `SYSCFG0[17] = 1` -> DDR2 bus-clock branch

M1 initializes only the evidence-derived mask `0x00020300`.
Unknown strap bits remain zero rather than being invented.

## Reset contract

RT3883 RSTCTRL physical/KSEG1 address: `0x10000034` / `0xb0000034`.

- bit 0: whole-system reset
- bit 18: SPI controller reset
- bit 21: Frame Engine reset

Peripheral reset writes MUST NOT trigger whole-machine reset.
Whole-system reset preserves virtual SPI contents and re-enters the explicit
DIRECT_UBOOT_ENTRY_SHIM at `0x80200000`.

## Exact local fixture policy

The physical MTD bytes remain local/private and are NOT committed to this
public repository.

`scripts/RE-run-exact-f9k1103-v1-rt3883-m1.sh` accepts the recovered ZIP or
its extracted directory, validates the known exact mtd0/mtd1 SHA-256 values,
checks U-Boot legacy-image CRCs, extracts the executable payload, reconstructs
the exact 8 MiB SPI map, and launches the custom QEMU machine.

Physical SPI reconstruction:

- mtd0 u-boot: `0x000000`
- mtd1 uboot-env: `0x030000`
- mtd2 factory: `0x040000`
- mtd3 firmware: `0x050000`
- mtd7 user-cfg: `0x7f0000`

## M1 CI gates

Synthetic M1-prep probe must prove:

- flash alias
- GPIO25 recovery state
- evidence-derived 500 MHz / DDR2 SYSCFG0 bits
- FE reset does not reboot the machine
- SPI reset does not reboot the machine
- MX25L6405D-compatible RDID
- RSTCTRL bit0 performs system reset and returns to reset entry

## Fidelity boundary

- BootROM: `DIRECT_UBOOT_ENTRY_SHIM`
- CPU: QEMU `74Kf` compatibility baseline; physical PRId `0x0001974c` and
  cache geometry are evidence-known but not yet patched into CPU definitions
- RTL8367R-VB SMI control plane: not yet implemented in this branch
- FE/PDMA packet DMA: not yet implemented
- exact Belkin HTTPD/validator machine code is source-mapped, but live original
  recovery requires the later networking milestones
