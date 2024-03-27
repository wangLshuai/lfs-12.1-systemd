#!/usr/bin/env bash
set -e
cd /sources

rm -rf gperf-3.1
tar -xvf gperf-3.1.tar.gz
cd gperf-3.1

./configure --prefix=/usr --docdir=/usr/share/doc/gperf-3.1

make
echo "do not test" || make -j1 check
make install
rm -rf /sources/gperf-3.1

