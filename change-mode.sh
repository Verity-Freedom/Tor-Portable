#!/usr/bin/env bash
lsof -t ./tor/ld-linux-x86-64.so.2 | xargs kill
systemctl --user disable tor.service --now
rm ~/.config/systemd/user/tor.service
if grep -q "The mode is default" torrc.txt; then
cp ./change-mode/pro/torrc.txt torrc.txt
read -p "The mode was changed to pro."
exit
fi

if grep -q "The mode is pro" torrc.txt; then
cp ./change-mode/default/torrc.txt torrc.txt
read -p "The mode was changed to default."
exit
else
cp ./change-mode/default/torrc.txt torrc.txt
read -p "An error occurred. Attempted to update the mode and set it to default. The error should be gone."
fi
