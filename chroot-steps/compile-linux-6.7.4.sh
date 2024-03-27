#!/usr/bin/env bash
set -e
cd /sources
tar -xvf linux-6.7.4.tar.xz
cd linux-6.7.4
make mrproper
cp /sources/config .config
make -j`nproc`
make modules_install INSTALL_MOD_STRIP=1
make install

rm -rf /sources/linux-6.7.4
