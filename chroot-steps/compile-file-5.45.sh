#!/usr/bin/env bash
set -e
cd /sources

rm -rf file-5.45
tar -xvf file-5.45.tar.gz
cd file-5.45

./configure --prefix=/usr

make
echo "do not test" || make check
make install
rm -rf /sources/file-5.45

