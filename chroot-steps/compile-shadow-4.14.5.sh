#!/usr/bin/env bash
set -e
cd /sources

rm -rf shadow-4.14.5
tar -xvf shadow-4.14.5.tar.xz
cd shadow-4.14.5
sed -i 's/groups$(EXEEXT) //' src/Makefile.in
find man -name Makefile.in -exec sed -i 's/groups\.1 / /' {} \;
find man -name Makefile.in -exec -i 's/getspnam\.3 / /' {} \;
find man -name Makefile.in -exec -i 's/passwd\.5 / /' {} \;
sed -e 's:#ENCRYPT_METHOD DES:ENCRYPT_METHOD YESCRYPT:' \
	-e 's@/var/spool/mail@/var/mail@' \
	-e '/PATH=/{s@/sbin:@@;s@/bin:@@}' \
	-i etc/login.defs
sed -i 's:DICTPATH.*:DICTPATH\t/lib/cracklib/pw_dict:' etc/login.defs
touch /usr/bin/passwd
./configure --sysconfdir=/etc \
	--disable-static \
	--with-{b,yes}crypt \
	--without-libbsd \
	--with-group-name-max-length=32

make
make exec_prefix=/usr install
make -C man install-man
pwconv
grpconv
mkdir -p /etc/default
useradd -D --gid 999
echo "root:root"| chpasswd
rm -rf /sources/shadow-4.14.5

