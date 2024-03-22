#!/usr/bin/env bash
set -e
cd /sources

rm -rf gawk-5.3.0
tar -xvf gawk-5.3.0.tar.xz
cd gawk-5.3.0
sed -i 's/extras//' Makefile.in
./configure --prefix=/usr

make
chown -R tester .
su tester -c "PATH=$PATH make check"
rm -f /usr/bin/gawk-5.3.0
make install
rm -rf /sources/gawk-5.3.0

