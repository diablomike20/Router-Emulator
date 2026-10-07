/*
 * Belkin F9K1103 v1 / Ralink RT3883 research machine for QEMU 8.2.x.
 *
 * M0: 64 MiB RAM, 74K-family CPU, RT3883 MMIO, UART-lite, recovery GPIO25,
 * 8 MiB SPI NOR, legacy SPI subset, direct U-Boot entry at 0x80200000.
 * Direct entry is a compatibility shim until the internal 16 KiB BootROM is recovered.
 */
#include "qemu/osdep.h"
#include "qapi/error.h"
#include "qemu/error-report.h"
#include "chardev/char-fe.h"
#include "hw/boards.h"
#include "hw/char/serial.h"
#include "hw/clock.h"
#include "hw/loader.h"
#include "hw/mips/mips.h"
#include "sysemu/reset.h"

#define RT3883_RAM_SIZE          (64 * MiB)
#define RT3883_SOC_BASE          0x10000000ULL
#define RT3883_SOC_SIZE          0x00010000ULL
#define RT3883_FE_BASE           0x10100000ULL
#define RT3883_FE_SIZE           0x00010000ULL
#define RT3883_FLASH_BASE        0x1c000000ULL
#define RT3883_FLASH_SIZE        (8 * MiB)
#define RT3883_UBOOT_LOAD_PHYS   0x00200000ULL
#define RT3883_UBOOT_ENTRY       0x80200000ULL
#define RT3883_UBOOT_MAX         0x00030000ULL

#define UARTL_OFF                0x0c00
#define UART_RBR                 0x00
#define UART_TBR                 0x04
#define UART_LSR                 0x1c
#define UART_LSR_DR              0x01
#define UART_LSR_TDRQ            0x20
#define UART_LSR_TEMT            0x40
#define PIO_DATA_OFF             0x0620
#define F9K1103_RESET_GPIO       25
#define SPI_OFF                  0x0b00
#define SPI_STAT                 0x00
#define SPI_CTL                  0x14
#define SPI_DATA                 0x20
#define SPI_CTL_CS_HIGH          0x01
#define SPI_CTL_STARTRD          0x02
#define SPI_CTL_STARTWR          0x04
#define SPI_CMD_WREN             0x06
#define SPI_CMD_WRDI             0x04
#define SPI_CMD_RDSR             0x05
#define SPI_CMD_READ             0x03
#define SPI_CMD_PP               0x02
#define SPI_CMD_SE               0xd8
#define SPI_CMD_RDID             0x9f

typedef struct RT3883F9K1103State {
    MemoryRegion soc_mmio, fe_mmio, flash_mr;
    CharBackend chr;
    uint32_t soc_regs[RT3883_SOC_SIZE / 4];
    uint32_t fe_regs[RT3883_FE_SIZE / 4];
    uint8_t uart_rx[256];
    unsigned uart_rx_r, uart_rx_w;
    uint8_t *flash;
    uint8_t spi_data, spi_cmd;
    unsigned spi_phase, spi_addr_bytes, rdid_index;
    uint32_t spi_addr;
    bool spi_cs_low, spi_wel;
} RT3883F9K1103State;

typedef struct RT3883ResetData { MIPSCPU *cpu; } RT3883ResetData;

static bool uart_rx_empty(RT3883F9K1103State *s)
{ return s->uart_rx_r == s->uart_rx_w; }

static int rt3883_uart_can_read(void *opaque)
{
    RT3883F9K1103State *s = opaque;
    return ((s->uart_rx_w + 1) & 255) != s->uart_rx_r;
}

static void rt3883_uart_read(void *opaque, const uint8_t *buf, int size)
{
    RT3883F9K1103State *s = opaque;
    for (int i = 0; i < size; i++) {
        unsigned next = (s->uart_rx_w + 1) & 255;
        if (next == s->uart_rx_r) break;
        s->uart_rx[s->uart_rx_w] = buf[i];
        s->uart_rx_w = next;
    }
}

static void rt3883_spi_reset_transaction(RT3883F9K1103State *s)
{
    s->spi_cmd = 0; s->spi_phase = 0; s->spi_addr_bytes = 0;
    s->spi_addr = 0; s->rdid_index = 0;
}

static void rt3883_spi_write_byte(RT3883F9K1103State *s, uint8_t v)
{
    if (s->spi_phase == 0) {
        s->spi_cmd = v; s->spi_phase = 1; s->spi_addr_bytes = 0;
        s->spi_addr = 0; s->rdid_index = 0;
        if (v == SPI_CMD_WREN) s->spi_wel = true;
        else if (v == SPI_CMD_WRDI) s->spi_wel = false;
        return;
    }
    if (s->spi_cmd == SPI_CMD_READ || s->spi_cmd == SPI_CMD_PP ||
        s->spi_cmd == SPI_CMD_SE) {
        if (s->spi_addr_bytes < 3) {
            s->spi_addr = (s->spi_addr << 8) | v;
            s->spi_addr_bytes++;
            if (s->spi_addr_bytes == 3 && s->spi_cmd == SPI_CMD_SE && s->spi_wel) {
                uint32_t base = s->spi_addr & ~0xffffU;
                if (base < RT3883_FLASH_SIZE)
                    memset(s->flash + base, 0xff,
                           MIN((uint32_t)0x10000,
                               (uint32_t)(RT3883_FLASH_SIZE - base)));
                s->spi_wel = false;
            }
            return;
        }
        if (s->spi_cmd == SPI_CMD_PP && s->spi_wel &&
            s->spi_addr < RT3883_FLASH_SIZE)
            s->flash[s->spi_addr++] &= v;
    }
}

