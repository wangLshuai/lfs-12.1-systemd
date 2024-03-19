#!/usr/bin/env bash
set -e
cd $LFS/sources

rm -rf bash-5.2.21
tar -xvf bash-5.2.21.tar.gz
cd bash-5.2.21

./configure --prefix=/usr \
	--build=$(sh support/config.guess) \
	--host=$LFS_TGT \
	--without-bash-malloc
make
make DESTDIR=$LFS install
ln -svf bash $LFS/bin/sh
rm -rf $LFS/sources/bash-5.2.21

