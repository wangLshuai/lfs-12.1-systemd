#!/usr/bin/env bash
set -e
findmnt ${LFS}/dev/shm && umount ${LFS}/dev/shm
findmnt ${LFS}/dev/pts && umount ${LFS}/dev/pts
findmnt ${LFS}/dev && umount ${LFS}/dev
findmnt ${LFS}/proc && umount ${LFS}/proc
findmnt ${LFS}/sys && umount ${LFS}/sys
findmnt ${LFS}/run && umount ${LFS}/run
findmnt ${LFS}/tmp && umount ${LFS}/tmp
findmnt ${LFS}/boot/efi && umount ${LFS}/boot/efi
findmnt ${LFS} && umount ${LFS}
device=`losetup |grep /lfs/sda.raw | awk '{print $1}'`
if [ ! -z "$device" ];then
    kpartx -dv "$device"
    losetup -d "$device"
fi

