#!/usr/bin/env bash
set -e
cd /sources

rm -rf automake-1.16.5
tar -xvf automake-1.16.5.tar.xz
cd automake-1.16.5

./configure --prefix=/usr --docdir=/usr/share/doc/automake-1.16.5

make
echo "do not test" || make -j4 check
make install
rm -rf /sources/automake-1.16.5

