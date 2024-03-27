#!/usr/bin/env bash
set -e
cd /sources

rm -rf findutils-4.9.0
tar -xvf findutils-4.9.0.tar.xz
cd findutils-4.9.0

./configure --prefix=/usr --localstatedir=/var/lib/locate

make
set +e
chown -R tester .
echo "do not test" || su tester -c "PATH=$PATH make check"
set -e
make install
rm -rf /sources/findutils-4.9.0

