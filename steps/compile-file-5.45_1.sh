#!/usr/bin/env bash
set -e
cd $LFS/sources

rm -rf file-5.45
tar -xvf file-5.45.tar.gz
cd file-5.45

mkdir build
pushd build
../configure --disable-bzlib \
	--disable-libseccomp \
	--disable-xzlib \
	--disable-zlib
make
popd

./configure --prefix=/usr --host=$LFS_TGT --build=$(./config.guess)
make FILE_COMPILE=$(pwd)/build/src/file
make DESTDIR=$LFS install
rm -rf $LFS/sources/file-5.45

