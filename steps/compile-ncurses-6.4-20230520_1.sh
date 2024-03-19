#!/usr/bin/env bash
set -e
cd $LFS/sources

rm -rf ncurses-6.4-20230520
tar -xvf ncurses-6.4-20230520.tar.xz
cd ncurses-6.4-20230520
sed -i s/mawk// configure
mkdir build

pushd build
../configure
make -C include
make -C progs tic
popd

./configure --prefix=/usr \
	--host=$LFS_TGT \
	--build=$(./config.guess) \
	--mandir=/usr/share/man \
	--with-manpage-format=normal \
	--with-shared \
	--without-normal \
	--with-cxx-shared \
	--without-debug \
	--without-ada \
	--disable-stripping \
	--enable-widec
make

make DESTDIR=$LFS TIC_PATH=$(pwd)/build/progs/tic install
ln -sfv libncursesw.so $LFS/usr/lib/libncurses.so
sed -e 's/^#if.*XOPEN.*$/#if 1/' \
	-i $LFS/usr/include/curses.h

rm -rf $LFS/sources/ncurses-6.4-20230520

