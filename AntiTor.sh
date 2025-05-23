#!/bin/bash
cd tor
LD_LIBRARY_PATH=.
./tor -f ../torrc.txt
