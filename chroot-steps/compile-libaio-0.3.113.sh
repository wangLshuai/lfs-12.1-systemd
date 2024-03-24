#!/usr/bin/env bash
set -e
cd /sources

rm -rf libaio-0.3.113
tar -xvf libaio-0.3.113.tar.gz
cd libaio-0.3.113
sed -i '/install.*libaio.a/s/^/#/' src/Makefile
make
make install
rm -rf /sources/libaio-0.3.113

