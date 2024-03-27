#!/usr/bin/env bash
set -e
cd /sources

rm -rf less-643
tar -xvf less-643.tar.gz
cd less-643

./configure --prefix=/usr --sysconfdir=/etc

make
echo "do not test" || make check
make install
rm -rf /sources/less-643

