/*
 * Belkin F9K1103 v1 / Ralink RT3883 research machine for QEMU 8.2.x.
 *
 * M0: 64 MiB RAM, 74K-family CPU, RT3883 MMIO, UART-lite, recovery GPIO25,
 * 8 MiB SPI NOR, legacy SPI subset, direct U-Boot entry at 0x80200000.
 * Direct entry remains an explicit compatibility shim.  M1 adds evidence-derived
 * bootstrap SYSCTL state and separates full-system reset from SPI/FE resets.
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
#include "sysemu/runstate.h"
#include "sysemu/sysemu.h"
#include "target/mips/cpu.h"

#define RT3883_RAM_SIZE          (64 * MiB)
#define RT3883_SOC_BASE          0x10000000ULL
#define RT3883_SOC_SIZE          0x00010000ULL
#define RT3883_FE_BASE           0x10100000ULL
#define RT3883_FE_SIZE           0x00010000ULL
#define RT3883_PCI_BASE          0x10140000ULL
#define RT3883_PCI_SIZE          0x00020000ULL
#define RT3883_USBHOST_BASE      0x101c0000ULL
#define RT3883_USBHOST_SIZE      0x00040000ULL
#define RT3883_WMAC_BASE         0x10180000ULL
#define RT3883_WMAC_SIZE         0x00040000ULL
#define RT3883_WMAC_MAC_CSR0_OFF 0x00001000ULL
#define F9K1103_WMAC_MAC_CSR0    0x38830400U
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
#define PIO_DATA0_OFF            0x0620
#define PIO_DIR0_OFF             0x0624
#define PIO_SET0_OFF             0x062c
#define PIO_RESET0_OFF           0x0630
#define PIO_DATA24_OFF           0x0648
#define PIO_DIR24_OFF            0x064c
#define PIO_SET24_OFF            0x0654
#define PIO_RESET24_OFF          0x0658
#define F9K1103_SMI_SDA_GPIO     1
#define F9K1103_SMI_SCK_GPIO     2
#define F9K1103_SWITCH_RST_GPIO  24
#define F9K1103_RESET_GPIO       25
#define F9K1103_WPS_GPIO         26

#define RTL8367_SMI_SLAVE_ADDR   0xb8
#define RTL8367_REG_COUNT        0x10000
#define RTL8367_REG_IND_CTRL     0x1f00
#define RTL8367_REG_IND_STATUS   0x1f01
#define RTL8367_REG_IND_ADDR     0x1f02
#define RTL8367_REG_IND_WRDATA   0x1f03
#define RTL8367_REG_IND_RDDATA   0x1f04
#define RTL8367_REG_CHIP_NUMBER  0x1300
#define RTL8367_REG_CHIP_VERSION 0x1301
#define RTL8367_REG_CHIP_MODE    0x1302
#define RTL8367_REG_CHIP_RESET   0x1322
#define RTL8367_CHIPVER_R_VB     0x1010
#define RTL8367_IND_CMD          0x0001
#define RTL8367_IND_WRITE        0x0002
#define RTL8367_PHY_BASE         0x2000
#define RTL8367_PHY_OFFSET       5

#define SYSCTL_SYSCFG0_OFF       0x0010
#define SYSCTL_RSTCTRL_OFF       0x0034
#define SYSCTL_RSTCTRL_SYS_RST   (1U << 0)
#define SYSCTL_RSTCTRL_SPI_RST   (1U << 18)
#define SYSCTL_RSTCTRL_WLAN_RST  (1U << 20)
#define SYSCTL_RSTCTRL_FE_RST    (1U << 21)
#define SYSCTL_RSTCTRL_UHST_RST   (1U << 22)
#define SYSCTL_RSTCTRL_PCIE_RST  (1U << 23)
#define SYSCTL_RSTCTRL_PCI_RST   (1U << 24)

/*
 * Exact F9K1103 v1 boot evidence reports RT3883 at 500 MHz with DDR2.
 * The RT3883 MediaTek lineage decodes that as SYSCFG0[9:8] = 3 and
 * SYSCFG0[17] = 1.  Keep the unknown strap bits zero rather than inventing
 * values which have not been recovered from the physical unit.
 */
#define F9K1103_SYSCFG0_EVIDENCE ((3U << 8) | (1U << 17))
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

#define PCI_REG_PCICFG           0x0000
#define PCI_REG_CFGADDR          0x0020
#define PCI_REG_CFGDATA          0x0024
#define PCI_REG_ARBCTL           0x0080
#define PCI_REG_STATUS1          0x2050

/*
 * RT3883 integrates an EHCI 1.0 host controller at 0x101c0000.
 * M1 models only the controller/core semantics required by Linux; there are
 * no fabricated downstream USB devices.
 */
