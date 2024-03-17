#!/usr/bin/env bash
set -e
cd $LFS/sources

rm -rf diffutils-3.10
tar -xvf diffutils-3.10.tar.xz
cd diffutils-3.10

./configure --prefix=/usr \
	--host=$LFS_TGT \
	--build=$(./build-aux/config.guess)

make
make DESTDIR=$LFS install
rm -rf $LFS/sources/diffutils-3.10