static uint8_t rt3883_spi_read_byte(RT3883F9K1103State *s)
{
    static const uint8_t id[] = { 0xc2, 0x20, 0x17, 0xc2, 0x20 };
    switch (s->spi_cmd) {
    case SPI_CMD_RDID: return id[(s->rdid_index++) % ARRAY_SIZE(id)];
    case SPI_CMD_RDSR: return s->spi_wel ? 0x02 : 0x00;
    case SPI_CMD_READ:
        if (s->spi_addr_bytes == 3 && s->spi_addr < RT3883_FLASH_SIZE)
            return s->flash[s->spi_addr++];
        return 0xff;
    default: return 0xff;
    }
}

static uint64_t rt3883_soc_read(void *opaque, hwaddr addr, unsigned size)
{
    RT3883F9K1103State *s = opaque;
    if (addr >= UARTL_OFF && addr < UARTL_OFF + 0x40) {
        hwaddr r = addr - UARTL_OFF;
        if (r == UART_LSR)
            return UART_LSR_TDRQ | UART_LSR_TEMT |
                   (uart_rx_empty(s) ? 0 : UART_LSR_DR);
        if (r == UART_RBR) {
            if (!uart_rx_empty(s)) {
                uint8_t ch = s->uart_rx[s->uart_rx_r];
                s->uart_rx_r = (s->uart_rx_r + 1) & 255;
                return ch;
            }
            return 0;
        }
    }
    if (addr == PIO_DATA_OFF)
        return s->soc_regs[addr >> 2] & ~(1U << F9K1103_RESET_GPIO);
    if (addr >= SPI_OFF && addr < SPI_OFF + 0x100) {
        hwaddr r = addr - SPI_OFF;
        if (r == SPI_STAT) return 0;
        if (r == SPI_DATA) return s->spi_data;
    }
    if ((addr >> 2) < ARRAY_SIZE(s->soc_regs)) return s->soc_regs[addr >> 2];
    return 0;
}

static void rt3883_soc_write(void *opaque, hwaddr addr, uint64_t val, unsigned size)
{
    RT3883F9K1103State *s = opaque;
    uint32_t v = val;
    if ((addr >> 2) < ARRAY_SIZE(s->soc_regs)) s->soc_regs[addr >> 2] = v;
    if (addr == UARTL_OFF + UART_TBR) {
        uint8_t ch = v;
        if (qemu_chr_fe_backend_connected(&s->chr))
            qemu_chr_fe_write_all(&s->chr, &ch, 1);
        return;
    }
    if (addr >= SPI_OFF && addr < SPI_OFF + 0x100) {
        hwaddr r = addr - SPI_OFF;
        if (r == SPI_DATA) { s->spi_data = v; return; }
        if (r == SPI_CTL) {
            bool new_cs_low = !(v & SPI_CTL_CS_HIGH);
            if (new_cs_low && !s->spi_cs_low) rt3883_spi_reset_transaction(s);
            s->spi_cs_low = new_cs_low;
            if (s->spi_cs_low && (v & SPI_CTL_STARTWR))
                rt3883_spi_write_byte(s, s->spi_data);
            if (s->spi_cs_low && (v & SPI_CTL_STARTRD))
                s->spi_data = rt3883_spi_read_byte(s);
            if (!s->spi_cs_low) {
                if (s->spi_cmd == SPI_CMD_PP) s->spi_wel = false;
                rt3883_spi_reset_transaction(s);
            }
        }
    }
}

static uint64_t rt3883_fe_read(void *opaque, hwaddr addr, unsigned size)
{
    RT3883F9K1103State *s = opaque;
    return ((addr >> 2) < ARRAY_SIZE(s->fe_regs)) ? s->fe_regs[addr >> 2] : 0;
}
static void rt3883_fe_write(void *opaque, hwaddr addr, uint64_t val, unsigned size)
{
    RT3883F9K1103State *s = opaque;
    if ((addr >> 2) < ARRAY_SIZE(s->fe_regs)) s->fe_regs[addr >> 2] = val;
}

static const MemoryRegionOps rt3883_soc_ops = {
    .read = rt3883_soc_read, .write = rt3883_soc_write,
    .valid.min_access_size = 1, .valid.max_access_size = 4,
    .impl.min_access_size = 1, .impl.max_access_size = 4,
    .endianness = DEVICE_LITTLE_ENDIAN,
};
static const MemoryRegionOps rt3883_fe_ops = {
    .read = rt3883_fe_read, .write = rt3883_fe_write,
    .valid.min_access_size = 1, .valid.max_access_size = 4,
    .impl.min_access_size = 1, .impl.max_access_size = 4,
    .endianness = DEVICE_LITTLE_ENDIAN,
};

