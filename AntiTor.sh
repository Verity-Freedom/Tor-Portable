#!/usr/bin/env bash
cd tor
./ld-linux-x86-64.so.2 --library-path . ./tor -f ../torrc.txt
