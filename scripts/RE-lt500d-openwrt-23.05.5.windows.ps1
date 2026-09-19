#requires -Version 5.1
[CmdletBinding()]
param(
 [Parameter(Mandatory=$true,Position=0)][ValidateSet('Setup','Check','Build','Start','Smoke','Run')][string]$Action,
 [Parameter(Position=1)][string]$Firmware,
 [string]$OutputDirectory,
 [string]$Image
)
$ErrorActionPreference='Stop'
function Fail([string]$m){ throw $m }
function Resolve-Distro {
 if(-not (Get-Command wsl.exe -ErrorAction SilentlyContinue)){ Write-Host 'Install WSL2 first: wsl --install -d Ubuntu' -ForegroundColor Yellow; exit 2 }
 $d=@(& wsl.exe --list --quiet 2>$null | % { ($_ -replace [char]0,'').Trim() } | ? {$_})
 if($d.Count -eq 0){ Write-Host 'WSL exists but Ubuntu/Linux is not installed.' -ForegroundColor Yellow; Write-Host 'Run as Administrator: wsl --install -d Ubuntu' -ForegroundColor Cyan; exit 2 }
 $u=$d | ? {$_ -match '^Ubuntu($|-)'} | select -First 1; if($u){$script:Distro=$u}else{$script:Distro=$d[0]}
}
function Test-Wsl2 { Resolve-Distro; $k=(& wsl.exe -d "$script:Distro" -- bash -lc 'uname -r' 2>$null | Out-String).Trim(); if($k -notmatch 'WSL2|microsoft-standard'){ Write-Host ('Run: wsl --set-version "'+$script:Distro+'" 2') -ForegroundColor Cyan; exit 2 }; Write-Host "PASS WSL2: $k" }
function W([string]$p){ $f=[IO.Path]::GetFullPath($p); $r=(& wsl.exe -d "$script:Distro" -- wslpath -a -u "$f" | Out-String).Trim(); if(!$r){Fail "wslpath failed: $f"}; return $r }
function Q([string]$s){ return "'"+$s+"'" }
$scriptRoot=Split-Path -Parent $MyInvocation.MyCommand.Path; $repoRoot=Split-Path -Parent $scriptRoot
function Check { Test-Wsl2; $q='set -e; for c in bash python3 unsquashfs qemu-system-mipsel qemu-img curl mke2fs debugfs; do command -v "$c" >/dev/null || { echo MISS:$c; exit 1; }; done'; & wsl.exe -d "$script:Distro" -- bash -lc $q; if($LASTEXITCODE-ne 0){Fail 'Missing WSL dependencies. Run Setup.'}; Write-Host 'LT500D_OWRT_WINDOWS_CHECK=PASS' -ForegroundColor Green }
switch($Action){
 'Setup' { Test-Wsl2; & wsl.exe -d "$script:Distro" -u root -- bash -lc 'export DEBIAN_FRONTEND=noninteractive; apt-get update && apt-get install -y qemu-system-mips qemu-utils squashfs-tools e2fsprogs unzip curl python3 perl libdigest-sha-perl ca-certificates file binutils'; if($LASTEXITCODE-ne 0){Fail 'WSL package install failed'}; Check }
 'Check' { Check }
 'Build' { Check; if(!$Firmware){Fail 'Build requires firmware .bin path'}; $fw=(Resolve-Path $Firmware).Path; if(!$OutputDirectory){$OutputDirectory=Join-Path $repoRoot 'scratchlt500d-openwrt-23.05.5-windows'}; New-Item -ItemType Directory -Force -Path $OutputDirectory|Out-Null; $rw=W $repoRoot; $fwW=W $fw; $outW=W (Resolve-Path $OutputDirectory).Path; $cmd='set -e; cd '+(Q $rw)+'; chmod +x scripts/RE-*.sh; bash scripts/RE-make.lt500d-openwrt-23.05.5-emulator.sh '+(Q $fwW)+' '+(Q $outW); & wsl.exe -d "$script:Distro" -- bash -lc $cmd; if($LASTEXITCODE-ne 0){Fail 'OpenWrt emulator build failed'}; Write-Host 'LT500D_OWRT_WINDOWS_BUILD=PASS' -ForegroundColor Green }
 'Start' { Check; if(!$Image){$Image=Join-Path $repoRoot 'scratchlt500d-openwrt-23.05.5-windowsimage.raw'}; $iw=W (Resolve-Path $Image).Path; $rw=W $repoRoot; $cmd='cd '+(Q $rw)+'; exec bash scripts/RE-start.lt500d-openwrt-23.05.5.sh '+(Q $iw); Write-Host 'HTTP http://127.0.0.1:18080/'; Write-Host 'HTTPS https://127.0.0.1:18443/'; & wsl.exe -d "$script:Distro" -- bash -lc $cmd; exit $LASTEXITCODE }
 'Smoke' { Check; $rw=W $repoRoot; & wsl.exe -d "$script:Distro" -- bash -lc ('cd '+(Q $rw)+'; bash scripts/RE-smoke.lt500d-openwrt-23.05.5.sh'); if($LASTEXITCODE-ne 0){Fail 'Smoke failed'} }
 'Run' {
   Check
   if(!$Firmware){Fail 'Run requires firmware .bin path'}
   $fw=(Resolve-Path $Firmware).Path
   if(!$OutputDirectory){$OutputDirectory=Join-Path $repoRoot 'scratch\lt500d-openwrt-23.05.5-windows'}
   New-Item -ItemType Directory -Force -Path $OutputDirectory|Out-Null
   $rw=W $repoRoot; $fwW=W $fw; $outW=W (Resolve-Path $OutputDirectory).Path
   $build='set -e; cd '+(Q $rw)+'; chmod +x scripts/RE-*.sh; bash scripts/RE-make.lt500d-openwrt-23.05.5-emulator.sh '+(Q $fwW)+' '+(Q $outW)
   & wsl.exe -d "$script:Distro" -- bash -lc $build
   if($LASTEXITCODE-ne 0){Fail 'OpenWrt emulator build failed'}
   $cmd='set -e; cd '+(Q $rw)+'; rm -f '+(Q ($outW+'/qemu.pid'))+'; nohup env LT500D_OWRT_SERIAL_LOG='+(Q ($outW+'/qemu.serial.log'))+' bash scripts/RE-start.lt500d-openwrt-23.05.5.sh '+(Q ($outW+'/image.raw'))+' >'+(Q ($outW+'/qemu.host.log'))+' 2>&1 & echo $! > '+(Q ($outW+'/qemu.pid'))+'; ready=0; for i in $(seq 1 120); do if curl -fsS --connect-timeout 1 --max-time 2 http://127.0.0.1:18080/luci-static/resources/luci.js >/dev/null 2>&1; then ready=1; break; fi; sleep 1; done; test "$ready" = 1; bash scripts/RE-smoke.lt500d-openwrt-23.05.5.sh /tmp/RE-lt500d-owrt-win-run'
   & wsl.exe -d "$script:Distro" -- bash -lc $cmd
   if($LASTEXITCODE-ne 0){Fail 'OpenWrt emulator boot/smoke failed. Check qemu.serial.log in the output directory.'}
   Write-Host 'LT500D_OPENWRT_WINDOWS_RUN_GATE=PASS' -ForegroundColor Green
   Write-Host 'HTTP : http://127.0.0.1:18080/'
   Write-Host 'HTTPS: https://127.0.0.1:18443/'
   Start-Process 'http://127.0.0.1:18080/'
 }

}
