.set noreorder
.set noat
.text
.globl _start
_start:
    /*
     * QEMU system reset preserves guest RAM.  Use one scratch word so the
     * probe can prove that RSTCTRL bit0 really returns execution to the RT3883
     * reset entry instead of being confused with peripheral reset bits.
     */
    lui $t0,0x8001
    lw $t1,0($t0)
    li $t2,0x4d315253
    beq $t1,$t2,after_system_reset
    nop

    lui $t0,0xbc00
    lbu $t1,0($t0)
    li $t2,0x5a
    bne $t1,$t2,flash_fail
    nop
    la $a0,msg_flash
    jal uart_puts
    nop

    /*
     * GPIO25 belongs to RT3883 bank 24..39: DATA 0xb0000648,
     * bank bit1.  The old M0 probe incorrectly treated it as bank0 bit25.
     */
    lui $t0,0xb000
    ori $t0,$t0,0x0648
    lw $t1,0($t0)
    andi $t1,$t1,0x0002
    bnez $t1,gpio_fail
    nop
    la $a0,msg_gpio
    jal uart_puts
    nop

    /*
     * Prove GPIO24 switch-reset latch semantics in the same bank:
     * DIR bit0 output, RESET bit0 drives low, SET bit0 drives high.
     */
    lui $s2,0xb000
    ori $s2,$s2,0x064c
    li $t0,0x1
    sw $t0,0($s2)

    lui $s3,0xb000
    ori $s3,$s3,0x0658
    sw $t0,0($s3)
    lui $s4,0xb000
    ori $s4,$s4,0x0648
    lw $t1,0($s4)
    andi $t1,$t1,0x0001
    bnez $t1,gpio_bank_fail
    nop

    lui $s3,0xb000
    ori $s3,$s3,0x0654
    sw $t0,0($s3)
    lw $t1,0($s4)
    andi $t1,$t1,0x0001
    beqz $t1,gpio_bank_fail
    nop

    /* Recovery input GPIO25 must remain asserted low. */
    lw $t1,0($s4)
    andi $t1,$t1,0x0002
    bnez $t1,gpio_bank_fail
    nop

    la $a0,msg_gpio_bank
    jal uart_puts
    nop

    /*
     * Physical F9K1103 boot evidence: 500 MHz + DDR2.
     * RT3883 lineage decodes this as SYSCFG0[9:8]=3, bit17=1.
     */
    lui $t0,0xb000
    ori $t0,$t0,0x0010
    lw $t1,0($t0)
    li $t2,0x00020300
    and $t1,$t1,$t2
    bne $t1,$t2,syscfg_fail
    nop
    la $a0,msg_syscfg
    jal uart_puts
    nop

    /*
     * Linux/MIPS detect_memory_region() probes powers of two above a magic
     * word.  On the physical 64 MiB RT3883 board, address bit 26 wraps and
     * +64 MiB aliases the same SDRAM.  Prove that without advertising 128 MiB.
     */
    lui $t0,0x8010
    li $t1,0x52414d36
    sw $t1,0($t0)
    lui $t2,0x8410
    lw $t3,0($t2)
    bne $t1,$t3,ram_mirror_fail
    nop
    la $a0,msg_ram_mirror
    jal uart_puts
    nop

    /*
     * RT3883 PCI host exists at phys 0x10140000.  M1 deliberately exposes
     * the controller but no fabricated RT309x endpoint yet:
     * - normal host registers are readable/writable,
     * - PCIe status1 bit0 stays clear (link down),
     * - config-data reads return 0xffffffff (no device).
     */
    lui $s5,0xb014
    li $t0,0x79
    sw $t0,0x0080($s5)
    lw $t1,0x0080($s5)
    bne $t0,$t1,pci_host_fail
    nop
    lw $t1,0x2050($s5)
    bnez $t1,pci_host_fail
    nop
    lw $t1,0x0024($s5)
    li $t2,-1
    bne $t1,$t2,pci_host_fail
    nop
    la $a0,msg_pci_host
    jal uart_puts
    nop

    /*
     * FE reset is bit21.  This write must not reboot the whole machine.
     */
    lui $s1,0xb000
    ori $s1,$s1,0x0034
    li $t0,0x00200000
    sw $t0,0($s1)
    sw $zero,0($s1)
    la $a0,msg_periph_reset
    jal uart_puts
    nop

    /*
     * SPI reset is bit18.  Exercise it before RDID to prove the controller
     * reset and the whole-system reset paths are distinct.
     */
    li $t0,0x00040000
    sw $t0,0($s1)
    sw $zero,0($s1)

    lui $s0,0xb000
    ori $s0,$s0,0x0b00
    /*
     * Exercise SPI exactly like the legacy RT3883 driver: CTL action bits
     * are set with read-modify-write and must self-clear in hardware.
     * This catches the stale-STARTWR bug which allowed RDID but broke the
     * very next RDSR transaction in the exact Belkin U-Boot.
     */
    sw $zero,0x14($s0)
    li $t0,0x9f
    sw $t0,0x20($s0)
    lw $t0,0x14($s0)
    ori $t0,$t0,0x04
    sw $t0,0x14($s0)
    lw $t0,0x14($s0)
    ori $t0,$t0,0x02
    sw $t0,0x14($s0)
    lw $t1,0x20($s0)
    li $t2,0xc2
    bne $t1,$t2,spi_fail
    nop
    lw $t0,0x14($s0)
    ori $t0,$t0,0x01
    sw $t0,0x14($s0)
    la $a0,msg_spi
    jal uart_puts
    nop

    /* Immediately follow RDID with RDSR; expected idle status is 0x00. */
    lw $t0,0x14($s0)
    andi $t0,$t0,0xfffe
    sw $t0,0x14($s0)
    li $t0,0x05
    sw $t0,0x20($s0)
    lw $t0,0x14($s0)
    ori $t0,$t0,0x04
    sw $t0,0x14($s0)
    lw $t0,0x14($s0)
    ori $t0,$t0,0x02
    sw $t0,0x14($s0)
    lw $t1,0x20($s0)
    bnez $t1,spi_rdsr_fail
    nop
    lw $t0,0x14($s0)
    ori $t0,$t0,0x01
    sw $t0,0x14($s0)
    la $a0,msg_spi_rdsr
    jal uart_puts
    nop

    /*
     * RT3883 integrated EHCI host controller.
     * Prove the minimal no-device core semantics required by Linux:
     *   - EHCI 1.0, CAPLENGTH 0x20
     *   - two root-hub ports
     *   - reset starts HCHalted
     *   - HCRESET self-clears
     *   - RUN clears HCHalted; stop restores it
     */
    lui $s6,0xb01c
    lw $t1,0x0000($s6)
    li $t2,0x01000020
    bne $t1,$t2,usbhost_fail
    nop
    lw $t1,0x0004($s6)
    andi $t1,$t1,0x000f
    li $t2,0x0002
    bne $t1,$t2,usbhost_fail
    nop
    lw $t1,0x0024($s6)
    andi $t1,$t1,0x1000
    beqz $t1,usbhost_fail
    nop

    li $t0,0x0002
    sw $t0,0x0020($s6)
    lw $t1,0x0020($s6)
    andi $t1,$t1,0x0002
    bnez $t1,usbhost_fail
    nop

    li $t0,0x0001
    sw $t0,0x0020($s6)
    lw $t1,0x0024($s6)
    andi $t1,$t1,0x1000
    bnez $t1,usbhost_fail
    nop

    sw $zero,0x0020($s6)
    lw $t1,0x0024($s6)
    andi $t1,$t1,0x1000
    beqz $t1,usbhost_fail
    nop

    /* RT3883 UHST peripheral reset is RSTCTRL bit22, not system reset. */
    li $t0,0x00400000
    sw $t0,0($s1)
    sw $zero,0($s1)
    lw $t1,0x0000($s6)
    li $t2,0x01000020
    bne $t1,$t2,usbhost_fail
    nop

    la $a0,msg_usbhost
    jal uart_puts
    nop

    /*
     * RT3883 OHCI companion starts at 0x101c1000.  Prove standard OHCI 1.0
     * revision, two root-hub ports and self-clearing HostControllerReset.
     */
    lui $s5,0xb01c
    ori $s5,$s5,0x1000
    lw $t1,0x0000($s5)
    li $t2,0x0010
    bne $t1,$t2,ohci_fail
    nop
    lw $t1,0x0048($s5)
    andi $t1,$t1,0x00ff
    li $t2,0x0002
    bne $t1,$t2,ohci_fail
    nop
    li $t0,0x0001
    sw $t0,0x0008($s5)
    lw $t1,0x0008($s5)
    andi $t1,$t1,0x0001
    bnez $t1,ohci_fail
    nop
    la $a0,msg_ohci
    jal uart_puts
    nop

    /*
     * RT3883 integrated WMAC lives at physical 0x10180000.  M1 does not
     * invent an RF device yet; prove the MMIO aperture and WLAN reset path.
     */
    lui $s7,0xb018
    lw $t1,0x1000($s7)
    bnez $t1,wmac_fail
    nop
    li $t0,0x574d4143
    sw $t0,0x1000($s7)
    lw $t1,0x1000($s7)
    bne $t0,$t1,wmac_fail
    nop

    li $t0,0x00100000
    sw $t0,0($s1)
    sw $zero,0($s1)
    lw $t1,0x1000($s7)
    bnez $t1,wmac_fail
    nop

    la $a0,msg_wmac
    jal uart_puts
    nop

    /*
     * Exact Belkin reset helper writes literal 1 to 0xb0000034.
     */
    lui $t0,0x8001
    li $t1,0x4d315253
    sw $t1,0($t0)
    li $t1,0x1
    sw $t1,0($s1)
