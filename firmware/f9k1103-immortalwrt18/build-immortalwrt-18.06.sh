#!/usr/bin/env bash
set -euo pipefail

IWRT_COMMIT="cab1e2e283d048f8f0fa3f31133510c86b30fd83"
IWRT_SHORT="cab1e2e283"
WORKDIR="${PWD}/_f9k1103_immortalwrt_18_06"
OUT="${GITHUB_WORKSPACE:-$PWD}/out-f9k1103-immortalwrt-18.06"

rm -rf "$WORKDIR" "$OUT"
mkdir -p "$WORKDIR" "$OUT"
cd "$WORKDIR"

git init immortalwrt
cd immortalwrt
git remote add origin https://github.com/immortalwrt/immortalwrt.git
git fetch --depth 1 origin "$IWRT_COMMIT"
git checkout --detach FETCH_HEAD

cp "${GITHUB_WORKSPACE}/firmware/f9k1103-immortalwrt18/rt3883_belkin_f9k1103v1.dts" target/linux/ramips/dts/

python3 - <<'PY'
from pathlib import Path

# 1) Add an F9K1103 v1 device profile by inheriting the proven F9K1109v1
#    image recipe and changing only the board identity.
p = Path("target/linux/ramips/image/rt3883.mk")
s = p.read_text()
anchor = """define Device/belkin_f9k1109v1
  SOC := rt3883
  BLOCKSIZE := 64k
  DEVICE_VENDOR := Belkin
  DEVICE_MODEL := F9K1109
  DEVICE_VARIANT := Version 1.0
  DEVICE_PACKAGES := kmod-usb-ohci kmod-usb2 kmod-usb-ledtrig-usbport swconfig
  IMAGE_SIZE := 7808k
  KERNEL := kernel-bin | append-dtb | lzma -d16 | uImage lzma
  # Stock firmware checks for this uImage image name during upload.
  UIMAGE_NAME := N750F9K1103VB
endef
TARGET_DEVICES += belkin_f9k1109v1
"""
replacement = anchor + """
define Device/belkin_f9k1103v1
  SOC := rt3883
  BLOCKSIZE := 64k
  DEVICE_VENDOR := Belkin
  DEVICE_MODEL := F9K1103
  DEVICE_VARIANT := Version 1.0
  DEVICE_PACKAGES := kmod-usb-ohci kmod-usb2 kmod-usb-ledtrig-usbport swconfig
  IMAGE_SIZE := 7808k
  KERNEL := kernel-bin | append-dtb | lzma -d16 | uImage lzma
  # F9K1103/F9K110x stock uploader checks this legacy uImage name.
  UIMAGE_NAME := N750F9K1103VB
endef
TARGET_DEVICES += belkin_f9k1103v1
"""
if anchor not in s:
    raise SystemExit("rt3883.mk F9K1109 anchor not found")
p.write_text(s.replace(anchor, replacement, 1))

# 2) Reuse the F9K1109 switch topology and MAC-source logic.
#    Both are from the same Belkin RT3883/F9K110x family.
p = Path("target/linux/ramips/rt3883/base-files/etc/board.d/02_network")
s = p.read_text()
old = """	belkin,f9k1109v1)
		ucidef_add_switch "switch0" \
			"0:lan" "1:lan" "2:lan" "3:lan" "4:wan" "5@eth0"
		;;
"""
new = """	belkin,f9k1103v1|\\
	belkin,f9k1109v1)
		ucidef_add_switch "switch0" \
			"0:lan" "1:lan" "2:lan" "3:lan" "4:wan" "5@eth0"
		;;
"""
if old not in s:
    raise SystemExit("02_network switch anchor not found")
s = s.replace(old, new, 1)

old = """	belkin,f9k1109v1)
		wan_mac=$(mtd_get_mac_ascii uboot-env HW_WAN_MAC)
		lan_mac=$(mtd_get_mac_ascii uboot-env HW_LAN_MAC)
		label_mac=$wan_mac
		;;
"""
new = """	belkin,f9k1103v1|\\
	belkin,f9k1109v1)
		wan_mac=$(mtd_get_mac_ascii uboot-env HW_WAN_MAC)
		lan_mac=$(mtd_get_mac_ascii uboot-env HW_LAN_MAC)
		label_mac=$wan_mac
		;;
"""
if old not in s:
    raise SystemExit("02_network MAC anchor not found")
p.write_text(s.replace(old, new, 1))

# 3) Add useful default LAN/WAN LED associations for the F9K1103-specific
#    GPIO LEDs without altering the donor F9K1109 behavior.
p = Path("target/linux/ramips/rt3883/base-files/etc/board.d/01_leds")
s = p.read_text()
anchor = """case $board in
belkin,f9k1109v1)
"""
replacement = """case $board in
belkin,f9k1103v1)
	ucidef_set_led_netdev "lan" "lan" "$boardname:blue:lan" "eth0"
	ucidef_set_led_netdev "wan" "wan" "$boardname:blue:wan" "eth0.2"
	;;
belkin,f9k1109v1)
"""
if anchor not in s:
    raise SystemExit("01_leds anchor not found")
p.write_text(s.replace(anchor, replacement, 1))
PY

# Keep the exact source modifications as a reproducible patch.
git diff --   target/linux/ramips/dts/rt3883_belkin_f9k1103v1.dts   target/linux/ramips/image/rt3883.mk   target/linux/ramips/rt3883/base-files/etc/board.d/01_leds   target/linux/ramips/rt3883/base-files/etc/board.d/02_network   > "$OUT/F9K1103-IMMORTALWRT-18.06.patch"

