@echo off & cd /d "%~dp0"
chcp 1251 >nul
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
echo call "%CD%\%~nx0">>"%temp%\autoupdater.cmd"
echo del "%temp%\autoupdater.cmd" ^& exit>>"%temp%\autoupdater.cmd"
start "" "%temp%\autoupdater.cmd"
exit
)
del "%temp%\%UPD%"
:Skip
REM see "https://stackoverflow.com/a/75970274" for description
set TESTstring="Microsoft Windows [Version 39.0.99999]"
REM set TESTstring="Microsoft Windows [Version 10.0.22621]"
REM set TESTstring="Microsoft Windows [Version 10.0.22000]"
REM set TESTstring="Microsoft Windows [Version 10.0.10240]"
REM set TESTstring="Microsoft Windows [Version 6.3.9600]"
REM set TESTstring="Microsoft Windows [Version 6.1.7601]"
REM set TESTstring="Microsoft Windows XP [Version 5.1.2600]"
REM set TESTstring="Microsoft Windows [Version 4.10]"

Set osName=Unknown Windows
for /f "tokens=3-7 delims=[.] " %%i in ('ver') do @(if %%i==XP (set os_ver_org=%%k.%%l) else (if %%j geq 10 (set os_ver_org=%%j.%%k.%%l) else (set os_ver_org=%%j.%%k)))
set os_ver=%os_ver_org%
if %os_ver_org:~0,1% gtr 3 set os_ver=0%os_ver_org%

REM If we live to see W12, replace 10.0.44000 below with the correct build and modify W11 line to add "lss 10.0.44000"
REM if %os_ver% GEQ 10.0.44000 set osName=Windows 12

if %os_ver% GEQ 10.0.22000 set osName=Windows 11
if %os_ver% GEQ 10.0.10240 if %os_ver% lss 10.0.22000 set osName=Windows 10
if %os_ver% equ 06.3 set osName=Windows 8.1
if %os_ver% equ 06.2 set osName=Windows 8
if %os_ver% equ 06.1 set osName=Windows 7
if %os_ver% equ 06.0 set osName=Windows Vista
if %os_ver% equ 05.2 set osName=Windows XP x64 or Server 2003
if %os_ver% equ 05.1 set osName=Windows XP
if %os_ver% equ 05.0 set osName=Windows 2000
if %os_ver% lss 05.0 set osName=Windows ME or 98 or less

echo %PROCESSOR_ARCHITECTURE% | findstr /c:"86" >nul && GOTO Win86
if %os_ver% GEQ 06.2 GOTO Execution
:Win86
if exist "C:\Windows\System32\acryptprimitives.dll" GOTO Execution
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
 
  ECHO CreateObject("Shell.Application").ShellExecute "%SystemRoot%\System32\cmd.exe", "/c""%~dpnx0""", "", "runas", 1 >"%vbsGetPrivileges%"
  ECHO CreateObject("Scripting.FileSystemObject").DeleteFile "%vbsGetPrivileges%">>"%vbsGetPrivileges%"

 "%SystemRoot%\System32\WScript.exe" "%vbsGetPrivileges%"
 exit /B

:gotPrivileges
REM :::::::::::::::::::::::::
REM START
REM :::::::::::::::::::::::::
REM Run shell as admin - put your code below as you like
copy "%CD%\oldwin\acryptprimitives.dll" "C:\Windows\System32\acryptprimitives.dll"

:Execution
sc query "Tor Win32 Service" >nul
if %errorLevel% EQU 0 (
call service-manager.cmd
timeout /t 3 /nobreak
)
cd tor
start /min tor -f ../torrc.txt
