#!/usr/bin/env bash
set -e
cd /sources

rm -rf gzip-1.13
tar -xvf gzip-1.13.tar.xz
cd gzip-1.13

./configure --prefix=/usr

make
make check
make install
rm -rf /sources/gzip-1.13

