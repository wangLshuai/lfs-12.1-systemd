#!/usr/bin/env bash
set -e
cd /sources

rm -rf zstd-1.5.5
tar -xvf zstd-1.5.5.tar.gz
cd zstd-1.5.5

make prefix=/usr
echo "do not test" || make check
make prefix=/usr install
rm -v /usr/lib/libzstd.a
rm -rf /sources/zstd-1.5.5