#define EHCI_CAPLENGTH            0x20
#define EHCI_HCIVERSION           0x0100
#define EHCI_CAPBASE_OFF          0x0000
#define EHCI_HCSPARAMS_OFF        0x0004
#define EHCI_HCCPARAMS_OFF        0x0008
#define EHCI_USBCMD_OFF           0x0020
#define EHCI_USBSTS_OFF           0x0024
#define EHCI_USBINTR_OFF          0x0028
#define EHCI_FRINDEX_OFF          0x002c
#define EHCI_CTRLDSSEGMENT_OFF    0x0030
#define EHCI_PERIODICLIST_OFF     0x0034
#define EHCI_ASYNCLIST_OFF        0x0038
#define EHCI_CONFIGFLAG_OFF       0x0060
#define EHCI_PORTSC0_OFF          0x0064
#define EHCI_PORTSC1_OFF          0x0068
#define EHCI_CMD_RUN              (1U << 0)
#define EHCI_CMD_RESET            (1U << 1)
#define EHCI_STS_HALT             (1U << 12)
#define EHCI_PORT_POWER           (1U << 12)

/*
 * RT3883 OHCI companion sits at USB-host base + 0x1000.
 * M1 models only enough OHCI 1.0 state for a two-port empty root hub.
 */
#define OHCI_BASE_OFF             0x1000
#define OHCI_REVISION_OFF         (OHCI_BASE_OFF + 0x00)
#define OHCI_CONTROL_OFF          (OHCI_BASE_OFF + 0x04)
#define OHCI_CMDSTATUS_OFF        (OHCI_BASE_OFF + 0x08)
#define OHCI_INTRSTATUS_OFF       (OHCI_BASE_OFF + 0x0c)
#define OHCI_INTRENABLE_OFF       (OHCI_BASE_OFF + 0x10)
#define OHCI_INTRDISABLE_OFF      (OHCI_BASE_OFF + 0x14)
#define OHCI_FMINTERVAL_OFF       (OHCI_BASE_OFF + 0x34)
#define OHCI_PERIODICSTART_OFF    (OHCI_BASE_OFF + 0x40)
#define OHCI_RHDESCA_OFF          (OHCI_BASE_OFF + 0x48)
#define OHCI_RHDESCB_OFF          (OHCI_BASE_OFF + 0x4c)
#define OHCI_RHSTATUS_OFF         (OHCI_BASE_OFF + 0x50)
#define OHCI_RHPORT0_OFF          (OHCI_BASE_OFF + 0x54)
#define OHCI_RHPORT1_OFF          (OHCI_BASE_OFF + 0x58)
#define OHCI_REVISION_1_0         0x10
#define OHCI_CMD_HCR              (1U << 0)
#define OHCI_FI_DEFAULT           0x2edf
#define OHCI_RH_NDP_2             0x00000002

typedef enum RT3883SMIStage {
    SMI_STAGE_IDLE = 0,
    SMI_STAGE_HOST_BITS,
    SMI_STAGE_DEVICE_ACK,
    SMI_STAGE_DEVICE_READ,
    SMI_STAGE_HOST_READ_ACK,
    SMI_STAGE_WAIT_STOP,
} RT3883SMIStage;

typedef struct RT3883F9K1103State {
    MemoryRegion soc_mmio, fe_mmio, pci_mmio, usbhost_mmio, wmac_mmio, flash_mr, ram_mirror;
    CharBackend chr;
    uint32_t soc_regs[RT3883_SOC_SIZE / 4];
    uint32_t fe_regs[RT3883_FE_SIZE / 4];
    uint32_t pci_regs[RT3883_PCI_SIZE / 4];
    uint32_t usbhost_regs[RT3883_USBHOST_SIZE / 4];
    uint32_t wmac_regs[RT3883_WMAC_SIZE / 4];
    uint8_t uart_rx[256];
    unsigned uart_rx_r, uart_rx_w;
    uint8_t *flash;
    uint8_t spi_data, spi_cmd;
    unsigned spi_phase, spi_addr_bytes, rdid_index;
    uint32_t spi_addr;
    bool spi_cs_low, spi_wel;

    uint16_t rtl8367_regs[RTL8367_REG_COUNT];
    uint16_t rtl8367_phy[8][32];
    RT3883SMIStage smi_stage;
    uint8_t smi_cmd, smi_shift, smi_host_bytes, smi_data_lo;
    uint16_t smi_addr, smi_read_value;
    unsigned smi_bits, smi_read_bit, smi_read_byte;
    bool smi_active, smi_prev_sck, smi_prev_sda, smi_prev_valid;
    bool smi_read_line;
} RT3883F9K1103State;

typedef struct RT3883ResetData {
    MIPSCPU *cpu;
    RT3883F9K1103State *s;
} RT3883ResetData;

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

static void rt3883_spi_controller_reset(RT3883F9K1103State *s)
{
    s->spi_data = 0xff;
    s->spi_cs_low = false;
    s->spi_wel = false;
    rt3883_spi_reset_transaction(s);
}

