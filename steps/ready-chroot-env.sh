#!/usr/bin/env bash
chown -R root:root $LFS/{usr,lib,var,etc,bin,sbin,tools}
case $(uname -m) in
	x86_64) chown -R root:root $LFS/lib64 ;;
esac

mkdir -pv $LFS/{dev,proc,sys,run,tmp}
findmnt $LFS/dev || mount -v --bind /dev $LFS/dev
findmnt $LFS/dev/pts || mount -vt devpts devpts -o gid=5,mode=0620 $LFS/dev/pts
chmod 666 /dev/pts/ptmx
findmnt $LFS/proc || mount -vt proc proc $LFS/proc
findmnt $LFS/sys || mount -vt sysfs sysfs $LFS/sys
findmnt $LFS/run || mount -vt tmpfs tmpfs $LFS/run
findmnt $LFS/tmp || mount -vt tmpfs tmpfs $LFS/tmp

if [ -h $LFS/dev/shm ]; then
	install -v -d -m 1777 $LFS$(realpath /dev/shm)
else
	findmnt $LFS/dev/shm || mount -vt tmpfs -o nosuid,nodev tmpfs $LFS/dev/shm
fi

