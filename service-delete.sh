#!/bin/sh
systemctl --user disable tor.service --now
rm ~/.config/systemd/user/tor.service
systemctl --user daemon-reload

sleep 10
