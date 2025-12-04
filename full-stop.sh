#!/usr/bin/env bash
cd "$(dirname "$0")"
lsof -t ./tor/ld-linux-x86-64.so.2 | xargs kill
systemctl --user is-active --quiet tor.service
if [ $? -eq 0 ]; then
systemctl --user disable tor.service --now
rm ~/.config/systemd/user/tor.service
fi
read -p ""
