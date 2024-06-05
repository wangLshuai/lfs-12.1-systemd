#!/usr/bin/env bash
set -e
cd /beyong-sources

rm -rf libusb-1.0.27
tar -xvf libusb-1.0.27.tar.bz2 
cd libusb-1.0.27

./configure --prefix=/usr --disable-static 

make
make install
rm -rf /beyong-sources/libusb-1.0.27

