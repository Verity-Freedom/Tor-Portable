#!/usr/bin/env bash
cd tor
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$(pwd)
./ld-linux-x86-64.so.2 ./tor -f ../torrc.txt
