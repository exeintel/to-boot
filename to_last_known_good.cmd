@echo off
title To Last Known Good Configuration
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Requesting administrator privileges...
    powershell start cmd.exe -ArgumentList "/c ""%~s0""" -Verb runas
    exit /b
)
cd /d "%~dp0"
cls
echo =============================================
echo  To Last Known Good Configuration
echo  by ExEintel
echo =============================================
echo.
echo This option is useful if Windows failed to
echo start after a driver or registry change.
echo.
echo Note: Last Known Good Configuration was
echo removed starting from Windows 8. This tool
echo attempts to restore it via BCD recovery.
echo.
echo =============================================
echo.
echo Options:
echo [1] Enable Last Known Good (via BCD)
echo [2] Boot into Recovery for System Restore
echo [3] Cancel
echo.
set /p choice="Enter choice (1-3): "

if "%choice%"=="1" (
    echo Enabling boot restore policy...
    bcdedit /set {current} bootstatuspolicy ignoreallfailures
    bcdedit /set {current} recoveryenabled off
    echo.
    echo Policy set. Now rebooting...
    shutdown /r /t 5
) else if "%choice%"=="2" (
    echo Rebooting into Recovery Environment...
    echo Select Troubleshoot ^> Advanced Options ^> System Restore
    shutdown /r /o /t 5
) else (
    echo Operation cancelled.
    timeout /t 3 >nul
)
