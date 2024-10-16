@set @_cmd=1 /*
@echo off

whoami /groups | findstr "S-1-16-12288" >nul && goto :admin
if "%~1"=="RunAsAdmin" goto :error

echo Requesting privileges elevation for managing Tor Win32 Service . . .
cscript /nologo /e:javascript "%~f0" || goto :error
exit /b

:admin
pushd "%~dp0"

)

sc stop "Tor Win32 Service"
sc delete "Tor Win32 Service"
if %errorLevel% NEQ 0 (
    powershell -Command "(gc '%CD%\torrc.txt') "^
      "-replace '^CacheDirectory.*$', ('CacheDirectory \"%CD%\data\"' -replace '\\','\\') "^
      "-replace '^DataDirectory.*$', ('DataDirectory \"%CD%\data\"' -replace '\\','\\') "^
      "-replace '^GeoIPFile.*$', ('GeoIPFile \"%CD%\data\geoip\"' -replace '\\','\\') "^
      "-replace '^GeoIPv6File.*$', ('GeoIPv6File \"%CD%\data\geoip6\"' -replace '\\','\\') "^
      "| Out-File -encoding ASCII '%CD%\torrc.txt'"
    sc create "Tor Win32 Service" binPath= "\"%CD%\tor\tor.exe\" --nt-service -f \"%CD%\torrc.txt\"" start= "auto"
    sc description "Tor Win32 Service" "Provides an anonymous Internet communication system"
    sc start "Tor Win32 Service"
)

pause */

// JScript, restart batch script as administrator
var objShell = WScript.CreateObject('Shell.Application');
var ComSpec = WScript.CreateObject('WScript.Shell').ExpandEnvironmentStrings('%ComSpec%');
objShell.ShellExecute(ComSpec, '/c ""' + WScript.ScriptFullName + '" RunAsAdmin"', '', 'runas', 1);