static void rt3883_fe_reset(RT3883F9K1103State *s)
{
    memset(s->fe_regs, 0, sizeof(s->fe_regs));
}

static void rt3883_pci_reset(RT3883F9K1103State *s)
{
    memset(s->pci_regs, 0, sizeof(s->pci_regs));
    /*
     * Keep PCIe link-down until an actual RT309x PCIe device is modelled.
     * The Linux RT3883 host driver then follows its real no-link path rather
     * than discovering a fabricated device.
     */
    s->pci_regs[PCI_REG_STATUS1 >> 2] = 0;
}

static void rt3883_ohci_reset(RT3883F9K1103State *s)
{
    /*
     * Physical F9K1103 evidence reports a two-port OHCI companion.
     * Keep all port-status bits clear (nothing attached) and seed only
     * standard architectural identity/timing registers.
     */
    for (hwaddr off = OHCI_BASE_OFF; off < OHCI_BASE_OFF + 0x1000; off += 4) {
        s->usbhost_regs[off >> 2] = 0;
    }
    s->usbhost_regs[OHCI_REVISION_OFF >> 2] = OHCI_REVISION_1_0;
    s->usbhost_regs[OHCI_FMINTERVAL_OFF >> 2] = OHCI_FI_DEFAULT;
    s->usbhost_regs[OHCI_RHDESCA_OFF >> 2] = OHCI_RH_NDP_2;
}

static void rt3883_usbhost_reset(RT3883F9K1103State *s)
{
    memset(s->usbhost_regs, 0, sizeof(s->usbhost_regs));

    /*
     * Minimal EHCI 1.0 identity for the integrated RT3883 host:
     *   CAPLENGTH  = 0x20
     *   HCIVERSION = 1.0
     *   N_PORTS    = 2 (the F9K1103 exposes two USB connectors)
     * Reset leaves the schedule stopped and HCHalted asserted.
     *
     * This is intentionally a no-device controller.  It is sufficient for
     * Linux to initialise/register the root hub without inventing USB
     * peripherals which have not been modelled.
     */
    s->usbhost_regs[EHCI_CAPBASE_OFF >> 2] =
        ((uint32_t)EHCI_HCIVERSION << 16) | EHCI_CAPLENGTH;
    s->usbhost_regs[EHCI_HCSPARAMS_OFF >> 2] = 2;
    s->usbhost_regs[EHCI_HCCPARAMS_OFF >> 2] = 0;
    s->usbhost_regs[EHCI_USBSTS_OFF >> 2] = EHCI_STS_HALT;

    rt3883_ohci_reset(s);
}

static void rt3883_wmac_reset(RT3883F9K1103State *s)
{
    /*
     * The RT3883 integrated 5 GHz MAC/BBP occupies 0x10180000..0x101bffff.
     * M1 models the physical identity already proven by target dmesg:
     * RT3883, revision 0x0400.  MAC_CSR0 layout is chipset[31:16] and
     * revision[15:0], hence 0x38830400.  No DMA/BBP/RF behavior is invented
     * here; the remaining registers still start at reset-zero so the exact
     * driver can reveal the next semantics it requires.
     */
    memset(s->wmac_regs, 0, sizeof(s->wmac_regs));
    s->wmac_regs[RT3883_WMAC_MAC_CSR0_OFF >> 2] = F9K1103_WMAC_MAC_CSR0;
}

static uint16_t rt3883_rtl8367_reg_read(RT3883F9K1103State *s,
                                        uint16_t reg)
{
    if (reg == RTL8367_REG_IND_STATUS) {
        /* M1 switch model completes PHY indirect operations immediately. */
        return 0;
    }
    return s->rtl8367_regs[reg];
}

static void rt3883_rtl8367_reg_write(RT3883F9K1103State *s,
                                      uint16_t reg, uint16_t value)
{
    if (reg == RTL8367_REG_CHIP_RESET && (value & 1)) {
        /*
         * RTL8367R-VB CHIP_RESET is a self-clearing command bit.  Linux
         * writes 1 and polls until hardware returns 0.  Reset the emulated
         * register/PHY state immediately, but retain immutable chip identity.
         */
        memset(s->rtl8367_regs, 0, sizeof(s->rtl8367_regs));
        memset(s->rtl8367_phy, 0, sizeof(s->rtl8367_phy));
        s->rtl8367_regs[RTL8367_REG_CHIP_VERSION] = RTL8367_CHIPVER_R_VB;
        return;
    }

    s->rtl8367_regs[reg] = value;

    if (reg == RTL8367_REG_IND_CTRL && (value & RTL8367_IND_CMD)) {
        uint16_t addr = s->rtl8367_regs[RTL8367_REG_IND_ADDR];

        if (addr >= RTL8367_PHY_BASE) {
            unsigned phy = (addr - RTL8367_PHY_BASE) >> RTL8367_PHY_OFFSET;
            unsigned phy_reg = addr & 0x1f;

            if (phy < ARRAY_SIZE(s->rtl8367_phy) &&
                phy_reg < ARRAY_SIZE(s->rtl8367_phy[0])) {
                if (value & RTL8367_IND_WRITE) {
                    s->rtl8367_phy[phy][phy_reg] =
                        s->rtl8367_regs[RTL8367_REG_IND_WRDATA];
                } else {
                    s->rtl8367_regs[RTL8367_REG_IND_RDDATA] =
                        s->rtl8367_phy[phy][phy_reg];
                }
            }
        }

        s->rtl8367_regs[RTL8367_REG_IND_STATUS] = 0;
    }
}

