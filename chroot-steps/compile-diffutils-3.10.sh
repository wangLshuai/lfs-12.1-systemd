#!/usr/bin/env bash
set -e
cd /sources

rm -rf diffutils-3.10
tar -xvf diffutils-3.10.tar.xz
cd diffutils-3.10

./configure --prefix=/usr

make
set +e
make check
set -e
make install
rm -rf /sources/diffutils-3.10

