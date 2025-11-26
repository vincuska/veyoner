@echo off
setlocal enabledelayedexpansion

:: Ask for search string
set /p search=Enter text to search for in hostnames: 
echo.

echo Collecting IPs from ARP table...
echo.

:: Temporary file
set tempFile=%TEMP%\resolved_hosts.txt
if exist "%tempFile%" del "%tempFile%"

for /f "tokens=1" %%A in ('arp -a ^| findstr /R "[0-9]\.[0-9]\.[0-9]\.[0-9]"') do (
    echo Pinging %%A ...
    
    for /f "tokens=2" %%H in ('ping -a -n 1 %%A ^| findstr "Pinging"') do (
        echo %%A %%H >> "%tempFile%"
    )
)

echo.
echo ===== Matching Hosts =====
findstr /I "%search%" "%tempFile%"
echo ==========================
echo.

endlocal
pause
