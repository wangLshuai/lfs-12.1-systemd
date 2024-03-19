#!/usr/bin/env bash
set -e
cd /sources
rm -rf gettext-0.22.4
tar -xvf gettext-0.22.4.tar.xz
cd gettext-0.22.4

./configure --disable-shared

make
cp -v gettext-tools/src/{msgfmt,msgmerge,xgettext} /usr/bin
rm -rf $LFS/sources/gettext-0.22.4

