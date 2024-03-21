#!/usr/bin/env bash
set -e
cd /sources

rm -rf bash-5.2.21
tar -xvf bash-5.2.21.tar.gz
cd bash-5.2.21

./configure --prefix=/usr \
	--without-bash-malloc \
	--with-installed-readline \
	--docdir=/usr/share/doc/bash-5.2.21
make
chown -R tester .
chmod 666 /dev/pts/ptmx
su -s /usr/bin/expect tester << "EOF"
set timout -1
spawn make tests
expect eof
EOF
make install
#exec /usr/bin/bash --login
rm -rf /sources/bash-5.2.21

