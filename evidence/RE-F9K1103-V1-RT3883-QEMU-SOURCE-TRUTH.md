# F9K1103 v1 RT3883 QEMU source truth — M0

Sources: exact F9K1103 GPL project truth, MediaTek APSoC SDK, RT3883-capable
Ralink U-Boot, DIR-645 RT3883 Linux GPL, RTL8367R/RB API material and MIPS32
74Kc datasheet.

RT3883 physical MMIO: SYSCTL 0x10000000, TIMER 0x10000100, INTCTL 0x10000200,
MEMCTRL 0x10000300, UART 0x10000500, PIO 0x10000600, SPI 0x10000b00,
UARTLITE 0x10000c00, Frame Engine 0x10100000, PCI/PCIe 0x10140000,
WLAN 0x10180000, USB host 0x101c0000.

UART-lite offsets: RBR 00, TBR 04, IER 08, IIR 0c, FCR 10, LCR 14, MCR 18,
LSR 1c, DLL 2c, DLM 30.

The OnionIoT u-boot/httpd/httpd.c is confirmed as the same broad Ralink/MediaTek
webfailsafe HTTPD family: uIP port 80, GET/POST, multipart parsing,
firmware/uboot/art upload names, WEBFAILSAFE upload RAM, size gates and
webfailsafe_ready_for_upgrade. Treat as LINEAGE_SOURCE, not Belkin-byte-exact.

M0 requires QEMU build, flash alias, GPIO25 recovery, SPI RDID and machine
smoke PASS. M0 is not yet original Belkin U-Boot recovery PASS.
