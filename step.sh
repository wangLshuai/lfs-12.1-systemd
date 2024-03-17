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
./steps/compile-libstdc++.sh

# chapter 6
./steps/compile-m4-1.4.19_1.sh
./steps/compile-ncurses-6.4-20230520_1.sh
./steps/compile-bash-5.2.21_1.sh
./steps/compile-diffutils-3.10_1.sh
./steps/compile-file-5.45_1.sh
./steps/compile-findutils-4.9.0_1.sh
./steps/compile-gawk-5.3.0_1.sh