# Pull the matching 18.06 feeds so LuCI can be included.
./scripts/feeds update -a
./scripts/feeds install -a

cat > .config <<'CFG'
CONFIG_TARGET_ramips=y
CONFIG_TARGET_ramips_rt3883=y
CONFIG_TARGET_ramips_rt3883_DEVICE_belkin_f9k1103v1=y
CONFIG_PACKAGE_luci=y
CFG

make defconfig

# Save final config before compiling.
cp .config "$OUT/BUILD-CONFIG.txt"

# Download separately so checksum/mirror failures are easier to diagnose.
make -j"$(nproc)" download V=s

# Compile with a conservative parallelism cap; old 18.06 host tools are
# memory-hungry and do not benefit much from very high runner core counts.
JOBS="$(nproc)"
if [ "$JOBS" -gt 4 ]; then JOBS=4; fi
make -j"$JOBS" V=s

BIN="bin/targets/ramips/rt3883"
find "$BIN" -maxdepth 1 -type f -name '*f9k1103*' -print -exec cp -av {} "$OUT/" \;

[ -f "$BIN/profiles.json" ] && cp -av "$BIN/profiles.json" "$OUT/"
[ -f "$BIN/config.buildinfo" ] && cp -av "$BIN/config.buildinfo" "$OUT/"
[ -f "$BIN/feeds.buildinfo" ] && cp -av "$BIN/feeds.buildinfo" "$OUT/"
[ -f "$BIN/version.buildinfo" ] && cp -av "$BIN/version.buildinfo" "$OUT/"

git rev-parse HEAD > "$OUT/IMMORTALWRT_SOURCE_COMMIT.txt"

cat > "$OUT/BUILD-INFO.txt" <<EOF
Distribution: ImmortalWrt
Source line: 18.06-SNAPSHOT
Exact source commit: $IWRT_COMMIT
Reference revision: r8179-$IWRT_SHORT
Board: Belkin F9K1103 v1
SoC: Ralink RT3883
Compatible: belkin,f9k1103v1
Donor device: Belkin F9K1109 v1
Firmware image size limit: 7808k
uImage name: N750F9K1103VB
Flash layout: shared Belkin F9K110x SPI-NOR layout
Status: PORT-WIP / compiled static image / NOT hardware-runtime-verified
EOF

cd "$OUT"

# Require a sysupgrade image: do not publish an artifact if the board profile
# silently failed to build.
SYSUP="$(find . -maxdepth 1 -type f -name '*f9k1103v1*squashfs-sysupgrade.bin' -print -quit)"
if [ -z "$SYSUP" ]; then
  echo "ERROR: F9K1103 sysupgrade image was not produced" >&2
  ls -lah
  exit 1
fi

python3 - <<'PY'
from pathlib import Path
import struct, zlib, hashlib

candidates = list(Path(".").glob("*f9k1103v1*squashfs-sysupgrade.bin"))
if not candidates:
    raise SystemExit("No F9K1103 sysupgrade image")
p = candidates[0]
b = p.read_bytes()

if len(b) < 64:
    raise SystemExit("Image too small for uImage header")

magic, hcrc, ts, size, load, entry, dcrc = struct.unpack(">7I", b[:28])
os_, arch, typ, comp = b[28:32]
name = b[32:64].split(b"\0", 1)[0].decode("ascii", "replace")

hdr = bytearray(b[:64])
hdr[4:8] = b"\0\0\0\0"
calc_hcrc = zlib.crc32(hdr) & 0xffffffff
payload = b[64:64+size]
calc_dcrc = zlib.crc32(payload) & 0xffffffff

if magic != 0x27051956:
    raise SystemExit(f"Bad uImage magic: 0x{magic:08x}")
if calc_hcrc != hcrc:
    raise SystemExit(f"Bad uImage header CRC: stored=0x{hcrc:08x} calc=0x{calc_hcrc:08x}")
if calc_dcrc != dcrc:
    raise SystemExit(f"Bad uImage data CRC: stored=0x{dcrc:08x} calc=0x{calc_dcrc:08x}")
if name != "N750F9K1103VB":
    raise SystemExit(f"Unexpected uImage name: {name!r}")
if len(b) > 7808 * 1024:
    raise SystemExit(f"Image too large: {len(b)} bytes")

sq = b.find(b"hsqs")
sha = hashlib.sha256(b).hexdigest()
Path("VALIDATION.txt").write_text(
    f"file={p.name}\n"
    f"size={len(b)} bytes\n"
    f"sha256={sha}\n"
    f"uimage_magic=0x{magic:08x}\n"
    f"uimage_name={name}\n"
    f"uimage_payload_size={size}\n"
    f"load=0x{load:08x}\n"
    f"entry=0x{entry:08x}\n"
    f"header_crc_stored=0x{hcrc:08x}\n"
    f"header_crc_calc=0x{calc_hcrc:08x}\n"
    f"data_crc_stored=0x{dcrc:08x}\n"
    f"data_crc_calc=0x{calc_dcrc:08x}\n"
    f"squashfs_magic_offset={sq}\n"
    f"size_limit={7808*1024} bytes\n"
    f"status=STATIC_VALIDATION_OK / NOT_HARDWARE_TESTED\n"
)
PY

sha256sum * > SHA256SUMS.txt
cat VALIDATION.txt