static void rt3883_smi_begin(RT3883F9K1103State *s)
{
    s->smi_active = true;
    s->smi_stage = SMI_STAGE_HOST_BITS;
    s->smi_cmd = 0;
    s->smi_shift = 0;
    s->smi_host_bytes = 0;
    s->smi_data_lo = 0;
    s->smi_addr = 0;
    s->smi_read_value = 0;
    s->smi_bits = 0;
    s->smi_read_bit = 0;
    s->smi_read_byte = 0;
    s->smi_read_line = true;
}

static void rt3883_smi_end(RT3883F9K1103State *s)
{
    s->smi_active = false;
    s->smi_stage = SMI_STAGE_IDLE;
    s->smi_bits = 0;
    s->smi_read_bit = 0;
    s->smi_read_byte = 0;
    s->smi_read_line = true;
}

static void rt3883_smi_host_byte(RT3883F9K1103State *s, uint8_t byte)
{
    switch (s->smi_host_bytes) {
    case 0:
        s->smi_cmd = byte;
        break;
    case 1:
        s->smi_addr = byte;
        break;
    case 2:
        s->smi_addr |= (uint16_t)byte << 8;
        break;
    case 3:
        if (!(s->smi_cmd & 1)) {
            s->smi_data_lo = byte;
        }
        break;
    case 4:
        if (!(s->smi_cmd & 1)) {
            rt3883_rtl8367_reg_write(s, s->smi_addr,
                                     s->smi_data_lo | ((uint16_t)byte << 8));
        }
        break;
    default:
        break;
    }

    s->smi_host_bytes++;
    s->smi_shift = 0;
    s->smi_bits = 0;
    s->smi_stage = SMI_STAGE_DEVICE_ACK;
}

static void rt3883_smi_ack_complete(RT3883F9K1103State *s)
{
    if ((s->smi_cmd & 1) && s->smi_host_bytes == 3) {
        s->smi_read_value = rt3883_rtl8367_reg_read(s, s->smi_addr);
        s->smi_read_byte = 0;
        s->smi_read_bit = 0;
        s->smi_stage = SMI_STAGE_DEVICE_READ;
    } else {
        s->smi_stage = SMI_STAGE_HOST_BITS;
    }
}

static void rt3883_smi_observe(RT3883F9K1103State *s)
{
    const uint32_t sda_bit = 1U << F9K1103_SMI_SDA_GPIO;
    const uint32_t sck_bit = 1U << F9K1103_SMI_SCK_GPIO;
    uint32_t data = s->soc_regs[PIO_DATA0_OFF >> 2];
    uint32_t dir = s->soc_regs[PIO_DIR0_OFF >> 2];
    bool sda = !!(data & sda_bit);
    bool sck = !!(data & sck_bit);
    bool sda_out = !!(dir & sda_bit);
    bool sck_out = !!(dir & sck_bit);

    if (!s->smi_prev_valid) {
        s->smi_prev_sda = sda;
        s->smi_prev_sck = sck;
        s->smi_prev_valid = true;
        return;
    }

    /* Realtek GPIO-SMI start: SDA 1->0 while SCK is held high. */
    if (sda_out && sck_out &&
        s->smi_prev_sda && !sda &&
        s->smi_prev_sck && sck) {
        rt3883_smi_begin(s);
    }

    /* Stop: SDA 0->1 while SCK remains high. */
    if (s->smi_active && sda_out && sck_out &&
        !s->smi_prev_sda && sda &&
        s->smi_prev_sck && sck) {
        rt3883_smi_end(s);
    }

    if (s->smi_active && sck_out && !s->smi_prev_sck && sck) {
        switch (s->smi_stage) {
        case SMI_STAGE_HOST_BITS:
            if (sda_out) {
                s->smi_shift = (s->smi_shift << 1) | (sda ? 1 : 0);
                if (++s->smi_bits == 8) {
                    rt3883_smi_host_byte(s, s->smi_shift);
                }
            }
            break;
        case SMI_STAGE_DEVICE_READ:
            if (!sda_out) {
                uint8_t b = s->smi_read_byte ?
                    (s->smi_read_value >> 8) : (s->smi_read_value & 0xff);
                s->smi_read_line =
                    !!(b & (1U << (7 - s->smi_read_bit)));
            }
            break;
        default:
            break;
        }
    }

    if (s->smi_active && sck_out && s->smi_prev_sck && !sck) {
        switch (s->smi_stage) {
        case SMI_STAGE_DEVICE_ACK:
            if (!sda_out) {
                rt3883_smi_ack_complete(s);
            }
            break;
        case SMI_STAGE_DEVICE_READ:
            if (!sda_out && ++s->smi_read_bit == 8) {
                s->smi_stage = SMI_STAGE_HOST_READ_ACK;
            }
            break;
        case SMI_STAGE_HOST_READ_ACK:
            if (sda_out) {
                if (s->smi_read_byte == 0) {
                    s->smi_read_byte = 1;
                    s->smi_read_bit = 0;
                    s->smi_stage = SMI_STAGE_DEVICE_READ;
                } else {
                    s->smi_stage = SMI_STAGE_WAIT_STOP;
                }
            }
            break;
        default:
            break;
        }
    }

    s->smi_prev_sda = sda;
    s->smi_prev_sck = sck;
}

