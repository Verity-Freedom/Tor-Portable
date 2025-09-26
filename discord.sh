#!/usr/bin/env bash
if command -v discord
then
LD_PRELOAD=./libdiscordbypass.so discord --proxy-server=socks5://127.0.0.1:9050
else
LD_PRELOAD=./libdiscordbypass.so vesktop --proxy-server=socks5://127.0.0.1:9050
fi
