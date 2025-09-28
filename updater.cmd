(
echo powershell -Command "(New-Object Net.WebClient).DownloadFile('https://ipfs.io/ipns/k51qzi5uqu5dldod6robuflgitvj276br0xye3adipm3kc0bh17hfiv1e0hnp4/AntiTor_win8+_current.zip', '%CD%\AntiTor_win8+_current.zip')"
echo tar -xf "%CD%\AntiTor_win8+_current.zip"
echo del "%CD%\AntiTor_win8+_current.zip"
echo del "%userprofile%\updater.cmd"
) > "%userprofile%\updater.cmd"
start "" "%userprofile%\updater.cmd"
cd /d %~dp0
for /F "delims=" %%i in ('dir /b') do (rmdir "%%i" /s/q || del "%%i" /s/q)