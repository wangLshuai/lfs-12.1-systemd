#!/usr/bin/env bash
set -e
cd /sources

rm -rf make-4.4.1
tar -xvf make-4.4.1.tar.gz
cd make-4.4.1

./configure --prefix=/usr

make
chown -R tester .
su tester -c "PATH=$PATH make check"
make install
rm -rf /sources/make-4.4.1

