@echo off
title Reboot Fast
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Requesting administrator privileges...
    powershell start cmd.exe -ArgumentList "/c ""%~s0""" -Verb runas
    exit /b
)
cd /d "%~dp0"
cls
echo =============================================
echo  Reboot Fast
echo  by ExEintel
echo =============================================
echo.
echo This will perform a fast reboot of your system.
echo Unsaved work will be lost!
echo.
echo =============================================
echo.
set /p confirm="Reboot now? (Y/N): "
if /i "%confirm%"=="Y" (
    echo Rebooting...
    shutdown /r /t 0
) else (
    echo Operation cancelled.
    timeout /t 3 >nul
)
