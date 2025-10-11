#!/usr/bin/env bash
cd "$(dirname "$0")"
lsof -t ./tor/ld-linux-x86-64.so.2 | xargs kill
systemctl --user disable tor.service --now
rm ~/.config/systemd/user/tor.service
rm -r *
curl https://ipfs.io/ipns/k51qzi5uqu5dldod6robuflgitvj276br0xye3adipm3kc0bh17hfiv1e0hnp4/AntiTor_linux_current.zip -O
unzip ./AntiTor_linux_current.zip
rm ./AntiTor_linux_current.zip
