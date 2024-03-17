#!/usr/bin/env bash
set -e
device=`losetup |grep /lfs/sda.raw | awk '{print $1}'`
echo $device
kpartx -av $device

part1=`echo ${device}p1|sed 's@/dev@/dev/mapper@'`
fstype=`blkid $part1 |awk '{ for (i=1; i<=NF;i++) if ($i ~ /^TYPE=/) print $i}'`
echo $part1 $fstype
if [ ! "$fstype" = "TYPE=\"vfat\"" ];then
	mkfs.vfat $part1
fi

part2=`echo ${device}p2|sed 's@/dev@/dev/mapper@'`
fstype=`blkid $part2 |awk '{ for (i=1; i<=NF;i++) if ($i ~ /TYPE/) print $i}'`
echo $part2 $fstype
if [ ! "$fstype" = "TYPE=\"ext4\"" ];then
	mkfs.ext4 $part2
fi

mkdir -p $LFS
mount |grep ${part2} || needmountpart2=1
if [ ! -z "$needmountpart2"  ];then
	mount ${part2}  $LFS
fi
mount |grep ${part1} || needmountpart1=1
if [ ! -z "$needmountpart1" ];then
	mkdir -p ${LFS}/boot/efi
	mount ${part1} ${LFS}/boot/efi
fi

