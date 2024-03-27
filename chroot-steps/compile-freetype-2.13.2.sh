#!/usr/bin/env bash
set -e
cd /sources

rm -rf freetype-2.13.2
tar -xvf freetype-2.13.2.tar.xz 
cd freetype-2.13.2
sed -ri "s:.*(AUX_MODULES.*valid):\1:" modules.cfg 
sed -r "s:.*(#.*SUBPIXEL_RENDERING) .*:\1:" -i include/freetype/config/ftoption.h

./configure --prefix=/usr --enable-freetype-config --disable-static

make
make install
rm -rf /sources/freetype-2.13.2

