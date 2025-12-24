@echo off & cd /d "%~dp0"
REM :::::::::::::::::::::::::::::::::::::::::
REM Elevate.cmd - Freedom edition
REM Automatically check & get admin rights
REM See "https://stackoverflow.com/a/79585058" for description
REM :::::::::::::::::::::::::::::::::::::::::
 
 ECHO.
 ECHO =============================
 ECHO Running Admin shell
 ECHO =============================
 ECHO.

 for %%k in (%0) do set batchName=%%~nk
 set "vbsGetPrivileges=%temp%\OEgetPriv_%batchName%.vbs"

:checkPrivileges
  whoami /groups /nh | find "S-1-16-12288" > nul
  if not '%errorlevel%'=='0' goto getPrivileges
  net session 1>nul 2>NUL
  if '%errorlevel%'=='0' goto gotPrivileges

:getPrivileges
  ECHO **************************************
  ECHO Invoking UAC for Privilege Escalation
  ECHO **************************************
 
  cmd /u /c ECHO CreateObject("Shell.Application").ShellExecute "%SystemRoot%\System32\cmd.exe", "/c""%~dpnx0""", "", "runas", 1 >"%vbsGetPrivileges%"
  cmd /u /c ECHO CreateObject("Scripting.FileSystemObject").DeleteFile "%vbsGetPrivileges%">>"%vbsGetPrivileges%"

 "%SystemRoot%\System32\WScript.exe" "%vbsGetPrivileges%"
 exit /B

:gotPrivileges
REM :::::::::::::::::::::::::
REM START
REM :::::::::::::::::::::::::
REM Run shell as admin - put your code below as you like
sc query "Tor Win32 Service" >nul
if %errorlevel% EQU 0 set "CHECK=0" & GOTO Service
:Loop
setlocal EnableDelayedExpansion
for %%I in (VERSION*) do set "UPD=%%~nxI"
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://ipfs.io/ipns/k51qzi5uqu5dldod6robuflgitvj276br0xye3adipm3kc0bh17hfiv1e0hnp4/%UPD%', '%temp%\%UPD%')" >nul
if %errorlevel% NEQ 0 (
choice /m "The local version does not match the latest version. It means that update is available, but in edge cases marks accessibility issues. Do you want to update"
if !errorlevel! EQU 2 GOTO Skip
echo @echo off>"%temp%\autoupdater.cmd"
echo call "%CD%\updater.cmd">>"%temp%\autoupdater.cmd"
echo cls>>"%temp%\autoupdater.cmd"
echo :Wait>>"%temp%\autoupdater.cmd"
echo if not exist "%CD%\torrc.txt" GOTO Wait>>"%temp%\autoupdater.cmd"
echo timeout /t 1 /nobreak>>"%temp%\autoupdater.cmd"
echo if "%CHECK%" NEQ "1" call "%CD%\%~nx0">>"%temp%\autoupdater.cmd"
echo del "%temp%\autoupdater.cmd" ^& exit>>"%temp%\autoupdater.cmd"
start "" "%temp%\autoupdater.cmd"
exit
)
del "%temp%\%UPD%"
:Skip
If "%CHECK%"=="1" exit
:Service
if not exist "C:\Windows\System32\acryptprimitives.dll" copy "%CD%\oldwin\acryptprimitives.dll" "C:\Windows\System32\acryptprimitives.dll" >nul 2>&1
taskkill /im tor.exe >nul 2>&1
sc query "Tor Win32 Service" >nul

if %errorLevel% EQU 0 (
   sc stop "Tor Win32 Service"
   sc delete "Tor Win32 Service"
   powershell -Command "(gc '%CD%\torrc.txt') "^
  "-replace '^DataDirectory.*$', ('DataDirectory ../data/user-data') "^
  "-replace '^GeoIPFile.*$', ('GeoIPFile geoip') "^
  "-replace '^GeoIPv6File.*$', ('GeoIPv6File geoip6') "^
  "| Out-File -encoding default '%CD%\torrc.txt'"
) else (
    powershell -Command "(gc '%CD%\torrc.txt') "^
      "-replace '^DataDirectory.*$', ('DataDirectory \"%CD%\data\user-data\"' -replace '\\','\\') "^
      "-replace '^GeoIPFile.*$', ('GeoIPFile \"%CD%\tor\geoip\"' -replace '\\','\\') "^
      "-replace '^GeoIPv6File.*$', ('GeoIPv6File \"%CD%\tor\geoip6\"' -replace '\\','\\') "^
      "| Out-File -encoding default '%CD%\torrc.txt'"
    sc create "Tor Win32 Service" binPath= "\"%CD%\tor\tor.exe\" --nt-service -f \"%CD%\torrc.txt\"" start= "auto"
    sc description "Tor Win32 Service" "Provides an anonymous Internet communication system"
    sc start "Tor Win32 Service"
)

Echo.
Echo Please wait...
Echo.
timeout /t 3 /nobreak >nul

If "%CHECK%"=="0" set "CHECK=1" & GOTO Loop
