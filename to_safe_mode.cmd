@echo off
title To Safe Mode
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Requesting administrator privileges...
    powershell start cmd.exe -ArgumentList "/c ""%~s0""" -Verb runas
    exit /b
)
cd /d "%~dp0"
cls
echo =============================================
echo  To Safe Mode
echo  by ExEintel
echo =============================================
echo.
echo This will reboot your system into Safe Mode.
echo You will be prompted to press a key to
echo confirm after the system restarts.
echo.
echo =============================================
echo.
echo Select Safe Mode variant:
echo [1] Minimal Safe Mode (standard)
echo [2] Safe Mode with Networking
echo [3] Safe Mode with Command Prompt
echo [4] Cancel
echo.
set /p choice="Enter choice (1-4): "

if "%choice%"=="1" (
    bcdedit /set {current} safeboot minimal
) else if "%choice%"=="2" (
    bcdedit /set {current} safeboot network
) else if "%choice%"=="3" (
    bcdedit /set {current} safeboot minimal
    bcdedit /set {current} safebootalternateshell yes
) else (
    echo Operation cancelled.
    timeout /t 3 >nul
    exit /b
)
echo.
set /p confirm="Reboot into Safe Mode now? (Y/N): "
if /i "%confirm%"=="Y" (
    echo Rebooting into Safe Mode...
    shutdown /r /t 5
    echo.
    echo IMPORTANT: After booting in Safe Mode, run
    echo "bcdedit /deletevalue {current} safeboot"
    echo to disable Safe Mode on next boot.
) else (
    echo Reverting Safe Mode setting...
    bcdedit /deletevalue {current} safeboot
    bcdedit /deletevalue {current} safebootalternateshell
    timeout /t 3 >nul
)
