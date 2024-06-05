#!/usr/bin/env bash
set -e
cd /beyong-sources

rm -rf wget-1.21.4
tar -xvf wget-1.21.4.tar.gz
cd wget-1.21.4

./configure --prefix=/usr \
            --sysconfdir=/etc \
            --with-ssl=openssl

make
make install
rm -rf /beyong-sources/wget-1.21.4

