powershell -Command "(gc '%CD%\torrc.txt') "^
  "-replace '^CacheDirectory.*$', ('CacheDirectory ..\data') "^
  "-replace '^DataDirectory.*$', ('DataDirectory ..\data') "^
  "-replace '^GeoIPFile.*$', ('GeoIPFile ..\data\geoip') "^
  "-replace '^GeoIPv6File.*$', ('GeoIPv6File ..\data\geoip6') "^
  "| Out-File -encoding ASCII '%CD%\torrc.txt'"
cd tor
start /min tor -f ..\torrc.txt
