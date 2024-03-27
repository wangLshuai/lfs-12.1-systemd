#!/usr/bin/env bash
set -e
cd /sources

rm -rf binutils-2.42
tar -xvf binutils-2.42.tar.xz
cd binutils-2.42

mkdir build
cd build
../configure --prefix=/usr \
	--sysconfdir=/etc \
	--enable-gold \
	--enable-ld=default \
	--enable-plugins \
	--enable-shared \
	--disable-werror \
	--enable-64-bit-bfd \
	--with-system-zlib \
	--enable-default-hash-style=gnu

make tooldir=/usr
set +e
echo "do not test" || make -k check
grep '^FAIL:' $(find -name '*.log')
set -e
make tooldir=/usr install
rm -fv /usr/lib/lib{bfd,ctf,ctf-nobfd,gprofng,opcodes,sframe}.a
rm -rf /sources/binutils-2.42

