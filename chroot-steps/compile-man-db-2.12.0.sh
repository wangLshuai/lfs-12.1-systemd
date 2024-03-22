#!/usr/bin/env bash
set -e
cd /sources

rm -rf man-db-2.12.0
tar -xvf man-db-2.12.0.tar.xz
cd man-db-2.12.0

./configure --prefix=/usr \
	--docdir=/usr/share/doc/man-db-2.12.0 \
	--sysconfdir=/etc \
	--disable-setuid \
	--enable-cache-owner=bin \
	--with-browser=/usr/binlynx \
	--with-vgrind=/usr/bin/vgrind \
	--with-grap=/usr/bin/grap

make
make check
make install
rm -rf /sources/man-db-2.12.0

