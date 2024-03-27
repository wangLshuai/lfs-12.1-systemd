#!/usr/bin/env bash
set -e
cd /sources

rm -rf grep-3.11
tar -xvf grep-3.11.tar.xz
cd grep-3.11
sed -i "s/echo/#echo/" src/egrep.sh
./configure --prefix=/usr \

make
set +e
echo "do not test" || make check
set -e
make install
rm -rf /sources/grep-3.11

