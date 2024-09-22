@ECHO OFF
PUSHD "%~dp0"

net session >nul 2>&1
if %errorLevel% NEQ 0 (
    echo This script should be run with administrator privileges.
    echo Right click - run as administrator.
    pause
    exit /b -1
)

sc stop "Tor Win32 Service"
sc delete "Tor Win32 Service"
if %errorLevel% NEQ 0 (
    powershell -Command "(gc '%CD%\torrc.txt') "^
      "-replace '^CacheDirectory.*$', ('CacheDirectory \"%CD%\data\"' -replace '\\','\\') "^
      "-replace '^ClientOnionAuthDir.*$', ('ClientOnionAuthDir \"%CD%\data\onion-auth\"' -replace '\\','\\') "^
      "-replace '^DataDirectory.*$', ('DataDirectory \"%CD%\data\"' -replace '\\','\\') "^
      "-replace '^GeoIPFile.*$', ('GeoIPFile \"%CD%\data\geoip\"' -replace '\\','\\') "^
      "-replace '^GeoIPv6File.*$', ('GeoIPv6File \"%CD%\data\geoip6\"' -replace '\\','\\') "^
      "| Out-File -encoding ASCII '%CD%\torrc.txt'"
    sc create "Tor Win32 Service" binPath= "\"%CD%\tor\tor.exe\" --nt-service -f \"%CD%\torrc.txt\"" start= "auto"
    sc description "Tor Win32 Service" "Provides an anonymous Internet communication system"
    sc start "Tor Win32 Service"
)

pause

POPD