reset_wait:
    b reset_wait
    nop

after_system_reset:
    sw $zero,0($t0)
    la $a0,msg_system_reset
    jal uart_puts
    nop
    la $a0,msg_pass
    jal uart_puts
    nop
hang:
    b hang
    nop

flash_fail:
    la $a0,msg_flash_fail
    jal uart_puts
    nop
    b hang
    nop
gpio_fail:
    la $a0,msg_gpio_fail
    jal uart_puts
    nop
    b hang
    nop
gpio_bank_fail:
    la $a0,msg_gpio_bank_fail
    jal uart_puts
    nop
    b hang
    nop
pci_host_fail:
    la $a0,msg_pci_host_fail
    jal uart_puts
    nop
    b hang
    nop
ram_mirror_fail:
    la $a0,msg_ram_mirror_fail
    jal uart_puts
    nop
    b hang
    nop
ohci_fail:
    la $a0,msg_ohci_fail
    jal uart_puts
    nop
    b hang
    nop
wmac_fail:
    la $a0,msg_wmac_fail
    jal uart_puts
    nop
    b hang
    nop
usbhost_fail:
    la $a0,msg_usbhost_fail
    jal uart_puts
    nop
    b hang
    nop
syscfg_fail:
    la $a0,msg_syscfg_fail
    jal uart_puts
    nop
    b hang
    nop
