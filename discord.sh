#!/usr/bin/env bash
export BYPASS_DELAY=50
export BYPASS_FAKE_PACKETS=2
export LD_PRELOAD=./libdiscordbypass.so
if command -v discord
then
discord --proxy-server=socks5://127.0.0.1:9050
fi
if command -v vesktop
then
vesktop --proxy-server=socks5://127.0.0.1:9050
fi
if command -v legcord
then
legcord --proxy-server=socks5://127.0.0.1:9050
fi
if command -v webcord
then
webcord --proxy-server=socks5://127.0.0.1:9050
fi
if command -v goofcord
then
goofcord --proxy-server=socks5://127.0.0.1:9050
fi
