@echo off
title veyoner
mode 30, 3
setlocal enabledelayedexpansion

set EXE="C:\Program Files\Veyon\veyon-cli.exe"

:loop
set /p command=$ 

if "%command%"=="" goto loop

set cmdlower=%command%
set cmdlower=%cmdlower:"=%
for %%A in ("%cmdlower%") do set cmdlower=%%~A
set cmdlower=%cmdlower:~0,999%
set cmdlower=%cmdlower: =%

if /i "%cmdlower%"=="connect" (
    set /p ip=ip $ 
    %EXE% remoteaccess view %ip%
    goto loop
)

echo Invalid command.
goto loop
