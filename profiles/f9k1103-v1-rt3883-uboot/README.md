# Belkin F9K1103 v1 — RT3883 / original U-Boot emulator

Goal: an evidence-driven QEMU machine that can eventually run the original
Belkin/Ralink U-Boot and its own HTTP recovery path.

Target: RT3883 500 MHz, 64 MiB RAM, 8 MiB SPI NOR, RTL8367R-VB, reset GPIO25.
Machine: `rt3883-f9k1103v1`.

M0 models RAM, RT3883 low MMIO, Ralink UART-lite, recovery GPIO25, 8 MiB
virtual SPI NOR at 0x1c000000, a legacy SPI subset and a Frame Engine register
placeholder. CI probes UART, flash alias, GPIO25 and MX25L6405D RDID c2 20 17.

Fidelity boundary: the internal RT3883 16 KiB BootROM is not available, so M0
loads U-Boot at physical 0x00200000 and enters 0x80200000. Upstream QEMU 8.2.x
has 74Kf but not 74Kc, so M0 temporarily uses 74Kf.

Next: original U-Boot serial banner/menu; INTCTL/timer; Frame Engine/PDMA plus
RTL8367R-VB SMI; original HTTP recovery; SPI erase/write; reboot from uploaded
firmware.
