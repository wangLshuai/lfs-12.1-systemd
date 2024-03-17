#!/usr/bin/env bash
mount|grep  "${LFS}/boot/efi " && umount ${LFS}/boot/efi
mount|grep  "${LFS} " && umount ${LFS}
device=`losetup |grep /lfs/sda.raw | awk '{print $1}'`
if [ ! -z "$device" ];then
    kpartx -dv "$device"
    losetup -d "$device"
fi