static void rt3883_device_reset_state(RT3883F9K1103State *s)
{
    memset(s->soc_regs, 0, sizeof(s->soc_regs));
    rt3883_fe_reset(s);
    rt3883_pci_reset(s);
    rt3883_usbhost_reset(s);
    rt3883_wmac_reset(s);
    memset(s->rtl8367_regs, 0, sizeof(s->rtl8367_regs));
    memset(s->rtl8367_phy, 0, sizeof(s->rtl8367_phy));
    /*
     * F9K1103 v1 board evidence identifies the external switch as
     * RTL8367R-VB.  Linux 4.4 rtl8367b.c accepts CHIP_VER 0x1010 as
     * RTL8367R-VB.  Keep chip number/mode at reset default until exact
     * board evidence requires non-zero values; detection keys on version.
     */
    s->rtl8367_regs[RTL8367_REG_CHIP_VERSION] = RTL8367_CHIPVER_R_VB;
    rt3883_smi_end(s);
    s->smi_prev_sck = true;
    s->smi_prev_sda = true;
    s->smi_prev_valid = true;
    s->uart_rx_r = s->uart_rx_w = 0;
    rt3883_spi_controller_reset(s);

    /* RT3883 / F9K1103 source + physical boot evidence. */
    s->soc_regs[0x00 >> 2] = 0x38335452;
    s->soc_regs[0x04 >> 2] = 0x20203338;
    s->soc_regs[SYSCTL_SYSCFG0_OFF >> 2] = F9K1103_SYSCFG0_EVIDENCE;
    /*
     * Keep all output latches high at reset.  Active-low button state is
     * supplied by rt3883_pio_read_data() only while the pins are inputs.
     */
    s->soc_regs[PIO_DATA0_OFF >> 2] = 0xffffffffU;
    s->soc_regs[PIO_DATA24_OFF >> 2] = 0xffffffffU;
}

static uint32_t rt3883_pio_read_data(RT3883F9K1103State *s,
                                        hwaddr data_off, hwaddr dir_off)
{
    uint32_t data = s->soc_regs[data_off >> 2];
    uint32_t dir = s->soc_regs[dir_off >> 2];

    if (data_off == PIO_DATA0_OFF) {
        const uint32_t sda_bit = 1U << F9K1103_SMI_SDA_GPIO;

        if (!(dir & sda_bit) && s->smi_active) {
            if (s->smi_stage == SMI_STAGE_DEVICE_ACK) {
                data &= ~sda_bit;
            } else if (s->smi_stage == SMI_STAGE_DEVICE_READ) {
                if (s->smi_read_line) {
                    data |= sda_bit;
                } else {
                    data &= ~sda_bit;
                }
            } else {
                data |= sda_bit;
            }
        }
    }

    if (data_off == PIO_DATA24_OFF) {
        /*
         * RT3883 GPIO24..39 use their own bank.  F9K1103 RESET is GPIO25
         * (bank bit1) and WPS is GPIO26 (bank bit2), both active-low.
         * M1 deliberately holds RESET asserted to enter recovery while WPS
         * remains released.  External input only overrides pins configured
         * as inputs; output pins retain their latch state.
         */
        const uint32_t reset_bit =
            1U << (F9K1103_RESET_GPIO - F9K1103_SWITCH_RST_GPIO);
        const uint32_t wps_bit =
            1U << (F9K1103_WPS_GPIO - F9K1103_SWITCH_RST_GPIO);

        if (!(dir & reset_bit)) {
            data &= ~reset_bit;
        }
        if (!(dir & wps_bit)) {
            data |= wps_bit;
        }
    }
    return data;
}

