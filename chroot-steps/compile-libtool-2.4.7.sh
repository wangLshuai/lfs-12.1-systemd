#!/usr/bin/env bash
set -e
cd /sources

rm -rf libtool-2.4.7
tar -xvf libtool-2.4.7.tar.xz
cd libtool-2.4.7

./configure --prefix=/usr

make
set +e
echo "do not test" || make -k check
set -e
make install
rm -fv /usr/lib/libltdl.a
rm -rf /sources/libtool-2.4.7

