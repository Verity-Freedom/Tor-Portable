#!/usr/bin/env bash
export BYPASS_DELAY=50 BYPASS_FAKE_PACKETS=2 LD_PRELOAD=./libdiscordbypass.so
server=--proxy-server=socks5://127.0.0.1:9050
if command -v discord
then
discord $server
fi
if command -v vesktop
then
vesktop $server
fi
if command -v legcord
then
legcord $server
fi
if command -v webcord
then
webcord $server
fi
if command -v goofcord
then
goofcord $server
fi
