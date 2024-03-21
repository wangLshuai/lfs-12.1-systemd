#!/usr/bin/env bash
set -e
cd /sources

rm -rf autoconf-2.72
tar -xvf autoconf-2.72.tar.xz
cd autoconf-2.72

./configure --prefix=/usr

make
make check
make install
rm -rf /sources/autoconf-2.72

