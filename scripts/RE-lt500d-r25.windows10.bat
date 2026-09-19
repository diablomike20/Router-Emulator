@echo off
setlocal EnableExtensions
title Cudy LT500D R25 Emulator - Windows 10

set "SCRIPT_DIR=%~dp0"
set "PS_SCRIPT=%SCRIPT_DIR%RE-lt500d-r25.windows10.ps1"

if /I "%~1"=="--selftest" (
  if exist "%PS_SCRIPT%" (
    echo WINDOWS10_BAT_STATIC_GATE=PASS
    exit /b 0
  ) else (
    echo FAIL: PowerShell backend not found: %PS_SCRIPT%
    exit /b 1
  )
)

if not exist "%PS_SCRIPT%" (
  echo.
  echo ERROR: Missing PowerShell backend:
  echo   %PS_SCRIPT%
  echo.
  pause
  exit /b 1
)

if not "%~1"=="" goto cli

:menu
cls
echo ============================================================
echo   Cudy LT500D R25 Emulator - Windows 10 / WSL2
echo ============================================================
echo.
echo   1. Setup WSL2 dependencies
echo   2. Check prerequisites
echo   3. Build emulator image
echo   4. Start emulator
echo   5. Smoke test
echo   6. Open emulator HTTP page
echo   7. Open emulator HTTPS page
echo   0. Exit
echo.
set "CHOICE="
set /p "CHOICE=Select: "

if "%CHOICE%"=="1" goto setup
if "%CHOICE%"=="2" goto check
if "%CHOICE%"=="3" goto build
if "%CHOICE%"=="4" goto start
if "%CHOICE%"=="5" goto smoke
if "%CHOICE%"=="6" goto openhttp
if "%CHOICE%"=="7" goto openhttps
if "%CHOICE%"=="0" exit /b 0
goto menu

:setup
call :runps Setup
goto done

:check
call :runps Check
goto done

:build
echo.
echo Select or type the original Cudy firmware path.
echo Expected file:
echo LT500V2-R25-2.4.16-20250804-150319-flash.bin
echo.
set "FW="
set /p "FW=Firmware path: "
if not defined FW (
  echo No firmware selected.
  goto done
)
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%PS_SCRIPT%" Build -Firmware "%FW%"
set "RC=%ERRORLEVEL%"
goto done_rc

:start
call :runps Start
goto done

:smoke
call :runps Smoke
goto done

:openhttp
start "" "http://127.0.0.1:8080/"
goto menu

:openhttps
start "" "https://127.0.0.1:8443/"
goto menu

:cli
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%PS_SCRIPT%" %*
exit /b %ERRORLEVEL%

:runps
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%PS_SCRIPT%" %1
set "RC=%ERRORLEVEL%"
exit /b %RC%

:done
set "RC=%ERRORLEVEL%"

:done_rc
echo.
if "%RC%"=="0" (
  echo Completed successfully.
) else (
  echo Command failed with exit code %RC%.
)
echo.
pause
goto menu
