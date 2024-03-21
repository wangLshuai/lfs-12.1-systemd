#!/usr/bin/env bash
set -e
cd /sources

rm -rf gdbm-1.23
tar -xvf gdbm-1.23.tar.gz
cd gdbm-1.23

./configure --prefix=/usr \
	--disable-static \
	--enable-libgdbm-compat

make
make check
make install
rm -rf /sources/gdbm-1.23

