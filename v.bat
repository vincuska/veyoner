@echo off
set "EXE=C:\Program Files\Veyon\veyon-cli.exe"
set /p "IP=$ "
"%EXE%" remoteaccess control "%IP%"
