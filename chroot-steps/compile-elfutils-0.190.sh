#!/usr/bin/env bash
set -e
cd /sources

rm -rf elfutils-0.190
tar -xvf elfutils-0.190.tar.bz2
cd elfutils-0.190

./configure --prefix=/usr \
	--disable-debuginfod \
	--enable-libdebuginfod=dummy
make
make check
make -C libelf install
rm /usr/lib/libelf.a
rm -rf /sources/elfutils-0.190

