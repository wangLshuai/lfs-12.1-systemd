#!/usr/bin/env bash
#run in ubuntu-docker
set -e
if [ ! "$HOSTNAME" = "lfs-docker" ];then
	echo "run this script in lfs-docker"
fi
steps/remove-disk.sh
steps/disk.sh
steps/part-disk.sh
steps/mount.sh
steps/link-source.sh
steps/lfs-dir-user.sh

set +h
export MAKEFLAGS=-j`nproc`
export PATH=$PATH:$LFS/tools/bin
export CONFIG_SITE=$LFS/usr/share/config.site
./steps/compile-binutils-2.42_1.sh
./steps/compile-gcc-13.2.0_1.sh
./steps/export-linux-6.7.4-header.sh
./steps/compile-glib-2.39.sh
