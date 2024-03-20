#!/usr/bin/env bash
set -e
cd /sources

rm -rf texinfo-7.1
tar -xvf texinfo-7.1.tar.xz
cd texinfo-7.1

./configure --prefix=/usr

make
make install
rm -rf /sources/texinfo-7.1

