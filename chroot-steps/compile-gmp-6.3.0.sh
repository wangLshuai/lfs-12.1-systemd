#!/usr/bin/env bash
set -e
cd /sources

rm -rf gmp-6.3.0
tar -xvf gmp-6.3.0.tar.xz
cd gmp-6.3.0

./configure --prefix=/usr \
	--enable-cxx \
	--disable-static \
	--docdir=/usr/share/doc/gmp-6.3.0
make
make html
set +e
echo "do not test" || make check 2>&1 | tee gmp-check-log
set -e
#awk '/# PASS:/{total+$3}; END{print total}' gmp-check-log
make install
make install-html
rm -rf /sources/gmp-6.3.0

