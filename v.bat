@echo off
set "EXE=C:\Program Files\Veyron\veyron-cli.exe"
set /p "IP=$ "
"%EXE%" remoteaccess control "%IP%"
