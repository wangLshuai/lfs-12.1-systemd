#!/usr/bin/env bash
set -e
cd /sources

rm -rf LVM2.2.03.23
tar -xvf LVM2.2.03.23.tgz
cd LVM2.2.03.23
PATH+=:/usr/sbin

./configure --prefix=/usr \
	--enable-cmdlib \
	--enable-pkgconfig \
	--enable-udev_sync
make
make -C tools install_tools_dynamic
make -C udev install
make -C libdm install
rm -rf /sources/LVM2.2.03.23

