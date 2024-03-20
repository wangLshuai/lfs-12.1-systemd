#!/usr/bin/env bash
set -e
cd /sources

rm -rf python-3.12.2
tar -xvf Python-3.12.2.tar.xz
cd Python-3.12.2

./configure --prefix=/usr \
	--enable-shared \
	--without-ensurepip

make
make install
rm -rf /sources/Python-3.12.2

