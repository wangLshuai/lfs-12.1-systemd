#!/usr/bin/env bash
set -e
cd /sources

rm -rf procps-ng-4.0.4
tar -xvf procps-ng-4.0.4.tar.xz
cd procps-ng-4.0.4

./configure --prefix=/usr \
	--docdir=/usr/share/doc/procps-ng-4.0.4 \
	--disable-static \
	--disable-kill \
	--with-systemd

make src_w_LDADD='$(LDADD) -lsystemd'
echo "do not test" || make -k check
make install
rm -rf /sources/procps-ng-4.0.4

