#!/usr/bin/env bash
set -e
mkdir -pv $LFS/{etc,var} $LFS/usr/{bin,lib,sbin}

for i in bin lib sbin; do
    ln -sfv usr/$i $LFS/$i
done
mkdir -pv $LFS/tools

case $(uname -m) in
    x86_64) mkdir -pv $LFS/lib64 ;;
esac

# 并不必需lfs用户，直接使用root build 也可以
grep lfs /etc/group || groupadd lfs
grep lfs /etc/passwd || useradd -s /bin/bash -g lfs -m -k /dev/null lfs
chown -v lfs $LFS/{usr{,/*},lib,var,etc,bin,sbin,tools}
case $(uname -m) in
    x86_64) chown -v lfs $LFS/lib64 ;;
esac

