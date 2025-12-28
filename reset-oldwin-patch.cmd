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
del /F /Q "C:\Windows\System32\acryptprimitives.dll"
if exist "C:\Windows\System32\acryptprimitives.dll" (2> nul set =) else (1> nul ver)
if %errorlevel% EQU 0 echo The patch is not present anymore. You can try another Tor redaction if this one was not running, or try this one again.
pause
