#!/usr/bin/env bash
set -e
cd /sources

rm -rf usbutils-017
tar -xvf usbutils-017.tar.xz
cd usbutils-017

./configure --prefix=/usr --datadir=/usr/share/hwdata

make
make install
install -dm755 /usr/share/hwdata
wget http://www.linux-usb.org/usb.ids -O /usr/share/hwdata/usb.ids
rm -rf /sources/usbutils-017

