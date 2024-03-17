#!/usr/bin/env bash
cd $LFS/sources

rm -rf binutils-2.42
tar -xvf binutils-2.42.tar.xz
cd binutils-2.42
mkdir -v build
cd build
../configure --prefix=$LFS/tools \
	--with-sysroot=$LFS \
	--target=$LFS_TGT \
	--disable-nls \
	--enable-gprofng=no \
	--disable-werror \
	--enable-default-hash-style=gnu
make
make install
rm -rf binutils-2.42

