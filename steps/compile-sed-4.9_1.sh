#!/usr/bin/env bash
set -e
cd $LFS/sources

rm -rf sed-4.9
tar -xvf sed-4.9.tar.xz
cd sed-4.9

./configure --prefix=/usr \
	--host=$LFS_TGT \
	--build=$(./build-aux/config.guess)

make
make DESTDIR=$LFS install
rm -rf $LFS/sources/sed-4.9

