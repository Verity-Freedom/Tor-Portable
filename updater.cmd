cd /d %~dp0
taskkill /im tor.exe >nul 2>&1
sc query "Tor Win32 Service"
if %errorLevel% EQU 0 (
call service-manager.cmd
timeout /t 3 /nobreak
)
(
echo powershell -Command "(New-Object Net.WebClient).DownloadFile('https://ipfs.io/ipns/k51qzi5uqu5dldod6robuflgitvj276br0xye3adipm3kc0bh17hfiv1e0hnp4/AntiTor_win8+_current.zip', '%CD%\AntiTor_win8+_current.zip')"
echo start "" "%userprofile%\extractor.vbs"
echo exit
) > "%userprofile%\updater.cmd"
(
cmd /u /c echo CreateObject("Shell.Application"^).NameSpace("%CD%"^).CopyHere(CreateObject("Shell.Application"^).NameSpace("%CD%\AntiTor_win8+_current.zip"^).items^)
cmd /u /c echo CreateObject("WScript.Shell"^).Run "%userprofile%\cleaner.cmd"
) > "%userprofile%\extractor.vbs"
(
echo del "%CD%\AntiTor_win8+_current.zip"
echo xcopy "%userprofile%\data" "%CD%\data" /i /e
echo rmdir "%userprofile%\data" /s /q
echo findstr /c:"The mode is pro" "%CD%\data\torrc.txt"
echo if %%errorLevel%% EQU 0 copy "%CD%\change-mode\pro\torrc.txt" "%CD%\torrc.txt"
echo cmd /c del "%userprofile%\updater.cmd"
echo cmd /c del "%userprofile%\extractor.vbs"
echo cmd /c del "%userprofile%\cleaner.cmd"
) > "%userprofile%\cleaner.cmd"
copy "%CD%\torrc.txt" "%CD%\data\torrc.txt"
xcopy "%CD%\data" "%userprofile%\data" /i /e
start "" "%userprofile%\updater.cmd"
rmdir "%CD%" /s /q
