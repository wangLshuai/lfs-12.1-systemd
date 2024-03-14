#!/bin/env bash
# https://lfs.xry111.site/zh_CN/12.1-systemd/wget-list-systemd
rev wget-list-systemd |cut -d '/' -f 1 |rev |sed 's@^@https://mirrors.ustc.edu.cn/lfs/lfs-packages/12.1-rc1/@g' > wget-list-systemd.mirror
wget --input-file=wget-list-systemd.mirror --continue --directory-prefix=./sources
wget https://lfs.xry111.site/zh_CN/12.1-systemd/md5sums --continue --directory-prefix=./sources
pushd sources
md5sum -c md5sums
popd

