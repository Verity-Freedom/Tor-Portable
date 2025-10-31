cd /d "%~dp0"
taskkill /im tor.exe >nul 2>&1
sc query "Tor Win32 Service"
if %errorLevel% EQU 0 (
call service-manager.cmd
timeout /t 3 /nobreak
)
(
echo @echo off
echo curl.exe https://ipfs.io/ipns/k51qzi5uqu5dldod6robuflgitvj276br0xye3adipm3kc0bh17hfiv1e0hnp4/AntiTor_win8+_current.zip -O
echo tar -xf "%CD%\AntiTor_win8+_current.zip"
echo del "%CD%\AntiTor_win8+_current.zip"
echo xcopy "%userprofile%\user-config" "%CD%\user-config" /i /e
echo rmdir "%userprofile%\user-config" /s /q
echo start cmd /C del "%userprofile%\updater.cmd"
echo exit
) > "%userprofile%\updater.cmd"
copy "%CD%\torrc.txt" "%CD%\user-config\torrc.txt"
xcopy "%CD%\user-config" "%userprofile%\user-config" /i /e
start "" "%userprofile%\updater.cmd"
rmdir "%CD%" /s /q
