#!/bin/bash -e

baseURL="https://xorg.freedesktop.org/releases/individual"
xorgRelease="7.3"
sets="proto util lib app font driver"
baseDir=/home/sander/ulpkgs3/x/xorg

cd "$baseDir"

for set in $sets
do
    mkdir -p $set
    cd $set
    grep -v '^#' $set-$xorgRelease.wget | wget -i- -c \
        -B $baseURL/$set/
    cd ..
done
