#!/bin/bash
wget https://ipfs.io/ipns/k51qzi5uqu5dldod6robuflgitvj276br0xye3adipm3kc0bh17hfiv1e0hnp4/Autoupdate/pro.zip -O ./change-mode/pro.zip
if [ $? -eq 0 ]; then
read -p "Pro mode updated successfully! Press Enter to continue updating or close the window now."
else read -p "An unexpected error occurred! Aborting..."
exit
fi
killall tor
systemctl --user disable tor.service --now
wget https://ipfs.io/ipns/k51qzi5uqu5dldod6robuflgitvj276br0xye3adipm3kc0bh17hfiv1e0hnp4/Autoupdate/geoip -O ./data/geoip &&
wget https://ipfs.io/ipns/k51qzi5uqu5dldod6robuflgitvj276br0xye3adipm3kc0bh17hfiv1e0hnp4/Autoupdate/geoip6 -O ./data/geoip6 &&
wget https://ipfs.io/ipns/k51qzi5uqu5dldod6robuflgitvj276br0xye3adipm3kc0bh17hfiv1e0hnp4/Autoupdate/bridges-webtunnel-list.txt -O ./bridges-webtunnel-list.txt &&
wget https://ipfs.io/ipns/k51qzi5uqu5dldod6robuflgitvj276br0xye3adipm3kc0bh17hfiv1e0hnp4/Autoupdate/AntiTor_linux/tor -O ./tor/tor &&
wget https://ipfs.io/ipns/k51qzi5uqu5dldod6robuflgitvj276br0xye3adipm3kc0bh17hfiv1e0hnp4/Autoupdate/AntiTor_linux/lyrebird -O ./tor/pluggable_transports/lyrebird &&
wget https://ipfs.io/ipns/k51qzi5uqu5dldod6robuflgitvj276br0xye3adipm3kc0bh17hfiv1e0hnp4/Autoupdate/AntiTor_linux/conjure-client -O ./tor/pluggable_transports/conjure-client &&
wget https://ipfs.io/ipns/k51qzi5uqu5dldod6robuflgitvj276br0xye3adipm3kc0bh17hfiv1e0hnp4/Autoupdate/AntiTor_linux/AntiTor.sh -O ./AntiTor.sh &&
wget https://ipfs.io/ipns/k51qzi5uqu5dldod6robuflgitvj276br0xye3adipm3kc0bh17hfiv1e0hnp4/Autoupdate/AntiTor_linux/readme.linux -O ./readme.linux &&
wget https://ipfs.io/ipns/k51qzi5uqu5dldod6robuflgitvj276br0xye3adipm3kc0bh17hfiv1e0hnp4/Autoupdate/AntiTor_linux/full-stop.sh -O ./full-stop.sh &&
wget https://ipfs.io/ipns/k51qzi5uqu5dldod6robuflgitvj276br0xye3adipm3kc0bh17hfiv1e0hnp4/Autoupdate/AntiTor_linux/service-check.sh -O ./service-check.sh &&
wget https://ipfs.io/ipns/k51qzi5uqu5dldod6robuflgitvj276br0xye3adipm3kc0bh17hfiv1e0hnp4/Autoupdate/AntiTor_linux/service-create.sh -O ./service-create.sh
if [ $? -eq 0 ]; then
read -p "All files updated successfully!"
else read -p "Unfortunately some files were not properly updated. PLease check what went wrong."
fi
