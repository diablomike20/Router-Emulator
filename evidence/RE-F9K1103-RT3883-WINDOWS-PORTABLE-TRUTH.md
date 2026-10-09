# F9K1103 RT3883 native Windows portable emulator truth

## Source and build

Primary emulator branch:
`f9k1103-v1-rt3883-cudy-port-v1`

Native Windows build source:
`73ef638414e1d94f9e577124736ad9628335fdc2`

Native Windows workflow run:
`38002511524` — SUCCESS

The Windows runner built QEMU v8.2.10 natively under MSYS2 UCRT64 with the
project RT3883/F9K1103 machine source.

Native Windows smoke gate:
`RT3883_WINDOWS_QEMU_SMOKE_GATE=PASS`

The smoke test exercised the Windows executable with the compact MIPS probe and
verified the machine's major gates, including flash alias, GPIO recovery,
500 MHz/DDR2 identity, 64 MiB mirror, PCI host, USB host, RT3883 WMAC identity,
BBP/RFCSR access, SPI RDID/RDSR, 4 KiB erase, system reset and M1-prep completion.

## Portable packaging

Portable repack source:
`e538ec87cb61c2e1f123b89fbfd282b3ecd0392d`

Portable workflow run:
`38003574693` — SUCCESS

Artifact:
`RE-F9K1103-RT3883-WINDOWS-EMULATOR-PORTABLE`

Artifact id:
`11650770010`

Artifact digest:
`sha256:b700b95173ef35fe98defb76ca7e8fad3e04e44086e7ca803a7eec6e78bf1809`

The portable artifact recursively bundles the required UCRT64 DLL dependencies.

Portable validation deliberately removes MSYS2/UCRT64 from PATH and leaves only
the package directory plus normal Windows system directories before starting
`qemu-system-mipsel.exe`.

Result:
`RT3883_WINDOWS_PORTABLE_PACKAGE_GATE=PASS`

Therefore the public package is classified `LIFECYCLE_VERIFIED` for native
Windows process startup and RT3883 machine smoke execution without relying on
the MSYS2 runtime PATH.

## Privacy boundary

The public GitHub artifact contains NO recovered private F9K1103 MTD,
factory/calibration data, original U-Boot bytes or user-specific runtime flash.

The user's COMPLETE-PRIVATE package is assembled only in the private conversation
workspace by combining this portable runtime with their own recovered device data.
It must not be published.

## Firmware relation

Candidate-15R8 firmware exact Linux-host RT3883 emulator lifecycle is separately
`LIFECYCLE_VERIFIED`, including persistent JFFS2 overlay, firstboot password,
authenticated Cudy UI, real CBI config apply, reboot and persistence.

Windows portable smoke proves the same RT3883 QEMU machine source executes
natively and self-contained on Windows. A public CI exact-R8 boot is intentionally
not performed because the exact runtime requires private recovered Belkin bytes.
