#!/usr/bin/env bash
set -e
cd /sources

rm -rf e2fsprogs-1.47.0
tar -xvf e2fsprogs-1.47.0.tar.gz
cd e2fsprogs-1.47.0

mkdir build
cd build
../configure --prefix=/usr \
	--sysconfdir=/etc \
	--enable-elf-shlibs \
	--disable-libblkid \
	--disable-libuuid \
	--disable--uuidd \
	--disable-fsck

make
echo "do not test" || make check
make install
rm -fv /usr/lib/{libcom_err,libe2p,libext2fs,libss}.a
gunzip -v /usr/share/info/libext2fs.info.gz
install-info --dir-file=/usr/share/info/dir /usr/share/info/libext2fs.info
makeinfo -o doc/com_err.info ../lib/et/com_err.texinfo
install -v -m644 doc/com_err.info /usr/share/info
install-info --dir-file=/usr/share/info/dir /usr/share/info/com_err.info
sed 's/metadata_csum_seed,//' -i /etc/mke2fs.conf
rm -rf /sources/e2fsprogs-1.47.0

