#!/bin/sh
set -eu

OWRT="${1:-}"
SELF_DIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"

if [ -z "$OWRT" ] || [ ! -f "$OWRT/target/linux/ramips/image/rt3883.mk" ]; then
	echo "usage: $0 /path/to/openwrt-23.05.5" >&2
	exit 2
fi

cp "$SELF_DIR/rt3883_belkin_f9k1103v1.dts" 	"$OWRT/target/linux/ramips/dts/rt3883_belkin_f9k1103v1.dts"

python3 - "$OWRT" <<'PY'
import pathlib, sys
root = pathlib.Path(sys.argv[1])

# Image profile
p = root / "target/linux/ramips/image/rt3883.mk"
s = p.read_text()
if "Device/belkin_f9k1103v1" not in s:
    anchor = "TARGET_DEVICES += belkin_f9k1109v1\n"
    block = r'''
define Device/belkin_f9k1103v1
  $(Device/uimage-lzma-loader)
  SOC := rt3883
  DEVICE_VENDOR := Belkin
  DEVICE_MODEL := F9K1103
  DEVICE_VARIANT := Version 1.0
  DEVICE_PACKAGES := kmod-usb-ohci kmod-usb2 kmod-usb-ledtrig-usbport
  IMAGE_SIZE := 7808k
  # Belkin N750 stock bootloader family validates this uImage name.
  UIMAGE_NAME := N750F9K1103VB
endef
TARGET_DEVICES += belkin_f9k1103v1

'''
    if anchor not in s:
        raise SystemExit("F9K1109 anchor missing from rt3883.mk; wrong OpenWrt tree?")
    s = s.replace(anchor, anchor + "\n" + block, 1)
    p.write_text(s)

# Network switch layout: same RT3883 + RTL8367R-VB platform wiring as F9K1109.
p = root / "target/linux/ramips/rt3883/base-files/etc/board.d/02_network"
s = p.read_text()
if "belkin,f9k1103v1" not in s:
    s = s.replace(
        "\tbelkin,f9k1109v1)\n\t\tucidef_add_switch",
        "\tbelkin,f9k1103v1|\\\n\tbelkin,f9k1109v1)\n\t\tucidef_add_switch",
        1,
    )
    # MAC variables in F9K1109 come from U-Boot environment. On F9K1103,
    # querying the same names is harmless: empty/missing values are ignored
    # by the existing [ -n ] checks below.
    marker = "\tbelkin,f9k1109v1)\n\t\twan_mac=$(mtd_get_mac_ascii uboot-env HW_WAN_MAC)"
    if marker in s:
        s = s.replace(
            marker,
            "\tbelkin,f9k1103v1|\\\n\tbelkin,f9k1109v1)\n\t\twan_mac=$(mtd_get_mac_ascii uboot-env HW_WAN_MAC)",
            1,
        )
    p.write_text(s)

# LED defaults: only set a safe netdev trigger for the declared LAN LED.
p = root / "target/linux/ramips/rt3883/base-files/etc/board.d/01_leds"
s = p.read_text()
if "belkin,f9k1103v1" not in s:
    s = s.replace(
        "case $board in\nbelkin,f9k1109v1)",
        "case $board in\nbelkin,f9k1103v1)\n\tucidef_set_led_netdev \"lan\" \"lan\" \"blue:lan\" \"eth0\"\n\t;;\nbelkin,f9k1109v1)",
        1,
    )
    p.write_text(s)
PY

echo "F9K1103 v1 port overlay applied to: $OWRT"
