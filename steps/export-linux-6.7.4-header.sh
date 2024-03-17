#!/usr/bin/env bash
set -e
cd $LFS/sources

rm -rf linux-6.7.4
tar -xvf linux-6.7.4.tar.xz
cd linux-6.7.4
make mrproper
make headers
find usr/include -type f ! -name '*.h' -delete
cp -rv usr/include $LFS/usr

rm -rf $LFS/sources/linux-6.7.4

