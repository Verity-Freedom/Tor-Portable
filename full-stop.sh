#!/usr/bin/env bash
killall tor
killall ld-linux-x86-64.so.2
systemctl --user disable tor.service --now
rm ~/.config/systemd/user/tor.service
systemctl --user daemon-reload

read -p "Press Enter to continue"
