#!/usr/bin/env bash
set -e
cd /sources

rm -rf XML-Parser-2.47
tar -xvf XML-Parser-2.47.tar.gz
cd XML-Parser-2.47

perl Makefile.PL
make
echo "do not test " || make test
make install
rm -rf /sources/XML-Parser-2.47

