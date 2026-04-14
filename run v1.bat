@echo off
title PC Hotspot Manager v1
color 1F
cls

:: --- Check for Administrator ---
net session >nul 2>&1
if %errorLevel% NEQ 0 (
    echo ==================================================
    echo  ERROR: Run this script as Administrator!
    echo ==================================================
    pause
    exit
)

:menu
cls
echo ==================================================
echo           PC HOTSPOT MANAGER v1
echo ==================================================
echo.

:: --- Check current hotspot status ---
set "status=unknown"
for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Network Connections" /v NC_ShowSharedAccessUI 2^>nul') do set status=%%A

if "%status%"=="0x0" (
    echo STATUS: [LOCKED] Hotspot is BLOCKED
) else if "%status%"=="0x1" (
    echo STATUS: [UNLOCKED] Hotspot is ENABLED
) else (
    echo STATUS: [UNKNOWN / DEFAULT]
)

echo.
echo 1. [LOCK]   Block PC Hotspot
echo 2. [UNLOCK] Enable PC Hotspot
echo 3. [CHECK]  Refresh Status
echo 4. Exit
echo.

set /p choice="Select an option [1-4]: "

if "%choice%"=="1" goto block
if "%choice%"=="2" goto enable
if "%choice%"=="3" goto menu
if "%choice%"=="4" goto end

echo Invalid choice!
pause
goto menu

:block
cls
echo [LOCK] Blocking PC Hotspot...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Network Connections" /v NC_ShowSharedAccessUI /t REG_DWORD /d 0 /f >nul
echo [SUCCESS] Hotspot is now BLOCKED.
goto restartprompt

:enable
cls
echo [UNLOCK] Enabling PC Hotspot...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Network Connections" /v NC_ShowSharedAccessUI /t REG_DWORD /d 1 /f >nul
echo [SUCCESS] Hotspot is now ENABLED.
goto restartprompt

:restartprompt
echo.
echo ==================================================
echo Restart PC now to apply changes? (Y/N)
set /p restartchoice="Choice: "

if /i "%restartchoice%"=="Y" goto restart
if /i "%restartchoice%"=="N" goto menu

echo Invalid input!
pause
goto restartprompt

:restart
echo Restarting in 5 seconds...
shutdown /r /t 5
exit

:end
cls
echo Thank you for using PC Hotspot Manager v1!
pause
exit