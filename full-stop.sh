#!/bin/bash
killall tor
systemctl --user disable tor.service --now
rm ~/.config/systemd/user/tor.service
systemctl --user daemon-reload

read -p "Press Enter to continue"
