#!/usr/bin/env bash
set -e
cd /sources

rm -rf mpc-1.3.1
tar -xvf mpc-1.3.1.tar.gz
cd mpc-1.3.1

./configure --prefix=/usr \
	--disable-static \
	--docdir=/usr/share/doc/mpc-1.3.1

make
make html
echo "do not test" || make check
make install
make install-html
rm -rf /sources/mpc-1.3.1

