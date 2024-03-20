#!/usr/bin/env bash
set -e
cd /sources

rm -rf man-pages-6.06
tar -xvf man-pages-6.06.tar.xz
cd man-pages-6.06
rm -v man3/crypt*

make prefix=/usr install
rm -rf /sources/man-pages-6.06

