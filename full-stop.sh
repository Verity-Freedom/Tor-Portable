#!/usr/bin/env bash
lsof -t ./tor/ld-linux-x86-64.so.2 | xargs kill
killall tor --quiet
systemctl --user disable tor.service --now
rm ~/.config/systemd/user/tor.service
read -p ""
