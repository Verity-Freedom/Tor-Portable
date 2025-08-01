#!/usr/bin/env bash
lsof -t ./tor/ld-linux-x86-64.so.2 | xargs kill
killall tor --quiet
systemctl --user disable tor.service --now
rm ~/.config/systemd/user/tor.service
systemctl --user daemon-reload
grep -q "The mode is default" torrc.txt
if [ $? -eq 0 ]; then
cp -fr ./change-mode/modes/pro/torrc.txt torrc.txt
read -p "The mode was changed to pro."
exit
fi

grep -q "The mode is pro" torrc.txt
if [ $? -eq 0 ]; then
cp -fr ./change-mode/modes/default/torrc.txt torrc.txt
read -p "The mode was changed to default."
exit
else
cp -fr ./change-mode/modes/default/torrc.txt torrc.txt
read -p "An error occurred. Attempted to update the mode and set it to default. The error should be gone."
fi
