#!/usr/bin/env bash
cd "$(dirname "$0")"
systemctl --user is-active --quiet tor.service
if [ $? -eq 0 ]; then
CHECK=0
fi
lsof -t ./tor/ld-linux-x86-64.so.2 | xargs kill
systemctl --user disable tor.service --now
rm ~/.config/systemd/user/tor.service
cp ./torrc.txt ./data/torrc.txt
cp -r ./data ~/data
rm -r *
curl "https://ipfs.io/ipns/k51qzi5uqu5dldod6robuflgitvj276br0xye3adipm3kc0bh17hfiv1e0hnp4/AntiTor_linux_current.zip" -O
unzip ./AntiTor_linux_current.zip
rm ./AntiTor_linux_current.zip
cp -r ~/data ./
rm -r ~/data
if grep -q "The mode is pro" ./data/torrc.txt; then
cp ./change-mode/pro/torrc.txt torrc.txt
fi
if [[ $CHECK = 0 ]]; then
./service-manager.sh
fi
