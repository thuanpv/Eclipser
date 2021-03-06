#!/bin/bash

# Grey-box concolic should find more than 9 file input test cases that have node
# coverage gain.
gcc cmp.c -o cmp.bin -static -g || exit 1 # -static option for easier debugging
rm -rf box
mkdir box
cd box
dotnet ../../build/Eclipser.dll fuzz -p ../cmp.bin -t 5 -v 1 -o output \
  --src file --maxfilelen 16 -f input --initarg input
