@echo off
title To BIOS
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Requesting administrator privileges...
    powershell start cmd.exe -ArgumentList "/c ""%~s0""" -Verb runas
    exit /b
)
cd /d "%~dp0"
cls
echo =============================================
echo  To BIOS
echo  by ExEintel
echo =============================================
echo.
echo This will reboot your system directly into
echo BIOS / UEFI firmware settings.
echo.
echo Note: Works only on UEFI systems. For legacy
echo BIOS, press F2/Del during POST manually.
echo.
echo =============================================
echo.
set /p confirm="Reboot into BIOS now? (Y/N): "
if /i "%confirm%"=="Y" (
    echo Rebooting into UEFI firmware settings...
    shutdown /r /fw /t 5
    echo.
    echo System will reboot in 5 seconds. Press Ctrl+C
    echo in the next 5 seconds to cancel.
) else (
    echo Operation cancelled.
    timeout /t 3 >nul
)
