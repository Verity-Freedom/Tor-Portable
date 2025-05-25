@echo off
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

if %os_ver% GEQ 06.2 GOTO Execution
if exist "C:\Windows\System32\acryptprimitives.dll" GOTO Execution
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
copy "%CD%\oldwin\acryptprimitives.dll" "C:\Windows\System32\acryptprimitives.dll"

:Execution
sc query "Tor Win32 Service" | find "RUNNING"
if %errorLevel% EQU 0 (
call service-manager.cmd
TIMEOUT /T 2
)
cd tor
start /min tor -f ../torrc.txt