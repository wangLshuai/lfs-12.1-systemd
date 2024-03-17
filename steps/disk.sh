#!/usr/bin/env bash
#set -x
set -e
losetup |grep /lfs/sda.raw && exit 0
dd if=/dev/zero of=sda.raw bs=1G seek=30 count=0
loop=`losetup -f`
num=`echo $loop | sed 's@/dev/loop@@'`
if [ ! -e $loop ]; then
	mknod $loop b 7 $num
fi
losetup $loop sda.raw
