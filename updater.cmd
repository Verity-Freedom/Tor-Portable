cd /d "%~dp0"
if "%CD:~-1%" == "\" (set "WAY=%CD:~0,-1%") else set "WAY=%CD%"
taskkill /im tor.exe >nul 2>&1
sc query "Tor Win32 Service"
if %errorLevel% EQU 0 (
call service-manager.cmd
timeout /t 3 /nobreak
)
(
echo powershell -Command "(New-Object Net.WebClient).DownloadFile('https://ipfs.io/ipns/k51qzi5uqu5dldod6robuflgitvj276br0xye3adipm3kc0bh17hfiv1e0hnp4/AntiTor_win8+_current.zip', '%WAY%\AntiTor_win8+_current.zip')"
echo cscript "%temp%\extractor.vbs"
echo exit
)>"%temp%\updater.cmd"
(
cmd /u /c echo CreateObject("Shell.Application"^).NameSpace("%CD%"^).CopyHere(CreateObject("Shell.Application"^).NameSpace("%WAY%\AntiTor_win8+_current.zip"^).items^)
cmd /u /c echo CreateObject("WScript.Shell"^).Run "%temp%\cleaner.cmd"
)>"%temp%\extractor.vbs"
(
echo del "%WAY%\AntiTor_win8+_current.zip"
echo xcopy "%temp%\data" "%CD%\data" /i /e /y
echo rmdir "%temp%\data" /s /q
echo findstr /c:"The mode is pro" "%CD%\data\torrc.txt"
echo if %%errorLevel%% EQU 0 copy "%CD%\change-mode\pro\torrc.txt" "%CD%\torrc.txt"
echo del "%temp%\updater.cmd"
echo del "%temp%\extractor.vbs"
echo del "%temp%\cleaner.cmd"
)>"%temp%\cleaner.cmd"
copy "%CD%\torrc.txt" "%CD%\data\torrc.txt"
xcopy "%CD%\data" "%temp%\data" /i /e /y
start "" "%temp%\updater.cmd"
rmdir "%CD%" /s /q
