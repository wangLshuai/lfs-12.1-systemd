#!/usr/bin/env bash
set -e
cd $LFS/sources

rm -rf gzip-1.13
tar -xvf gzip-1.13.tar.xz
cd gzip-1.13

./configure --prefix=/usr --host=$LFS_TGT

make
make DESTDIR=$LFS install
rm -rf $LFS/sources/gzip-1.13

