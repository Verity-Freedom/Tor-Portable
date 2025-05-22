@echo off

taskkill /im tor.exe >nul 2>&1
sc query "Tor Win32 Service" | find "RUNNING"
if %errorLevel% EQU 0 (
call service-manager.cmd
TIMEOUT /T 2
)

powershell -Command "(New-Object Net.WebClient).DownloadFile('https://ipfs.io/ipns/k51qzi5uqu5dldod6robuflgitvj276br0xye3adipm3kc0bh17hfiv1e0hnp4/Autoupdate/pro.zip', '%CD%\change-mode\pro.zip')"
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://ipfs.io/ipns/k51qzi5uqu5dldod6robuflgitvj276br0xye3adipm3kc0bh17hfiv1e0hnp4/Autoupdate/bridges-webtunnel-list.txt', '%CD%\bridges-webtunnel-list.txt')"
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://ipfs.io/ipns/k51qzi5uqu5dldod6robuflgitvj276br0xye3adipm3kc0bh17hfiv1e0hnp4/Autoupdate/geoip', '%CD%\data\geoip')"
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://ipfs.io/ipns/k51qzi5uqu5dldod6robuflgitvj276br0xye3adipm3kc0bh17hfiv1e0hnp4/Autoupdate/geoip6', '%CD%\data\geoip6')"
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://ipfs.io/ipns/k51qzi5uqu5dldod6robuflgitvj276br0xye3adipm3kc0bh17hfiv1e0hnp4/Autoupdate/AntiTor_win8+/AntiTor.exe', '%CD%\AntiTor.exe')"
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://ipfs.io/ipns/k51qzi5uqu5dldod6robuflgitvj276br0xye3adipm3kc0bh17hfiv1e0hnp4/Autoupdate/AntiTor_win8+/AntiTor.cmd', '%CD%\AntiTor.cmd')"
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://ipfs.io/ipns/k51qzi5uqu5dldod6robuflgitvj276br0xye3adipm3kc0bh17hfiv1e0hnp4/Autoupdate/AntiTor_win8+/readme.txt', '%CD%\readme.txt')"
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://ipfs.io/ipns/k51qzi5uqu5dldod6robuflgitvj276br0xye3adipm3kc0bh17hfiv1e0hnp4/Autoupdate/AntiTor_win8+/service-manager.cmd', '%CD%\service-manager.cmd')"
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://ipfs.io/ipns/k51qzi5uqu5dldod6robuflgitvj276br0xye3adipm3kc0bh17hfiv1e0hnp4/Autoupdate/AntiTor_win8+/tor.exe', '%CD%\tor\tor.exe')"
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://ipfs.io/ipns/k51qzi5uqu5dldod6robuflgitvj276br0xye3adipm3kc0bh17hfiv1e0hnp4/Autoupdate/AntiTor_win8+/tor-gencert.exe', '%CD%\tor\tor-gencert.exe')"
if %errorLevel% EQU 0 (
echo Tor Portable files updated successfully!
)

pause
