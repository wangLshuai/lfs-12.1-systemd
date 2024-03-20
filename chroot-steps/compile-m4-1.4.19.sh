#!/usr/bin/env bash
set -e
cd /sources

rm -rf m4-1.4.19
tar -xvf m4-1.4.19.tar.xz
cd m4-1.4.19

./configure --prefix=/usr

make
set +e
make check
set -e
make install
rm -rf /sources/m4-1.4.19

