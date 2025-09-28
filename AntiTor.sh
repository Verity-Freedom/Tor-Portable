#!/usr/bin/env bash
cd "$(dirname "$0")"
cd tor
./ld-linux-x86-64.so.2 --library-path . ./tor -f ../torrc.txt
