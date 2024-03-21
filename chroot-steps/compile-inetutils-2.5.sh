#!/usr/bin/env bash
set -e
cd /sources

rm -rf inetutils-2.5
tar -xvf inetutils-2.5.tar.xz
cd inetutils-2.5

./configure --prefix=/usr \
	--bindir=/usr/bin \
	--localstatedir=/var \
	--disable-logger \
	--disable-whois \
	--disable-rcp \
	--disable-rexec \
	--disable-rlogin \
	--disable-rsh \
	--disable-servers

make
set +e
make check
set -e
make install
mv -v /usr/{,s}bin/ifconfig
rm -rf /sources/inetutils-2.5

