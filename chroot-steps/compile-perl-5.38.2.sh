#!/usr/bin/env bash
set -e
cd /sources

rm -rf perl-5.38.2
tar -xvf perl-5.38.2.tar.xz
cd perl-5.38.2
export BUILD_ZLIB=False
export BUILD_BZIP2=0
sh Configure -des \
	-Dprefix=/usr \
	-Dvendorprefix=/usr \
	-Duseshrplib \
	-Dprivlib=/usr/lib/perl5/5.38/core_perl \
	-Darachlib=/usr/lib/perl5/5.38/core_perl \
	-Dsitelib=/usr/lib/perl5/5.38/site_perl \
	-Dsitearch=/usr/lib/perl5/5.38/site_perl \
	-Dvendorlib=/usr/lib/perl5/5.38/vendor_perl \
	-Dvendorarch=/usr/lib/perl5/5.38/vendor_perl \
	-Dman1dir=/usr/share/man/man1 \
	-Dman3dir=/usr/share/man/man3 \
	-Dpager="/usr/bin/less -isR" \
	-Dusethreads

make
#TEST_JOBS=$(nproc) make test_harness
make install
unset BUILD_ZLIB BUILD_BZIP2
rm -rf /sources/perl-5.38.2

