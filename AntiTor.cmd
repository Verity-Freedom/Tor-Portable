sc query "Tor Win32 Service" | find "RUNNING"
if %errorLevel% EQU 0 (
call service-manager.cmd
TIMEOUT /T 2
cd tor
start /min tor -f ../torrc.txt
) else (
cd tor
start /min tor -f ../torrc.txt
)