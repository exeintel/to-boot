@echo off
title To Boot Menu
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Requesting administrator privileges...
    powershell start cmd.exe -ArgumentList "/c ""%~s0""" -Verb runas
    exit /b
)
cd /d "%~dp0"
cls
echo =============================================
echo  To Boot Menu
echo  by ExEintel
echo =============================================
echo.
echo This will reboot your system into the
echo Advanced Boot Options menu where you can
echo select a different boot device or mode.
echo.
echo =============================================
echo.
set /p confirm="Reboot to boot menu now? (Y/N): "
if /i "%confirm%"=="Y" (
    echo Rebooting into advanced boot options...
    shutdown /r /o /t 5
    echo.
    echo System will reboot in 5 seconds. Press Ctrl+C
    echo in the next 5 seconds to cancel.
) else (
    echo Operation cancelled.
    timeout /t 3 >nul
)
