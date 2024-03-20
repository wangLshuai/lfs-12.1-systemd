#!/usr/bin/env bash
set -e
cd /sources

rm -rf iana-etc-20240125
tar -xvf iana-etc-20240125.tar.gz
cd iana-etc-20240125
cp services protocols /etc
rm -rf /sources/iana-etc-20240125

