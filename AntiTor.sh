#!/usr/bin/env bash
cd tor
LD_LIBRARY_PATH=.
./ld-linux-x86-64.so.2 ./tor -f ../torrc.txt
