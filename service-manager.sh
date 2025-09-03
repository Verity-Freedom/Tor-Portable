#!/usr/bin/env bash
systemctl --user is-active --quiet tor.service
if [ $? -eq 0 ]; then
systemctl --user disable tor.service --now
rm ~/.config/systemd/user/tor.service
systemctl --user status tor.service
read -p "Tor service was deleted"
exit
fi
lsof -t ./tor/ld-linux-x86-64.so.2 | xargs kill
killall tor --quiet
mkdir ~/.config/systemd
mkdir ~/.config/systemd/user
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
systemctl --user status tor.service

read -p "Press Enter to continue"