static bool rt3883_pio_write(RT3883F9K1103State *s, hwaddr addr, uint32_t v)
{
    switch (addr) {
    case PIO_DATA0_OFF:
    case PIO_DIR0_OFF:
        s->soc_regs[addr >> 2] = v;
        rt3883_smi_observe(s);
        return true;
    case PIO_DATA24_OFF:
    case PIO_DIR24_OFF:
        s->soc_regs[addr >> 2] = v;
        return true;
    case PIO_SET0_OFF:
        s->soc_regs[PIO_DATA0_OFF >> 2] |= v;
        s->soc_regs[addr >> 2] = v;
        rt3883_smi_observe(s);
        return true;
    case PIO_RESET0_OFF:
        s->soc_regs[PIO_DATA0_OFF >> 2] &= ~v;
        s->soc_regs[addr >> 2] = v;
        rt3883_smi_observe(s);
        return true;
    case PIO_SET24_OFF:
        s->soc_regs[PIO_DATA24_OFF >> 2] |= v;
        s->soc_regs[addr >> 2] = v;
        return true;
    case PIO_RESET24_OFF:
        s->soc_regs[PIO_DATA24_OFF >> 2] &= ~v;
        s->soc_regs[addr >> 2] = v;
        return true;
    default:
        return false;
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
    if (addr == PIO_DATA0_OFF)
        return rt3883_pio_read_data(s, PIO_DATA0_OFF, PIO_DIR0_OFF);
    if (addr == PIO_DATA24_OFF)
        return rt3883_pio_read_data(s, PIO_DATA24_OFF, PIO_DIR24_OFF);
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

    if (rt3883_pio_write(s, addr, v)) {
        return;
    }

    if ((addr >> 2) < ARRAY_SIZE(s->soc_regs)) {
        s->soc_regs[addr >> 2] = v;
    }

    if (addr == SYSCTL_RSTCTRL_OFF) {
        /*
         * RT3883 RSTCTRL is shared by system and peripheral resets.
         * The exact Belkin U-Boot toggles SPI/FE reset bits during init;
         * those must never be mistaken for a whole-machine reset.
         */
        if (v & SYSCTL_RSTCTRL_SPI_RST) {
            rt3883_spi_controller_reset(s);
        }
        if (v & SYSCTL_RSTCTRL_WLAN_RST) {
            rt3883_wmac_reset(s);
        }
        if (v & SYSCTL_RSTCTRL_FE_RST) {
            rt3883_fe_reset(s);
        }
        if (v & SYSCTL_RSTCTRL_UHST_RST) {
            rt3883_usbhost_reset(s);
        }
        if (v & (SYSCTL_RSTCTRL_PCIE_RST | SYSCTL_RSTCTRL_PCI_RST)) {
            rt3883_pci_reset(s);
        }
        if (v & SYSCTL_RSTCTRL_SYS_RST) {
            qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
        }
        return;
    }

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

            /*
             * RT3883 legacy STARTWR/STARTRD are command strobes, not
             * persistent latch bits.  Real U-Boot drives them through
             * ra_or(), so leaving them set corrupts the next CS transaction:
             * a stale STARTWR is replayed before the next opcode and RDSR
             * becomes 0xff.  Model the hardware self-clear explicitly.
             */
            s->soc_regs[addr >> 2] =
                v & ~(SPI_CTL_STARTWR | SPI_CTL_STARTRD);
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

static uint64_t rt3883_pci_read(void *opaque, hwaddr addr, unsigned size)
{
    RT3883F9K1103State *s = opaque;

    /*
     * Config-space reads for an unmodelled downstream device must look like
     * an empty PCI bus, not zero-filled config space (which would fabricate
     * vendor/device 0000:0000).
     */
    if (addr == PCI_REG_CFGDATA) {
        return 0xffffffffU;
    }

    return ((addr >> 2) < ARRAY_SIZE(s->pci_regs)) ?
           s->pci_regs[addr >> 2] : 0;
}

static void rt3883_pci_write(void *opaque, hwaddr addr, uint64_t val,
                             unsigned size)
{
    RT3883F9K1103State *s = opaque;

    if ((addr >> 2) < ARRAY_SIZE(s->pci_regs)) {
        s->pci_regs[addr >> 2] = (uint32_t)val;
    }

    /*
     * CFGADDR is retained for observability.  CFGDATA writes are accepted
     * but no endpoint is materialised until the RT309x PCIe function is
     * explicitly implemented.
     */
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
static const MemoryRegionOps rt3883_pci_ops = {
    .read = rt3883_pci_read, .write = rt3883_pci_write,
    .valid.min_access_size = 1, .valid.max_access_size = 4,
    .impl.min_access_size = 1, .impl.max_access_size = 4,
    .endianness = DEVICE_LITTLE_ENDIAN,
};

static uint64_t rt3883_usbhost_read(void *opaque, hwaddr addr,
                                       unsigned size)
{
    RT3883F9K1103State *s = opaque;
    return ((addr >> 2) < ARRAY_SIZE(s->usbhost_regs)) ?
           s->usbhost_regs[addr >> 2] : 0;
}

static void rt3883_usbhost_write(void *opaque, hwaddr addr, uint64_t val,
                                 unsigned size)
{
    RT3883F9K1103State *s = opaque;
    uint32_t v = (uint32_t)val;

    if ((addr >> 2) >= ARRAY_SIZE(s->usbhost_regs)) {
        return;
    }

    switch (addr) {
    case OHCI_REVISION_OFF:
    case OHCI_RHDESCA_OFF:
        /* Read-only identity in the M1 no-device companion model. */
        return;

    case OHCI_CMDSTATUS_OFF:
        /*
         * HcCommandStatus.HCR is a command bit. Linux writes it and polls
         * until hardware self-clears. Complete reset immediately.
         */
        if (v & OHCI_CMD_HCR) {
            rt3883_ohci_reset(s);
            return;
        }
        s->usbhost_regs[addr >> 2] = v & ~OHCI_CMD_HCR;
        return;

    case OHCI_INTRSTATUS_OFF:
        /* OHCI interrupt status is write-one-to-clear. */
        s->usbhost_regs[addr >> 2] &= ~v;
        return;

    case OHCI_INTRENABLE_OFF:
        s->usbhost_regs[OHCI_INTRENABLE_OFF >> 2] |= v;
        return;

    case OHCI_INTRDISABLE_OFF:
        s->usbhost_regs[OHCI_INTRENABLE_OFF >> 2] &= ~v;
        s->usbhost_regs[OHCI_INTRDISABLE_OFF >> 2] = v;
        return;

    case OHCI_RHPORT0_OFF:
    case OHCI_RHPORT1_OFF:
        /*
         * No downstream device is attached. Do not fabricate CCS/PES/change
         * events. Port-control writes are accepted but read back disconnected.
         */
        s->usbhost_regs[addr >> 2] = 0;
        return;

    case EHCI_CAPBASE_OFF:
    case EHCI_HCSPARAMS_OFF:
    case EHCI_HCCPARAMS_OFF:
        /* Capability registers are read-only. */
        return;

    case EHCI_USBCMD_OFF:
        if (v & EHCI_CMD_RESET) {
            /*
             * EHCI HCRESET is self-clearing.  Complete immediately because
             * M1 has no asynchronous USB device state to quiesce.
             */
            rt3883_usbhost_reset(s);
            return;
        }

        s->usbhost_regs[EHCI_USBCMD_OFF >> 2] = v & ~EHCI_CMD_RESET;
        if (v & EHCI_CMD_RUN) {
            s->usbhost_regs[EHCI_USBSTS_OFF >> 2] &= ~EHCI_STS_HALT;
        } else {
            s->usbhost_regs[EHCI_USBSTS_OFF >> 2] |= EHCI_STS_HALT;
        }
        return;

    case EHCI_USBSTS_OFF:
        /*
         * Interrupt/status causes are write-one-to-clear.  HCHalted is
         * controller state and follows USBCMD.RUN instead.
         */
        s->usbhost_regs[EHCI_USBSTS_OFF >> 2] &=
            ~(v & ~EHCI_STS_HALT);
        return;

    case EHCI_PORTSC0_OFF:
    case EHCI_PORTSC1_OFF:
        /*
         * No downstream device is attached in M1.  Preserve only port power;
         * never fabricate connect/change/enable state.
         */
        s->usbhost_regs[addr >> 2] = v & EHCI_PORT_POWER;
        return;

    default:
        s->usbhost_regs[addr >> 2] = v;
        return;
    }
}

static const MemoryRegionOps rt3883_usbhost_ops = {
    .read = rt3883_usbhost_read, .write = rt3883_usbhost_write,
    .valid.min_access_size = 1, .valid.max_access_size = 4,
    .impl.min_access_size = 1, .impl.max_access_size = 4,
    .endianness = DEVICE_LITTLE_ENDIAN,
};

static uint64_t rt3883_wmac_read(void *opaque, hwaddr addr, unsigned size)
{
    RT3883F9K1103State *s = opaque;
    return ((addr >> 2) < ARRAY_SIZE(s->wmac_regs)) ?
           s->wmac_regs[addr >> 2] : 0;
}

static void rt3883_wmac_write(void *opaque, hwaddr addr, uint64_t val,
                              unsigned size)
{
    RT3883F9K1103State *s = opaque;

    /* MAC_CSR0 is hardware identity, not writable configuration state. */
    if (addr == RT3883_WMAC_MAC_CSR0_OFF) {
        return;
    }

    if ((addr >> 2) < ARRAY_SIZE(s->wmac_regs)) {
        s->wmac_regs[addr >> 2] = (uint32_t)val;
    }
}

static const MemoryRegionOps rt3883_wmac_ops = {
    .read = rt3883_wmac_read, .write = rt3883_wmac_write,
    .valid.min_access_size = 1, .valid.max_access_size = 4,
    .impl.min_access_size = 1, .impl.max_access_size = 4,
    .endianness = DEVICE_LITTLE_ENDIAN,
};

static void rt3883_cpu_reset(void *opaque)
{
    RT3883ResetData *r = opaque;
    CPUMIPSState *env = &r->cpu->env;

    cpu_reset(CPU(r->cpu));
    rt3883_device_reset_state(r->s);
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
    error_report("RT3883_M1_STAGE=clock_new");
    Clock *cpuclk = clock_new(OBJECT(machine), "cpu-refclk");
    clock_set_hz(cpuclk, 500000000);
    error_report("RT3883_M1_STAGE=cpu_create type=%s", machine->cpu_type);
    MIPSCPU *cpu = mips_cpu_create_with_clock(machine->cpu_type, cpuclk);
    error_report("RT3883_M1_STAGE=cpu_created");
    reset->cpu = cpu;
    reset->s = s;
    error_report("RT3883_M1_STAGE=register_reset");
    qemu_register_reset(rt3883_cpu_reset, reset);
    error_report("RT3883_M1_STAGE=irq_init");
    cpu_mips_irq_init_cpu(cpu);
    error_report("RT3883_M1_STAGE=cp0_clock_init");
    cpu_mips_clock_init(cpu);
    error_report("RT3883_M1_STAGE=ram_map");
    memory_region_add_subregion(sysmem, 0, machine->ram);

    /*
     * RT3883 memory sizing relies on SDRAM address-line mirroring:
     * Linux 4.4 detect_memory_region() compares a magic value at
     * dm + 2/4/.../64 MiB and expects a 64 MiB board to alias at +64 MiB.
     * Keep installed RAM exactly 64 MiB; expose 64..128 MiB only as a mirror
     * of physical 0..64 MiB so the probe observes real board semantics.
     */
    memory_region_init_alias(&s->ram_mirror, OBJECT(machine),
                             "rt3883.sdram-mirror",
                             machine->ram, 0, RT3883_RAM_SIZE);
    memory_region_add_subregion(sysmem, RT3883_RAM_SIZE, &s->ram_mirror);

    error_report("RT3883_M1_STAGE=soc_mmio");
    memory_region_init_io(&s->soc_mmio, OBJECT(machine), &rt3883_soc_ops, s,
                          "rt3883.soc-mmio", RT3883_SOC_SIZE);
    memory_region_add_subregion(sysmem, RT3883_SOC_BASE, &s->soc_mmio);
    memory_region_init_io(&s->fe_mmio, OBJECT(machine), &rt3883_fe_ops, s,
                          "rt3883.frame-engine", RT3883_FE_SIZE);
    memory_region_add_subregion(sysmem, RT3883_FE_BASE, &s->fe_mmio);

    error_report("RT3883_M1_STAGE=pci_mmio");
    memory_region_init_io(&s->pci_mmio, OBJECT(machine), &rt3883_pci_ops, s,
                          "rt3883.pci-host", RT3883_PCI_SIZE);
    memory_region_add_subregion(sysmem, RT3883_PCI_BASE, &s->pci_mmio);

    error_report("RT3883_M1_STAGE=usbhost_mmio");
    memory_region_init_io(&s->usbhost_mmio, OBJECT(machine),
                          &rt3883_usbhost_ops, s,
                          "rt3883.usb-host", RT3883_USBHOST_SIZE);
    memory_region_add_subregion(sysmem, RT3883_USBHOST_BASE,
                                &s->usbhost_mmio);

    error_report("RT3883_M1_STAGE=wmac_mmio");
    memory_region_init_io(&s->wmac_mmio, OBJECT(machine),
                          &rt3883_wmac_ops, s,
                          "rt3883.wmac", RT3883_WMAC_SIZE);
    memory_region_add_subregion(sysmem, RT3883_WMAC_BASE,
                                &s->wmac_mmio);

    error_report("RT3883_M1_STAGE=flash_map");
    memory_region_init_ram_nomigrate(&s->flash_mr, OBJECT(machine), "rt3883.spi-nor",
                                     RT3883_FLASH_SIZE, &error_fatal);
    s->flash = memory_region_get_ram_ptr(&s->flash_mr);
    memset(s->flash, 0xff, RT3883_FLASH_SIZE);
    memory_region_add_subregion(sysmem, RT3883_FLASH_BASE, &s->flash_mr);
    rt3883_preload_flash(s, machine->kernel_filename);

    rt3883_device_reset_state(s);

    error_report("RT3883_M1_STAGE=serial_init");
    if (serial_hd(0)) {
        qemu_chr_fe_init(&s->chr, serial_hd(0), &error_fatal);
        qemu_chr_fe_set_handlers(&s->chr, rt3883_uart_can_read, rt3883_uart_read,
                                 NULL, NULL, s, NULL, true);
    }

    error_report("RT3883_M1_STAGE=firmware_load");
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
    error_report("RT3883_M1_STAGE=init_done");
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
