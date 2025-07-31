#!/usr/bin/env bash
lsof -t ./tor/ld-linux-x86-64.so.2 | xargs kill
mkdir ~/.config/systemd
mkdir ~/.config/systemd/user
cat <<EOF > ~/.config/systemd/user/tor.service
[Unit]
Description=Tor Portable
Wants=network-online.target
After=network-online.target

[Service]
Type=notify
Restart=always
WorkingDirectory=$(pwd)
ExecStart=/bin/sh './AntiTor.sh'

[Install]
WantedBy=default.target
EOF
systemctl --user daemon-reload
systemctl --user enable tor.service --now