spi_rdsr_fail:
    la $a0,msg_spi_rdsr_fail
    jal uart_puts
    nop
    b hang
    nop
spi_fail:
    la $a0,msg_spi_fail
    jal uart_puts
    nop
    b hang
    nop

uart_puts:
    lui $t8,0xb000
    ori $t8,$t8,0x0c04
1:
    lbu $t9,0($a0)
    beqz $t9,2f
    nop
    sw $t9,0($t8)
    addiu $a0,$a0,1
    b 1b
    nop
2:
    jr $ra
    nop

.data
msg_flash: .asciz "RT3883_F9K1103V1_FLASH_ALIAS_GATE=PASS\n"
msg_gpio: .asciz "RT3883_F9K1103V1_GPIO25_RECOVERY_GATE=PASS\n"
msg_gpio_bank: .asciz "RT3883_F9K1103V1_GPIO24_39_BANK_GATE=PASS\n"
msg_syscfg: .asciz "RT3883_F9K1103V1_SYSCFG0_500_DDR2_GATE=PASS\n"
msg_ram_mirror: .asciz "RT3883_F9K1103V1_SDRAM_64M_MIRROR_GATE=PASS\n"
msg_pci_host: .asciz "RT3883_F9K1103V1_PCI_HOST_NOLINK_GATE=PASS\n"
msg_periph_reset: .asciz "RT3883_F9K1103V1_PERIPHERAL_RESET_ISOLATION_GATE=PASS\n"
msg_usbhost: .asciz "RT3883_F9K1103V1_USBHOST_EHCI_NODVC_GATE=PASS\n"
msg_ohci: .asciz "RT3883_F9K1103V1_USBHOST_OHCI_NODVC_GATE=PASS\n"
msg_wmac: .asciz "RT3883_F9K1103V1_WMAC_MMIO_NODVC_GATE=PASS\n"
msg_spi: .asciz "RT3883_F9K1103V1_SPI_RDID_GATE=PASS\n"
msg_spi_rdsr: .asciz "RT3883_F9K1103V1_SPI_RDSR_STROBE_GATE=PASS\n"
msg_system_reset: .asciz "RT3883_F9K1103V1_SYSTEM_RESET_GATE=PASS\n"
msg_pass: .asciz "RT3883_F9K1103V1_MACHINE_M1_PREP_GATE=PASS\n"
msg_flash_fail: .asciz "RT3883_F9K1103V1_FLASH_ALIAS_GATE=FAIL\n"
msg_gpio_fail: .asciz "RT3883_F9K1103V1_GPIO25_RECOVERY_GATE=FAIL\n"
msg_gpio_bank_fail: .asciz "RT3883_F9K1103V1_GPIO24_39_BANK_GATE=FAIL\n"
msg_usbhost_fail: .asciz "RT3883_F9K1103V1_USBHOST_EHCI_NODVC_GATE=FAIL\n"
msg_ohci_fail: .asciz "RT3883_F9K1103V1_USBHOST_OHCI_NODVC_GATE=FAIL\n"
msg_wmac_fail: .asciz "RT3883_F9K1103V1_WMAC_MMIO_NODVC_GATE=FAIL\n"
msg_syscfg_fail: .asciz "RT3883_F9K1103V1_SYSCFG0_500_DDR2_GATE=FAIL\n"
msg_ram_mirror_fail: .asciz "RT3883_F9K1103V1_SDRAM_64M_MIRROR_GATE=FAIL\n"
msg_pci_host_fail: .asciz "RT3883_F9K1103V1_PCI_HOST_NOLINK_GATE=FAIL\n"
msg_spi_fail: .asciz "RT3883_F9K1103V1_SPI_RDID_GATE=FAIL\n"
msg_spi_rdsr_fail: .asciz "RT3883_F9K1103V1_SPI_RDSR_STROBE_GATE=FAIL\n"
