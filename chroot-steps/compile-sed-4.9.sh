#!/usr/bin/env bash
set -e
cd /sources

rm -rf sed-4.9
tar -xvf sed-4.9.tar.xz
cd sed-4.9

./configure --prefix=/usr \

make
make html 
chown -R tester .
set +e
echo "do not test" || su tester -c "PATH=$PATH make check"
set -e
make install
install -d -m755 /usr/share/doc/sed-4.9
install -m644 doc/sed.html /usr/share/doc/sed-4.9
rm -rf /sources/sed-4.9

