@echo off
title veyoner
mode 30, 3
setlocal enabledelayedexpansion

set EXE="C:\Program Files\Veyon\veyon-cli.exe"
set ip=

:loop
set /p command=$ 

if "%command%"=="" goto loop

set cmdlower=%command%
set cmdlower=%cmdlower:"=%
for %%A in ("%cmdlower%") do set cmdlower=%%~A
set cmdlower=%cmdlower:~0,999%
set cmdlower=%cmdlower: =%

if /i "%cmdlower%"=="exit" (
    exit /b
)

if /i "%cmdlower%"=="setip" (
    set /p ip=ip $ 
    goto loop
)

if /i "%cmdlower%"=="disable" (
    %EXE% service stop
    %EXE% service unregister

    for %%F in (
        MonitoringMode
        RemoteControl
        RemoteView
        Lock
    ) do (
        %EXE% feature stop 127.0.0.1 %%F
    )
    goto loop
)

if /i "%cmdlower%"=="control" (
    if "%ip%"=="" (
        echo No target.
    ) else (
        %EXE% remoteaccess control %ip%
    )
    goto loop
)

if /i "%cmdlower%"=="view" (
    if "%ip%"=="" (
        echo No target.
    ) else (
        %EXE% remoteaccess view %ip%
    )
    goto loop
)

echo Invalid command.
goto loop
