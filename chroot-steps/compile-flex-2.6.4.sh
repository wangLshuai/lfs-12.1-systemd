#!/usr/bin/env bash
set -e
cd /sources

rm -rf flex-2.6.4
tar -xvf flex-2.6.4.tar.gz
cd flex-2.6.4

./configure --prefix=/usr \
	--docdir=/usr/share/doc/flex-2.6.4 \
	--disable-static
make
make check
make install
rm -rf /sources/flex-2.6.4

