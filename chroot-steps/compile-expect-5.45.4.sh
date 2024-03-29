#!/usr/bin/env bash
set -e
cd /sources

python3 -c 'from pty import spawn; spawn(["echo","ok"])'
rm -rf expect5.45.4
tar -xvf expect5.45.4.tar.gz
cd expect5.45.4

./configure --prefix=/usr \
	--with-tcl=/usr/lib \
	--enable-shared \
	--mandir=/usr/share/man \
	--with-tclinclude=/usr/include

make
echo "do not test " || make test
make install
ln -svf expect5.45.4/libexpect5.45.4.so /usr/lib
rm -rf /sources/expect5.45.4

