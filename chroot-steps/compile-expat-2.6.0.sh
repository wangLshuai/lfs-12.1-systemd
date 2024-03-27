#!/usr/bin/env bash
set -e
cd /sources

rm -rf expat-2.6.0
tar -xvf expat-2.6.0.tar.xz
cd expat-2.6.0

./configure --prefix=/usr \
	--disable-static \
	--docdir=/usr/share/doc/expat-2.6.0

make
echo "do not test" || make check
make install
install -v -m644 doc/*.{html,css} /usr/share/doc/expat-2.6.0
rm -rf /sources/expat-2.6.0

