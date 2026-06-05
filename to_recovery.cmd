@echo off
title To Recovery Environment
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Requesting administrator privileges...
    powershell start cmd.exe -ArgumentList "/c ""%~s0""" -Verb runas
    exit /b
)
cd /d "%~dp0"
cls
echo =============================================
echo  To Recovery Environment
echo  by ExEintel
echo =============================================
echo.
echo This will reboot your system into Windows
echo Recovery Environment (WinRE).
echo.
echo From there you can:
echo   - Troubleshoot / Reset your PC
echo   - Access Command Prompt
echo   - System Restore
echo   - Startup Repair
echo   - UEFI Firmware Settings
echo.
echo =============================================
echo.
set /p confirm="Reboot into Recovery Environment now? (Y/N): "
if /i "%confirm%"=="Y" (
    echo Rebooting into recovery...
    shutdown /r /o /t 5
    echo.
    echo System will reboot in 5 seconds. Press Ctrl+C
    echo in the next 5 seconds to cancel.
) else (
    echo Operation cancelled.
    timeout /t 3 >nul
)
