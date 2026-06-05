@echo off
title To UEFI Firmware
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Requesting administrator privileges...
    powershell start cmd.exe -ArgumentList "/c ""%~s0""" -Verb runas
    exit /b
)
cd /d "%~dp0"
cls
echo =============================================
echo  To UEFI Firmware Settings
echo  by ExEintel
echo =============================================
echo.
echo This will reboot your system directly into
echo the UEFI firmware settings interface.
echo.
echo =============================================
echo.
set /p confirm="Reboot into UEFI firmware now? (Y/N): "
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
