#!/usr/bin/env bash
set -e
cd /sources

rm -rf libffi-3.4.4
tar -xvf libffi-3.4.4.tar.gz
cd libffi-3.4.4

./configure --prefix=/usr \
	--disable-static \
	--with-gcc-arch=native

make
set +e
make check
set -e
make install
rm -rf /sources/libffi-3.4.4

