cd /d "%~dp0"
taskkill /im tor.exe >nul 2>&1
sc query "Tor Win32 Service"
if %errorLevel% EQU 0 (
call service-manager.cmd
timeout /t 3 /nobreak
)
(
echo curl.exe "https://ipfs.io/ipns/k51qzi5uqu5dldod6robuflgitvj276br0xye3adipm3kc0bh17hfiv1e0hnp4/AntiTor_win8+_current.zip" -O
echo tar -xf "%CD%\AntiTor_win8+_current.zip"
echo del "%CD%\AntiTor_win8+_current.zip"
echo xcopy "%userprofile%\data" "%CD%\data" /i /e
echo rmdir "%userprofile%\data" /s /q
echo start cmd /C del "%userprofile%\updater.cmd"
echo exit
) > "%userprofile%\updater.cmd"
copy "%CD%\torrc.txt" "%CD%\data\torrc.txt"
xcopy "%CD%\data" "%userprofile%\data" /i /e
start "" "%userprofile%\updater.cmd"
rmdir "%CD%" /s /q
