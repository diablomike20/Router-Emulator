# RE — Windows 10 x64 / WSL2 port

This is the Windows 10 host port for the Cudy LT500D V2 R25 donor emulator.

The easiest Windows entry point is the double-click launcher:

`.\scripts\RE-lt500d-r25.windows10.bat`

It provides a menu for Setup, Check, Build, Start and Smoke, plus shortcuts to open the emulator HTTP/HTTPS pages.

The PowerShell backend remains available directly as:

`.\scripts\RE-lt500d-r25.windows10.ps1`

## Architecture

The first Windows port intentionally uses WSL2 for the Linux filesystem/image build and the MIPS QEMU runtime. PowerShell is the Windows control surface.

This keeps Windows on the same FirmAE/QEMU path used by the verified Linux CI, instead of introducing a second image-builder with different filesystem semantics.

## Requirements

- Windows 10 x64, version 2004 / build 19041 or newer recommended
- WSL2 enabled
- Ubuntu or another Debian/Ubuntu-compatible default WSL2 distribution
- CPU virtualization enabled
- PowerShell 5.1 or newer
- several GB free disk space

The Cudy factory firmware is not bundled.

## Double-click launcher

Run:

```text
scripts\RE-lt500d-r25.windows10.bat
```

The menu offers:

1. Setup WSL2 dependencies
2. Check prerequisites
3. Build emulator image
4. Start emulator
5. Smoke test
6. Open HTTP page
7. Open HTTPS page

The BAT file can also be used from Command Prompt:

```bat
scripts\RE-lt500d-r25.windows10.bat Check
scripts\RE-lt500d-r25.windows10.bat Build "C:\path\LT500V2-R25-2.4.16-20250804-150319-flash.bin"
scripts\RE-lt500d-r25.windows10.bat Start
scripts\RE-lt500d-r25.windows10.bat Smoke
```

## Setup

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\RE-lt500d-r25.windows10.ps1 Setup
```

## Check

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\RE-lt500d-r25.windows10.ps1 Check
```

## Build

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\RE-lt500d-r25.windows10.ps1 Build `
  -Firmware "C:\path\LT500V2-R25-2.4.16-20250804-150319-flash.bin"
```

Default output:

`scratch\lt500d-r25-windows10\image.raw`

The unpack/assembly work happens in the WSL2 Linux filesystem so Unix symlinks and metadata are not reconstructed on NTFS.

## Start

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\RE-lt500d-r25.windows10.ps1 Start
```

The start window stays attached to QEMU.

Endpoints:

- HTTP: `http://127.0.0.1:8080`
- HTTPS: `https://127.0.0.1:8443`

Emulated donor LAN:

- `br-lan = 192.168.10.2/24`
- QEMU-only host endpoint = `192.168.10.254`

The physical OpenWrt router can remain at `192.168.10.1`.

## Smoke

Run in a second PowerShell window:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\RE-lt500d-r25.windows10.ps1 Smoke
```

Expected end-state:

```text
LT500D_HOST_WEB_GATE=PASS
WINDOWS10_WSL2_SMOKE_GATE=PASS
```

The donor may answer the LuCI entry point with its auth-gated 403 login HTML before authentication. The smoke gate accepts that only when the response body is recognizable as the donor Cudy/LEDE login page.

## Status

- Ubuntu 24.04 x86_64 runtime: CI verified
- Windows 10 PowerShell wrapper: syntax/static release gate
- Windows runtime: WSL2 + the same Linux/FirmAE/QEMU runtime path
- Native Windows QEMU without WSL2: not part of v1.0.0
