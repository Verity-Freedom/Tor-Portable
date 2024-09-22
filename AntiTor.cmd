powershell -Command "(gc '%CD%\torrc.txt') "^
  "-replace '^CacheDirectory.*$', ('CacheDirectory \"%CD%\data\"' -replace '\\','\\') "^
  "-replace '^ClientOnionAuthDir.*$', ('ClientOnionAuthDir \"%CD%\data\onion-auth\"' -replace '\\','\\') "^
  "-replace '^DataDirectory.*$', ('DataDirectory \"%CD%\data\"' -replace '\\','\\') "^
  "-replace '^GeoIPFile.*$', ('GeoIPFile \"%CD%\data\geoip\"' -replace '\\','\\') "^
  "-replace '^GeoIPv6File.*$', ('GeoIPv6File \"%CD%\data\geoip6\"' -replace '\\','\\') "^
  "| Out-File -encoding ASCII '%CD%\torrc.txt'"
cd tor
start /min tor -f ..\torrc.txt
