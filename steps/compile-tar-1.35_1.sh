#!/usr/bin/env bash
set -e
cd $LFS/sources

rm -rf tar-1.35
tar -xvf tar-1.35.tar.xz
cd tar-1.35

./configure --prefix=/usr \
	--host=$LFS_TGT \
	--build=$(build-aux/config.guess)

make
make DESTDIR=$LFS install
rm -rf $LFS/sources/tar-1.35

