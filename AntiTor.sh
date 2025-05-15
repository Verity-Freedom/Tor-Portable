#!/bin/sh
killall tor
sleep 0.1
cd tor
LD_LIBRARY_PATH=.
./tor -f ../torrc.txt
