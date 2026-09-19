@echo off
setlocal
cd /d "%~dp0"
set "PS=%~dp0RE-lt500d-openwrt-23.05.5.windows.ps1"
if /I "%~1"=="--selftest" (
 if exist "%PS%" (echo LT500D_OWRT_WINDOWS_BAT_STATIC_GATE=PASS& exit /b 0) else (echo FAIL missing PowerShell backend& exit /b 1)
)
if not "%~1"=="" (
 powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%PS%" %*
 exit /b %errorlevel%
)
:menu
cls
echo Cudy LT500D V2 - OpenWrt 23.05.5 Emulator
echo.
echo 1. Setup WSL2 dependencies
echo 2. Check prerequisites
echo 3. Build emulator image
echo 4. Start emulator
echo 5. Smoke test
echo 6. Build + Start + Verify + Open UI
echo 7. Open HTTP page
echo 8. Open HTTPS page
echo 7. Open HTTPS page
echo 0. Exit
set /p C=Choose:
if "%C%"=="1" powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%PS%" Setup
if "%C%"=="2" powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%PS%" Check
if "%C%"=="3" (
 set /p FW=Firmware path:
 powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%PS%" Build "%FW%"
)
if "%C%"=="4" powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%PS%" Start
if "%C%"=="5" powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%PS%" Smoke
if "%C%"=="6" start "" http://127.0.0.1:18080/
if "%C%"=="7" start "" https://127.0.0.1:18443/
if "%C%"=="0" exit /b 0
pause
goto menu
