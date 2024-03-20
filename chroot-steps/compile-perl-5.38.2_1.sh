#!/usr/bin/env bash
set -e
cd /sources

rm -rf perl-5.38.2
tar -xvf perl-5.38.2.tar.xz
cd perl-5.38.2

sh Configure -des \
	-Dprefix=/usr \
	-Dvendorprefix=/usr \
	-Duseshrplib \
	-Dprivlib=/usr/lib/perl5/5.38/core_perl \
	-Darachlib=/usr/lib/perl5/5.38/core_perl \
	-Dsitelib=/usr/lib/perl5/5.38/site_perl \
	-Dsitearch=/usr/lib/perl5/5.38/site_perl \
	-Dvendorlib=/usr/lib/perl5/5.38/vendor_perl \
	-Dvendorarch=/usr/lib/perl5/5.38/vendor_perl

make
make install
rm -rf /sources/perl-5.38.2

