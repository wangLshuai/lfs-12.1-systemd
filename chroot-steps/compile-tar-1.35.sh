#!/usr/bin/env bash
set -e
cd /sources

rm -rf tar-1.35
tar -xvf tar-1.35.tar.xz
cd tar-1.35

FORCE_UNSAFE_CONFIGURE=1 \
./configure --prefix=/usr 

make
set +e
make check
set -e
make install
make -C doc install-html docdir=/usr/share/doc/tar-1.35
rm -rf /sources/tar-1.35

