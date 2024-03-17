#!/usr/bin/env bash
set -e
cd $LFS/sources

rm -rf binutils-2.42
tar -xvf binutils-2.42.tar.xz
cd binutils-2.42

sed '6009s/$add_dir//' -i ltmain.sh
mkdir build
cd build
../configure --prefix=/usr \
	--build=$(../config.guess) \
	--host=$LFS_TGT \
	--disable-nls \
	--enable-shared \
	--enable-gprofng=no \
	--disable-werror \
	--enable-64-bit-bfd \
	--enable-default-hash-type=gnu

make
make DESTDIR=$LFS install
rm -rf $LFS/sources/binutils-2.42
rm -v $LFS/usr/lib/lib{bfd,ctf,ctf-nobfd,opcodes,sframe}.{a,la}

