#!/usr/bin/env bash
set -e
cd /sources

rm -rf intltool-0.51.0
tar -xvf intltool-0.51.0.tar.gz
cd intltool-0.51.0
sed -i 's:\\\${:\\\$\\{:' intltool-update.in
./configure --prefix=/usr

make
echo "do not test" || make check
make install
install -v -Dm644 doc/I18N-HOWTO /usr/share/doc/intltool-0.51.0/I18N-HOWTO
rm -rf /sources/intltool-0.51.0

