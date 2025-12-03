#!/usr/bin/env bash
cd "$(dirname "$0")"
UPD=(VERSION*)
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
