#!/bin/env bash
# https://lfs.xry111.site/zh_CN/12.1-systemd/wget-list-systemd
rev wget-list-systemd |cut -d '/' -f 1 |rev |sed 's@^@https://mirrors.ustc.edu.cn/lfs/lfs-packages/12.1-rc1/@g' > wget-list-systemd.mirror
wget --input-file=wget-list-systemd.mirror --continue --directory-prefix=./sources
wget https://lfs.xry111.site/zh_CN/12.1-systemd/md5sums --continue --directory-prefix=./sources
wget https://unifoundry.com/pub/unifont/unifont-15.1.04/font-builds/unifont-15.1.04.pcf.gz  --continue --directory-prefix=./sources
wget https://downloads.sourceforge.net/freetype/freetype-2.13.2.tar.xz --continue --directory-prefix=./sources  
wget https://pagure.io/libaio/archive/libaio-0.3.113/libaio-0.3.113.tar.gz --continue --directory-prefix=./sources
wget https://sourceware.org/ftp/lvm2/LVM2.2.03.23.tgz --continue --directory-prefix=./sources
pushd sources
md5sum -c md5sums
echo "72f95e7ecb47a4c7ed610babe6959ead  unifont-15.1.04.pcf.gz" | md5sum -c
echo "1f625f0a913c449551b1e3790a1817d7  freetype-2.13.2.tar.xz" | md5sum -c
echo "605237f35de238dfacc83bcae406d95d  libaio-0.3.113.tar.gz" | md5sum -c
echo "0535b5e638b6f0b48f7b259e0ec0ba65  LVM2.2.03.23.tgz" | md5sum -c
popd

