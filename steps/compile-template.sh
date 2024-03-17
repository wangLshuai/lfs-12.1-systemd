#!/usr/bin/env bash
set -e
cd $LFS/sources

rm -rf package
tar -xvf package.tar.xz
cd package

mkdir build
cd build
../configure

make
make install
rm -rf $LFS/sources/package

