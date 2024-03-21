#!/usr/bin/env bash
set -e
cd /sources
rm -rf gettext-0.22.4
tar -xvf gettext-0.22.4.tar.xz
cd gettext-0.22.4

./configure --prefix=/usr --disable-static --docdir=/usr/share/doc/gettext-0.22.4

make
set +e
make check
set -e
make install
chmod -v 0755 /usr/lib/preloadable_libintl.so
rm -rf $LFS/sources/gettext-0.22.4

