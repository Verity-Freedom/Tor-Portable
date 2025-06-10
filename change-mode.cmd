@echo off
findstr /c:"The mode is default" torrc.txt
if %errorLevel% EQU 0 (
copy "%CD%\change-mode\modes\pro\torrc.txt" "%CD%\torrc.txt"
echo "The mode was changed to pro"
pause
exit
)
findstr /c:"The mode is pro" torrc.txt
if %errorLevel% EQU 0 (
copy "%CD%\change-mode\modes\default\torrc.txt" "%CD%\torrc.txt"
echo "The mode was changed to default"
pause
exit
)

pause