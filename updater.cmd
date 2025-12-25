@echo off & cd /d "%~dp0"
if "%CD:~-1%" == "\" (set "WAY=%CD:~0,-1%") else set "WAY=%CD%"
taskkill /im tor.exe >nul 2>&1
sc query "Tor Win32 Service" >nul
if %errorLevel% EQU 0 (
set "VAR=0"
call service-manager.cmd
timeout /t 3 /nobreak >nul
)
(
echo @echo off
echo powershell -Command "(New-Object Net.WebClient).DownloadFile('https://ipfs.io/ipns/k51qzi5uqu5dldod6robuflgitvj276br0xye3adipm3kc0bh17hfiv1e0hnp4/AntiTor_win8+_current.zip', '%WAY%\AntiTor_win8+_current.zip')"
echo if %%errorlevel%% NEQ 0 call "%temp%\cleaner.cmd"
echo cscript "%temp%\extractor.vbs"
echo exit
)>"%temp%\updater.cmd"
(
cmd /u /c echo CreateObject("Shell.Application"^).NameSpace("%CD%"^).CopyHere(CreateObject("Shell.Application"^).NameSpace("%WAY%\AntiTor_win8+_current.zip"^).items^)
cmd /u /c echo CreateObject("WScript.Shell"^).Run "%temp%\cleaner.cmd"
)>"%temp%\extractor.vbs"
(
echo @echo off
echo del "%WAY%\AntiTor_win8+_current.zip"
echo xcopy "%temp%\data" "%CD%\data" /i /e /y
echo rmdir "%temp%\data" /s /q
echo findstr /c:"The mode is pro" "%CD%\data\torrc.txt"
echo if %%errorLevel%% EQU 0 copy "%CD%\change-mode\pro\torrc.txt" "%CD%\torrc.txt"
echo del "%temp%\updater.cmd"
echo del "%temp%\extractor.vbs"
echo if not exist "%CD%\torrc.txt" (
echo xcopy "%temp%\backup" "%CD%" /i /e /y
echo rmdir "%temp%\backup" /s /q
echo echo Update failed. Please retry.
echo del "%temp%\cleaner.cmd"
echo pause
echo exit
echo ^)
echo rmdir "%temp%\backup" /s /q
echo if "%VAR%"=="0" call "%CD%\service-manager.cmd"
echo del "%temp%\cleaner.cmd"
)>"%temp%\cleaner.cmd"
copy "%CD%\torrc.txt" "%CD%\data\torrc.txt"
xcopy "%CD%\data" "%temp%\data" /i /e /y
xcopy "%CD%" "%temp%\backup" /i /e /y
start "" "%temp%\updater.cmd"
rmdir "%CD%" /s /q
