#!/usr/bin/env bash
set -e
cd /sources

rm -rf libxcrypt-4.4.36
tar -xvf libxcrypt-4.4.36.tar.xz
cd libxcrypt-4.4.36

./configure --prefix=/usr \
	--enable-hashes=strong,glibc \
	--enable-obsolete-api=no \
	--disable-static \
	--disable-failure-tokens

make
make check 
make install
rm -rf /sources/libxcrypt-4.4.36

