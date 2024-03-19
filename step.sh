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
steps/cp-source.sh
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
./steps/compile-coreutils-9.4_1.sh
./steps/compile-diffutils-3.10_1.sh
./steps/compile-file-5.45_1.sh
./steps/compile-findutils-4.9.0_1.sh
./steps/compile-gawk-5.3.0_1.sh
./steps/compile-grep-3.11_1.sh
./steps/compile-gzip-1.13_1.sh
./steps/compile-make-4.4.1_1.sh
./steps/compile-patch-2.7.6_1.sh
./steps/compile-sed-4.9_1.sh
./steps/compile-tar-1.35_1.sh
./steps/compile-xz-5.46_1.sh
./steps/compile-binutils-2.42_2.sh
./steps/compile-gcc-13.2.0_2.sh
./steps/ready-chroot-env.sh
cp chroot-step.sh "$LFS"
cp -rf chroot-steps "$LFS"
# chroot
chroot "$LFS" /usr/bin/env -i \
	HOME=/root \
	TERM="$TERM" \
	PS1='(lfs chroot) \u:\w\$ ' \
	PATH=/usr/bin:/usr/sbin \
	MAKEFLAGS="-j$(nproc)" \
	TESTSUITEFLAGS="-j$(nproc)" \
	/chroot-step.sh
