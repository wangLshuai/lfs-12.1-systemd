#!/usr/bin/env bash
set -e
cd /beyong-sources

rm -rf hwdata-0.385
tar -xvf hwdata-0.385.tar.gz
cd hwdata-0.385

./configure --prefix=/usr --disable-blacklist

make install
rm -rf /beyong-sources/hwdata-0.385

