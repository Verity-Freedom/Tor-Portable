#!/bin/sh
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
WorkingDirectory=$(dirname "$0")
ExecStart=/bin/sh -c './AntiTor.sh'

[Install]
WantedBy=default.target
EOF
systemctl --user daemon-reload
systemctl --user enable tor.service --now
fi
