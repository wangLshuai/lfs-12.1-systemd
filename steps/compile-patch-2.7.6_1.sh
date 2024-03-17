#!/usr/bin/env bash
set -e
cd $LFS/sources

rm -rf patch-2.7.6
tar -xvf patch-2.7.6.tar.xz
cd patch-2.7.6

./configure --prefix=/usr \
	--host=$LFS_TGT \
	--build=$(build-aux/config.guess)

make
make DESTDIR=$LFS install
rm -rf $LFS/sources/patch-2.7.6

