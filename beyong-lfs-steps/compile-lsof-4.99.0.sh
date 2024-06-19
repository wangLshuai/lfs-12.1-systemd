#!/usr/bin/env bash
set -e
cd /beyong-sources

rm -rf lsof-4.99.0
tar -xvf lsof-4.99.0.tar.gz
cd lsof-4.99.0

./configure --prefix=/usr --disable-static 

make
#make check
make install
cd ..
rm -rf lsof-4.99.0
