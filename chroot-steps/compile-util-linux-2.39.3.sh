#!/usr/bin/env bash
set -e
cd /sources

rm -rf util-linux-2.39.3
tar -xvf util-linux-2.39.3.tar.xz
cd util-linux-2.39.3
sed -i '/test_mkfds/s/^/#/' tests/helpers/Makemodule.am
./configure --bindir=/usr/bin \
	--libdir=/usr/lib \
	--runstatedir=/run \
	--sbindir=/usr/sbin \
	--disable-chfn-chsh \
	--disable-login \
	--disable-su \
	--disable-setpriv \
	--disable-runuser \
	--disable-pylibmount \
	--disable-static \
	--without-python \
	ADJTIME_PATH=/var/lib/hwclock/adjtime \
	--docdir=/usr/share/doc/util-linux-2.39.3

make
chown -R tester .
echo "do not test" || su tester -c "make -k check"
make install
rm -rf /sources/util-linux-2.39.3

