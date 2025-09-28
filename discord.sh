#!/usr/bin/env bash
if command -v discord
then
LD_PRELOAD=./libdiscordbypass.so discord --proxy-server=socks5://127.0.0.1:9050
fi
if command -v vesktop
then
LD_PRELOAD=./libdiscordbypass.so vesktop --proxy-server=socks5://127.0.0.1:9050
fi
if command -v legcord
then
LD_PRELOAD=./libdiscordbypass.so legcord --proxy-server=socks5://127.0.0.1:9050
fi
if command -v webcord
then
LD_PRELOAD=./libdiscordbypass.so webcord --proxy-server=socks5://127.0.0.1:9050
fi
if command -v goofcord
then
LD_PRELOAD=./libdiscordbypass.so goofcord --proxy-server=socks5://127.0.0.1:9050
fi
