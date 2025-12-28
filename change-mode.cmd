@echo off & cd /d "%~dp0"
taskkill /im tor.exe >nul 2>&1
sc query "Tor Win32 Service" >nul
if %errorlevel% EQU 0 (
cmd /c service-manager.cmd
timeout /t 3 /nobreak
)
findstr /c:"The mode is default" torrc.txt
if %errorlevel% EQU 0 (
copy "%CD%\change-mode\pro\torrc.txt" "%CD%\torrc.txt"
echo The mode was changed to pro.
pause
exit
)
findstr /c:"The mode is pro" torrc.txt
if %errorlevel% EQU 0 (
copy "%CD%\change-mode\default\torrc.txt" "%CD%\torrc.txt"
echo The mode was changed to default.
pause
exit
) else (
copy "%CD%\change-mode\default\torrc.txt" "%CD%\torrc.txt"
echo An error occurred. Attempted to set the mode to default. The error should be gone.
pause
)