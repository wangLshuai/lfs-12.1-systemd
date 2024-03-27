#!/usr/bin/env bash
set -e
cd /sources

rm -rf groff-1.23.0
tar -xvf groff-1.23.0.tar.gz
cd groff-1.23.0

PAGE=A4 ./configure --prefix=/usr

make
echo "do not test" || make check
make install
rm -rf /sources/groff-1.23.0

