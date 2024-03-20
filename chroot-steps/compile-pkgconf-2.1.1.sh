#!/usr/bin/env bash
set -e
cd /sources

rm -rf pkgconf-2.1.1
tar -xvf pkgconf-2.1.1.tar.xz
cd pkgconf-2.1.1

./configure --prefix=/usr \
	--disable-static \
	--docdir=/usr/share/doc/pkgconf-2.1.1

make
make install
ln -sv pkgconf /usr/bin/pkg-config
ln -sv pkgconf.1 /usr/share/man/man1/pkg-config.1
rm -rf /sources/pkgconf-2.1.1

