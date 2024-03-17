#!/usr/bin/env bash
set -e
cd $LFS/sources

rm -rf gcc-13.2.0
tar -xvf gcc-13.2.0.tar.xz
cd gcc-13.2.0

mkdir -v build
cd build
../libstdc++-v3/configure \
    --host=$LFS_TGT \
    --build=$(../config.guess) \
    --prefix=/usr \
    --disable-nls \
    --disable-multilib \
    --disable-libstdcxx-pch \
    --with-gxx-include-dir=/tools/$LFS_TGT/include/c++/13.2.0

make
make DESTDIR=$LFS install

rm -v $LFS/usr/lib/lib{stdc++{,exp,fs},supc++}.la
