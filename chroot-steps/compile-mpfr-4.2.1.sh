#!/usr/bin/env bash
set -e
cd /sources

rm -rf mpfr-4.2.1
tar -xvf mpfr-4.2.1.tar.xz
cd mpfr-4.2.1

./configure --prefix=/usr \
	--disable-static \
	--enable-thread-safe \
	--docdir=/usr/share/doc/mfr-4.2.1

make
make html
make check
make install
make install-html
rm -rf /sources/mpfr-4.2.1

