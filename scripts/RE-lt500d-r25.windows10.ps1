#requires -Version 5.1
[CmdletBinding()]
param(
    [Parameter(Mandatory=$true, Position=0)]
    [ValidateSet("Setup","Check","Build","Start","Smoke")]
    [string]$Action,

    [Parameter(Position=1)]
    [string]$Firmware,

    [string]$OutputDirectory,
    [string]$Image
)

$ErrorActionPreference = "Stop"

function Fail([string]$Message) {
    throw $Message
}

function Test-Wsl2 {
    if (-not (Get-Command wsl.exe -ErrorAction SilentlyContinue)) {
        Fail "wsl.exe not found. Enable WSL2 and install Ubuntu first."
    }
    $kernel = (& wsl.exe bash -lc "uname -r" 2>$null | Out-String).Trim()
    if ($LASTEXITCODE -ne 0 -or [string]::IsNullOrWhiteSpace($kernel)) {
        Fail "No usable default WSL distribution. Install Ubuntu under WSL2 first."
    }
    if ($kernel -notmatch "WSL2|microsoft-standard") {
        Fail "This port requires WSL2. Current WSL kernel: $kernel"
    }
    Write-Host "PASS WSL2 kernel: $kernel"
}

function To-WslPath([string]$Path) {
    $full = [System.IO.Path]::GetFullPath($Path)
    if ($full.Contains("'")) {
        Fail "Paths containing apostrophes are not supported: $full"
    }
    $result = (& wsl.exe wslpath -a -u "$full" | Out-String).Trim()
    if ($LASTEXITCODE -ne 0 -or [string]::IsNullOrWhiteSpace($result)) {
        Fail "Could not convert Windows path to WSL path: $full"
    }
    return $result
}

function Q([string]$Value) {
    return "'" + $Value + "'"
}

function Invoke-Check {
    Test-Wsl2
    $probe = @'
set -e
missing=0
for c in bash python3 unsquashfs qemu-system-mipsel qemu-img curl shasum mke2fs debugfs unzip; do
  if command -v "$c" >/dev/null 2>&1; then
    printf 'PASS %-22s %s\n' "$c" "$(command -v "$c")"
  else
    printf 'MISS %s\n' "$c"
    missing=1
  fi
done
exit "$missing"
'@
    & wsl.exe bash -lc $probe
    if ($LASTEXITCODE -ne 0) {
        Fail "Missing WSL dependencies. Run this script with Action Setup."
    }
    Write-Host "WINDOWS10_WSL2_CHECK_GATE=PASS" -ForegroundColor Green
}

$scriptRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$repoRoot = Split-Path -Parent $scriptRoot

switch ($Action) {
    "Setup" {
        Test-Wsl2
        Write-Host "Installing emulator dependencies inside WSL2..."
        $install = "export DEBIAN_FRONTEND=noninteractive; apt-get update && apt-get install -y qemu-system-mips qemu-utils squashfs-tools e2fsprogs unzip curl python3 perl libdigest-sha-perl ca-certificates file binutils"
        & wsl.exe -u root bash -lc $install
        if ($LASTEXITCODE -ne 0) {
            Fail "WSL dependency installation failed."
        }
        Invoke-Check
        Write-Host "WINDOWS10_WSL2_SETUP_GATE=PASS" -ForegroundColor Green
    }

    "Check" {
        Invoke-Check
    }

    "Build" {
        Invoke-Check
        if ([string]::IsNullOrWhiteSpace($Firmware)) {
            Fail "Build requires -Firmware <path-to-LT500V2-R25-2.4.16-20250804-150319-flash.bin>"
        }

        $firmwarePath = (Resolve-Path $Firmware).Path
        if (-not $OutputDirectory) {
            $OutputDirectory = Join-Path $repoRoot "scratch\lt500d-r25-windows10"
        }
        New-Item -ItemType Directory -Force -Path $OutputDirectory | Out-Null
        $outputPath = (Resolve-Path $OutputDirectory).Path

        $repoWsl = To-WslPath $repoRoot
        $firmwareWsl = To-WslPath $firmwarePath
        $outputWsl = To-WslPath $outputPath
        $workWsl = "/tmp/RE-lt500d-r25-win10-" + $PID

        $cmd = @(
            "set -euo pipefail",
            "cd " + (Q $repoWsl),
            "chmod +x scripts/*.sh",
            "rm -rf " + (Q $workWsl),
            "bash scripts/make.lt500d-r25-emulator.macos.sh " + (Q $firmwareWsl) + " " + (Q $workWsl),
            "mkdir -p " + (Q $outputWsl),
            "cp " + (Q ($workWsl + "/image.raw")) + " " + (Q ($outputWsl + "/image.raw")),
            "cp " + (Q ($workWsl + "/unsquashfs.log")) + " " + (Q ($outputWsl + "/unsquashfs.log")) + " 2>/dev/null || true",
            "echo WINDOWS10_BUILD_GATE=PASS"
        ) -join "; "

        Write-Host "Building LT500D emulator under WSL2..."
        & wsl.exe bash -lc $cmd
        if ($LASTEXITCODE -ne 0) {
            Fail "LT500D Windows 10 / WSL2 build failed."
        }

        $builtImage = Join-Path $outputPath "image.raw"
        if (-not (Test-Path $builtImage)) {
            Fail "Build reported success but image.raw is missing: $builtImage"
        }
        Write-Host "WINDOWS10_WSL2_BUILD_GATE=PASS" -ForegroundColor Green
        Write-Host "Image: $builtImage"
    }

    "Start" {
        Invoke-Check
        if (-not $Image) {
            $Image = Join-Path $repoRoot "scratch\lt500d-r25-windows10\image.raw"
        }
        $imagePath = (Resolve-Path $Image).Path
        $repoWsl = To-WslPath $repoRoot
        $imageWsl = To-WslPath $imagePath

        $logWindows = Join-Path (Split-Path -Parent $imagePath) "qemu.serial.log"
        if (-not (Test-Path (Split-Path -Parent $logWindows))) {
            New-Item -ItemType Directory -Force -Path (Split-Path -Parent $logWindows) | Out-Null
        }
        $logWsl = To-WslPath $logWindows

        $cmd = "set -e; cd " + (Q $repoWsl) + "; chmod +x scripts/*.sh; LT500D_SERIAL_LOG=" + (Q $logWsl) + " bash scripts/start.lt500d-r25.sh " + (Q $imageWsl)

        Write-Host "Starting Cudy LT500D R25 emulator under WSL2..."
        Write-Host "HTTP : http://127.0.0.1:8080"
        Write-Host "HTTPS: https://127.0.0.1:8443"
        Write-Host "Serial: $logWindows"
        Write-Host "This window remains attached to QEMU. Run Action Smoke in a second PowerShell window."
        & wsl.exe bash -lc $cmd
        exit $LASTEXITCODE
    }

    "Smoke" {
        Invoke-Check
        $repoWsl = To-WslPath $repoRoot
        $cmd = "set -e; cd " + (Q $repoWsl) + "; chmod +x scripts/*.sh; bash scripts/smoke.lt500d-r25-http.sh /tmp/RE-lt500d-r25-win10-smoke"
        & wsl.exe bash -lc $cmd
        if ($LASTEXITCODE -ne 0) {
            Fail "LT500D Windows 10 / WSL2 smoke gate failed."
        }
        Write-Host "WINDOWS10_WSL2_SMOKE_GATE=PASS" -ForegroundColor Green
    }
}
