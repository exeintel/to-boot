@echo off
title Shutdown / Restart Advanced
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Requesting administrator privileges...
    powershell start cmd.exe -ArgumentList "/c ""%~s0""" -Verb runas
    exit /b
)
cd /d "%~dp0"
cls
echo =============================================
echo  Shutdown / Restart Advanced
echo  by ExEintel
echo =============================================
echo.
echo Select an action:
echo.
echo [1]  Restart normally
echo [2]  Shutdown normally
echo [3]  Restart with boot options
echo [4]  Restart into UEFI firmware
echo [5]  Shutdown with forced close
echo [6]  Hybrid shutdown (fast startup)
echo [7]  Hibernate
echo [8]  Cancel
echo.
set /p choice="Enter choice (1-8): "

if "%choice%"=="1" (
    shutdown /r /t 5
    echo Restarting in 5 seconds...
) else if "%choice%"=="2" (
    shutdown /s /t 5
    echo Shutting down in 5 seconds...
) else if "%choice%"=="3" (
    shutdown /r /o /t 5
    echo Restarting with boot options in 5 seconds...
) else if "%choice%"=="4" (
    shutdown /r /fw /t 5
    echo Restarting into UEFI firmware in 5 seconds...
) else if "%choice%"=="5" (
    shutdown /s /f /t 5
    echo Force shutting down in 5 seconds...
) else if "%choice%"=="6" (
    shutdown /s /hybrid /t 5
    echo Hybrid shutdown in 5 seconds...
) else if "%choice%"=="7" (
    shutdown /h
    echo Hibernating...
) else (
    echo Operation cancelled.
    timeout /t 3 >nul
)
