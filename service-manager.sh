#!/usr/bin/env bash
cd "$(dirname "$0")"
UPD=(VERSION*)
curl "https://ipfs.io/ipns/k51qzi5uqu5dldod6robuflgitvj276br0xye3adipm3kc0bh17hfiv1e0hnp4/$UPD" -f -s -o /dev/null
if [[ $? -eq 22 ]]; then
read -n 1 -p "The local version does not match the latest version. Press any key if you want to skip the update, 0 or 1 if you want to update, 0 if you want to start the service after update" INP
 if [[ $INP -eq 0 || $INP -eq 1 ]]; then
 ./updater.sh
 fi
 if [[ $INP -eq 1 ]]; then
 exit
 fi
fi
if systemctl --user is-active --quiet tor.service; then
systemctl --user disable tor.service --now
rm ~/.config/systemd/user/tor.service
systemctl --user status tor.service
read -p "Tor service was deleted"
exit
fi
lsof -t ./tor/ld-linux-x86-64.so.2 | xargs kill
mkdir -p ~/.config/systemd/user
cat <<EOF > ~/.config/systemd/user/tor.service
[Unit]
Description=Tor Portable
Wants=network-online.target
After=network-online.target

[Service]
Restart=always
WorkingDirectory=$(pwd)
ExecStart=$(pwd)/AntiTor.sh

[Install]
WantedBy=default.target
EOF
systemctl --user enable tor.service --now
if [ ! -f $(pwd)/data/user-data/state ]; then
echo "PLease wait 10 seconds while I load the data"
sleep 10
else
sleep 2
fi
./service-check.sh
