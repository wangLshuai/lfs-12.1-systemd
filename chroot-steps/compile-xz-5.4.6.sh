#!/usr/bin/env bash
set -e
cd /sources

rm -rf xz-5.4.6
tar -xvf xz-5.4.6.tar.xz
cd xz-5.4.6

./configure --prefix=/usr \
	--disable-static \
	--docdir=/usr/share/doc/xz-5.4.6

make
echo "do not test" || make check
make install
rm -rf /sources/xz-5.4.6

