#!/usr/bin/env bash
set -e
cd $LFS/sources

rm -rf grep-3.11
tar -xvf grep-3.11.tar.xz
cd grep-3.11

./configure --prefix=/usr \
	--host=$LFS_TGT \
	--build=$(./build-aux/config.guess)

make
make DESTDIR=$LFS install
rm -rf $LFS/sources/grep-3.11

