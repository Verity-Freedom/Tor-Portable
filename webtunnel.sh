#!/usr/bin/env bash
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$(pwd)
./ld-linux-x86-64.so.2 ./webtunnel-client
