#!/usr/bin/env bash
set -e
cd /sources

rm -rf zlib-1.3.1
tar -xvf zlib-1.3.1.tar.gz
cd zlib-1.3.1

./configure --prefix=/usr

make
echo "do not test" || make check
make install
rm -fv /usr/lib/libz.a
rm -rf /sources/zlib-1.3.1

