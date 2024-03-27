#!/usr/bin/env bash
set -e
cd /sources

rm -rf texinfo-7.1
tar -xvf texinfo-7.1.tar.xz
cd texinfo-7.1

./configure --prefix=/usr

make
echo "do not test" || make check
make install
make TEXMF=/usr/share/texmf install=tex
rm -rf /sources/texinfo-7.1

