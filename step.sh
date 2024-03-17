#!/usr/bin/env bash
#run in ubuntu-docker
if [ ! "$HOSTNAME" = "lfs-docker" ];then
	echo "run this script in lfs-docker"
fi
steps/remove-disk.sh
steps/disk.sh
steps/part-disk.sh
steps/mount.sh
steps/link-source.sh

export MAKEFLAGS=-j`nproc`
./steps/compile-binutils-2.42_1.sh
./steps/compile-gcc-13.2.0_1.sh



