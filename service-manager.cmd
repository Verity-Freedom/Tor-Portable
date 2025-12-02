@echo off
chcp 1251
REM :::::::::::::::::::::::::::::::::::::::::
REM Elevate.cmd - Version 9
REM Automatically check & get admin rights
REM see "https://stackoverflow.com/a/12264592/1016343" for description
REM :::::::::::::::::::::::::::::::::::::::::
 
 CLS
 ECHO.
 ECHO =============================
 ECHO Running Admin shell
 ECHO =============================

:init
 setlocal DisableDelayedExpansion
 set cmdInvoke=1
 set winSysFolder=System32
 set "batchPath=%~dpnx0"
 rem this works also from cmd shell, other than %~0
 for %%k in (%0) do set batchName=%%~nk
 set "vbsGetPrivileges=%temp%\OEgetPriv_%batchName%.vbs"
 setlocal EnableDelayedExpansion

:checkPrivileges
  whoami /groups /nh | find "S-1-16-12288" > nul
  if '%errorlevel%' == '0' ( goto checkPrivileges2 ) else ( goto getPrivileges )


:checkPrivileges2
  net session 1>nul 2>NUL
  if '%errorlevel%' == '0' ( goto gotPrivileges ) else ( goto getPrivileges )

:getPrivileges
  if '%1'=='ELEV' (echo ELEV & shift /1 & goto gotPrivileges)
  ECHO.
  ECHO **************************************
  ECHO Invoking UAC for Privilege Escalation
  ECHO **************************************

  ECHO Set UAC = CreateObject^("Shell.Application"^) > "%vbsGetPrivileges%"
  ECHO args = "ELEV " >> "%vbsGetPrivileges%"
  ECHO For Each strArg in WScript.Arguments >> "%vbsGetPrivileges%"
  ECHO args = args ^& strArg ^& " "  >> "%vbsGetPrivileges%"
  ECHO Next >> "%vbsGetPrivileges%"
  
  if '%cmdInvoke%'=='1' goto InvokeCmd 

  ECHO UAC.ShellExecute "!batchPath!", args, "", "runas", 1 >> "%vbsGetPrivileges%"
  goto ExecElevation

:InvokeCmd
  ECHO args = "/c """ + "!batchPath!" + """ " + args >> "%vbsGetPrivileges%"
  ECHO UAC.ShellExecute "%SystemRoot%\%winSysFolder%\cmd.exe", args, "", "runas", 1 >> "%vbsGetPrivileges%"

:ExecElevation
 "%SystemRoot%\%winSysFolder%\WScript.exe" "%vbsGetPrivileges%" %*
 exit /B

:gotPrivileges
 setlocal & cd /d %~dp0
 if '%1'=='ELEV' (del "%vbsGetPrivileges%" 1>nul 2>nul  &  shift /1)

 REM :::::::::::::::::::::::::
 REM START
 REM :::::::::::::::::::::::::
 REM Run shell as admin (example) - put here code as you like
setlocal EnableDelayedExpansion
for %%I in (VERSION*) do set "UPD=%%~nxI"
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://ipfs.io/ipns/k51qzi5uqu5dldod6robuflgitvj276br0xye3adipm3kc0bh17hfiv1e0hnp4/%UPD%', '%temp%\%UPD%')" >nul
if %errorlevel% NEQ 0 (
choice /m "Update is available. Do you want to update"
if !errorlevel! EQU 2 GOTO Skip
sc query "Tor Win32 Service" >nul
if !errorlevel! EQU 0 set "CHECK=0" & GOTO Service
:Loop
echo @echo off>"%temp%\autoupdater.cmd"
echo call "%CD%\updater.cmd">>"%temp%\autoupdater.cmd"
echo cls>>"%temp%\autoupdater.cmd"
echo :Wait>>"%temp%\autoupdater.cmd"
echo if not exist "%CD%\torrc.txt" GOTO Wait>>"%temp%\autoupdater.cmd"
echo call "%CD%\service-manager.cmd">>"%temp%\autoupdater.cmd"
echo del "%temp%\autoupdater.cmd" ^& exit>>"%temp%\autoupdater.cmd"
start "" "%temp%\autoupdater.cmd"
exit
)
del "%temp%\%UPD%"
:Skip
if not exist "C:\Windows\System32\acryptprimitives.dll" copy "%CD%\oldwin\acryptprimitives.dll" "C:\Windows\System32\acryptprimitives.dll" >nul 2>&1
taskkill /im tor.exe >nul 2>&1
:Service
sc query "Tor Win32 Service" >nul

if %errorLevel% EQU 0 (
   sc stop "Tor Win32 Service"
   sc delete "Tor Win32 Service"
   powershell -Command "(gc '%CD%\torrc.txt') "^
  "-replace '^DataDirectory.*$', ('DataDirectory ../data/user-data') "^
  "-replace '^GeoIPFile.*$', ('GeoIPFile geoip') "^
  "-replace '^GeoIPv6File.*$', ('GeoIPv6File geoip6') "^
  "| Out-File -encoding default '%CD%\torrc.txt'"
   If "%CHECK%"=="0" GOTO Loop
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

timeout /t 3 /nobreak
