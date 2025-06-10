@echo off
taskkill /im tor.exe >nul 2>&1
sc query "Tor Win32 Service" | find "RUNNING"
if %errorLevel% EQU 0 (
call service-manager.cmd
timeout /t 3 /nobreak
)
findstr /c:"The mode is default" torrc.txt
if %errorLevel% EQU 0 (
copy "%CD%\change-mode\modes\pro\torrc.txt" "%CD%\torrc.txt"
echo "The mode was changed to pro."
pause
exit
)
findstr /c:"The mode is pro" torrc.txt
if %errorLevel% EQU 0 (
copy "%CD%\change-mode\modes\default\torrc.txt" "%CD%\torrc.txt"
echo "The mode was changed to default."
pause
exit
) else (
copy "%CD%\change-mode\modes\default\torrc.txt" "%CD%\torrc.txt"
echo "An error occurred. Attempted to update the mode and set it to default. The error should be gone."
pause
)
