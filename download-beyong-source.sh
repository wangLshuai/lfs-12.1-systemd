#!/bin/env bash
# 

wget https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-9.6p1.tar.gz --continue --directory-prefix=./sources

pushd sources
echo "5e90def5af3ffb27e149ca6fff12bef3  openssh-9.6p1.tar.gz" | md5sum -c
popd

