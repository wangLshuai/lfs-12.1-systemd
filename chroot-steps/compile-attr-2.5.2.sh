#!/usr/bin/env bash
set -e
cd /sources

rm -rf attr-2.5.2
tar -xvf attr-2.5.2.tar.gz
cd attr-2.5.2

./configure --prefix=/usr \
	--disable-static \
	--sysconfdir=/etc \
	--docdir=/usr/share/doc/attr-2.5.2

make
make check
make install
rm -rf /sources/attr-2.5.2

