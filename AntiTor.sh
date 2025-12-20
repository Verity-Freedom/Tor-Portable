#!/usr/bin/env bash
cd "$(dirname "$0")"
UPD=(VERSION*)
curl "https://ipfs.io/ipns/k51qzi5uqu5dldod6robuflgitvj276br0xye3adipm3kc0bh17hfiv1e0hnp4/$UPD" -f -s -o /dev/null
if [ $? -eq 22 ]; then
read -n 1 -p "The local version does not match the latest version. It means that update is available, but in edge cases marks accessibility issues. Press any key if you want to update or 0 to skip" INP
systemctl --user is-active --quiet tor.service
 if [ $? -eq 0 ]; then
 CHECK=0
 fi
 if [ $INP != 0 ]; then
 ./updater.sh
 fi
 if [[ $INP != 0 && $CHECK = 0 ]]; then
 ./service-manager.sh
 fi
fi
cd tor
./ipns-republisher.sh &
./ld-linux-x86-64.so.2 --library-path . ./tor -f ../torrc.txt
