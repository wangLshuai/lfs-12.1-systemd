#!/usr/bin/env bash
set -e
cd /sources

rm -rf psmisc-23.6
tar -xvf psmisc-23.6.tar.xz
cd psmisc-23.6

./configure --prefix=/usr

make
echo "do not test" || make check
make install
rm -rf /sources/psmisc-23.6

