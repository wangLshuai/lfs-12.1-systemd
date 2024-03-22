#!/usr/bin/env bash
set -e
cd /sources

rm -rf check-0.15.2
tar -xvf check-0.15.2.tar.gz
cd check-0.15.2

./configure --prefix=/usr --disable-static

make
make check
make docdir=/usr/share/doc/check-0.15.2 install
rm -rf /sources/check-0.15.2

