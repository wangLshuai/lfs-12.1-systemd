#!/usr/bin/env bash
set -e
mkdir -pv $LFS/{etc,var} $LFS/usr/{bin,lib,sbin}

for i in bin lib sbin; do
    ln -sfv $LFS/usr/$i $LFS/
done
mkdir -pv $LFS/tools

case $(uname -m) in
    x86_64) mkdir -pv $LFS/lib64 ;;
esac

groups |grep lfs || groupadd lfs
users |grep lfs || useradd -s /bin/bash -g lfs -m -k /dev/null lfs
chown -v lfs $LFS/{usr{,/*},lib,var,etc,bin,sbin,tools}
case $(uname -m) in
    x86_64) chown -v lfs $LFS/lib64 ;;
esac

