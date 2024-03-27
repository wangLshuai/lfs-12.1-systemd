#!/usr/bin/env bash
set -e
cd /sources

rm -rf patch-2.7.6
tar -xvf patch-2.7.6.tar.xz
cd patch-2.7.6

./configure --prefix=/usr

make
echo "do not test" || make check
make install
rm -rf /sources/patch-2.7.6

