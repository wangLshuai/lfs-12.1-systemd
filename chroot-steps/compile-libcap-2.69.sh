#!/usr/bin/env bash
set -e
cd /sources

rm -rf libcap-2.69
tar -xvf libcap-2.69.tar.xz
cd libcap-2.69
sed -i '/install -m.*STA/d' libcap/Makefile
mkdir build

make prefix=/usr lib=lib
echo "do not test " || make test
make prefix=/usr lib=lib install
rm -rf /sources/libcap-2.69

