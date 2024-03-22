#!/usr/bin/env bash
set -e
cd /sources

rm -rf grub-2.12
tar -xvf grub-2.12.tar.xz
cd grub-2.12
unset {C,CPP,CXX,LD}FLAGS
echo depends bli part_gpt > grub-core/extra_deps.lst

./configure --prefix=/usr \
	--sysconfdir=/etc \
	--disable-eriemu \
	--disable-werror

make
make install
mv -v /etc/bash_completion.d/grub /usr/share/bash-completion/completions
rm -rf /sources/grub-2.12

