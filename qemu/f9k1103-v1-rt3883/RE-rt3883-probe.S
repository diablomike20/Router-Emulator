.set noreorder
.set noat
.text
.globl _start
_start:
    lui $t0,0xbc00
    lbu $t1,0($t0)
    li $t2,0x5a
    bne $t1,$t2,flash_fail
    nop
    la $a0,msg_flash
    jal uart_puts
    nop
    lui $t0,0xb000
    ori $t0,$t0,0x0620
    lw $t1,0($t0)
    lui $t2,0x0200
    and $t1,$t1,$t2
    bnez $t1,gpio_fail
    nop
    la $a0,msg_gpio
    jal uart_puts
    nop
    lui $s0,0xb000
    ori $s0,$s0,0x0b00
    sw $zero,0x14($s0)
    li $t0,0x9f
    sw $t0,0x20($s0)
    li $t0,0x04
    sw $t0,0x14($s0)
    li $t0,0x02
    sw $t0,0x14($s0)
    lw $t1,0x20($s0)
    li $t2,0xc2
    bne $t1,$t2,spi_fail
    nop
    li $t0,0x01
    sw $t0,0x14($s0)
    la $a0,msg_spi
    jal uart_puts
    nop
    la $a0,msg_pass
    jal uart_puts
    nop
hang: b hang
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
msg_spi: .asciz "RT3883_F9K1103V1_SPI_RDID_GATE=PASS\n"
msg_pass: .asciz "RT3883_F9K1103V1_MACHINE_M0_GATE=PASS\n"
msg_flash_fail: .asciz "RT3883_F9K1103V1_FLASH_ALIAS_GATE=FAIL\n"
msg_gpio_fail: .asciz "RT3883_F9K1103V1_GPIO25_RECOVERY_GATE=FAIL\n"
msg_spi_fail: .asciz "RT3883_F9K1103V1_SPI_RDID_GATE=FAIL\n"
