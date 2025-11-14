#!/usr/bin/env bash
if command -v discord
then
LD_PRELOAD=./libdiscordbypass.so BYPASS_DELAY=50 BYPASS_FAKE_PACKETS=2 discord --proxy-server=socks5://127.0.0.1:9050
fi
if command -v vesktop
then
LD_PRELOAD=./libdiscordbypass.so BYPASS_DELAY=50 BYPASS_FAKE_PACKETS=2 vesktop --proxy-server=socks5://127.0.0.1:9050
fi
if command -v legcord
then
LD_PRELOAD=./libdiscordbypass.so BYPASS_DELAY=50 BYPASS_FAKE_PACKETS=2 legcord --proxy-server=socks5://127.0.0.1:9050
fi
if command -v webcord
then
LD_PRELOAD=./libdiscordbypass.so BYPASS_DELAY=50 BYPASS_FAKE_PACKETS=2 webcord --proxy-server=socks5://127.0.0.1:9050
fi
if command -v goofcord
then
LD_PRELOAD=./libdiscordbypass.so BYPASS_DELAY=50 BYPASS_FAKE_PACKETS=2 goofcord --proxy-server=socks5://127.0.0.1:9050
fi