static void rt3883_cpu_reset(void *opaque)
{
    RT3883ResetData *r = opaque;
    CPUMIPSState *env = &r->cpu->env;
    cpu_reset(CPU(r->cpu));
    env->active_tc.PC = RT3883_UBOOT_ENTRY;
}

static void rt3883_preload_flash(RT3883F9K1103State *s, const char *filename)
{
    gchar *contents = NULL; gsize len = 0; GError *gerr = NULL;
    if (!filename) return;
    if (!g_file_get_contents(filename, &contents, &len, &gerr)) {
        error_report("cannot read SPI image '%s': %s", filename, gerr->message);
        g_error_free(gerr); exit(1);
    }
    if (len > RT3883_FLASH_SIZE) {
        error_report("SPI image too large: %zu", (size_t)len);
        g_free(contents); exit(1);
    }
    memcpy(s->flash, contents, len); g_free(contents);
}

static void rt3883_f9k1103v1_init(MachineState *machine)
{
    MemoryRegion *sysmem = get_system_memory();
    RT3883F9K1103State *s = g_new0(RT3883F9K1103State, 1);
    RT3883ResetData *reset = g_new0(RT3883ResetData, 1);
    Clock *cpuclk = clock_new(OBJECT(machine), "cpu-refclk");
    clock_set_hz(cpuclk, 500000000);
    MIPSCPU *cpu = mips_cpu_create_with_clock(machine->cpu_type, cpuclk);
    reset->cpu = cpu; qemu_register_reset(rt3883_cpu_reset, reset);
    cpu_mips_irq_init_cpu(cpu); cpu_mips_clock_init(cpu);
    memory_region_add_subregion(sysmem, 0, machine->ram);

    memory_region_init_io(&s->soc_mmio, OBJECT(machine), &rt3883_soc_ops, s,
                          "rt3883.soc-mmio", RT3883_SOC_SIZE);
    memory_region_add_subregion(sysmem, RT3883_SOC_BASE, &s->soc_mmio);
    memory_region_init_io(&s->fe_mmio, OBJECT(machine), &rt3883_fe_ops, s,
                          "rt3883.frame-engine", RT3883_FE_SIZE);
    memory_region_add_subregion(sysmem, RT3883_FE_BASE, &s->fe_mmio);

    memory_region_init_ram(&s->flash_mr, OBJECT(machine), "rt3883.spi-nor",
                           RT3883_FLASH_SIZE, &error_fatal);
    s->flash = memory_region_get_ram_ptr(&s->flash_mr);
    memset(s->flash, 0xff, RT3883_FLASH_SIZE);
    memory_region_add_subregion(sysmem, RT3883_FLASH_BASE, &s->flash_mr);
    rt3883_preload_flash(s, machine->kernel_filename);

    s->soc_regs[0x00 >> 2] = 0x38335452;
    s->soc_regs[0x04 >> 2] = 0x20203338;
    s->soc_regs[PIO_DATA_OFF >> 2] = 0xffffffffU & ~(1U << F9K1103_RESET_GPIO);

    if (serial_hd(0)) {
        qemu_chr_fe_init(&s->chr, serial_hd(0), &error_fatal);
        qemu_chr_fe_set_handlers(&s->chr, rt3883_uart_can_read, rt3883_uart_read,
                                 NULL, NULL, s, NULL, true);
    }

    if (!machine->firmware) {
        error_report("rt3883-f9k1103v1 requires -bios <raw-u-boot-or-probe.bin>");
        exit(1);
    }
    int64_t uboot_size = get_image_size(machine->firmware);
    if (uboot_size <= 0 || uboot_size > RT3883_UBOOT_MAX) {
        error_report("invalid U-Boot/probe size: %" PRId64, uboot_size); exit(1);
    }
    if (load_image_targphys(machine->firmware, RT3883_UBOOT_LOAD_PHYS,
                            RT3883_UBOOT_MAX) < 0) {
        error_report("cannot load U-Boot/probe '%s'", machine->firmware); exit(1);
    }
    cpu->env.active_tc.PC = RT3883_UBOOT_ENTRY;
}

static void rt3883_f9k1103v1_machine_init(MachineClass *mc)
{
    mc->desc = "Belkin F9K1103 v1 / Ralink RT3883 research machine";
    mc->init = rt3883_f9k1103v1_init;
    mc->default_cpu_type = MIPS_CPU_TYPE_NAME("74Kf");
    mc->default_ram_size = RT3883_RAM_SIZE;
    mc->default_ram_id = "rt3883.f9k1103v1.ram";
    mc->max_cpus = 1;
}
DEFINE_MACHINE("rt3883-f9k1103v1", rt3883_f9k1103v1_machine_init)
