#!/usr/bin/env bash
set -e
cd /sources

rm -rf bc-6.7.5
tar -xvf bc-6.7.5.tar.xz
cd bc-6.7.5

CC=gcc ./configure --prefix=/usr -G -O3 -r

make
echo "do not test " || make test
make install
rm -rf /sources/bc-6.7.5

