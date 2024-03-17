#!/usr/bin/env bash
set -e
device=`losetup -l |grep /lfs/sda.raw |awk '{print $1}'`
if [ ! -z "$1" ]; then
	device=$1
fi
if [ -z "$device" ]; then
	echo "no disk"
	exit 1
fi
# 使用parted进行分区操作
parted_table=`fdisk -l $device` 

echo "$parted_table" | grep "gpt" || needgpt=1
if [ ! -z "$needgpt" ];then
	echo "create gpt table"
	parted -s $device mklabel gpt  # 创建GPT分区表
fi

echo "$parted_table" | grep "EFI System" || needefi=1
if [  ! -z "$needefi" ];then
	echo "create esp"
	parted -s $device mkpart ESP fat32 1MiB 31MiB  # 创建30MiB的ESP分区
	parted -s $device set 1 boot on
fi

echo "$parted_table" | grep "Linux filesystem" || needext=1
if [  ! -z "$needext" ];then
	echo "create ext4"
	parted -s $device mkpart primary 31MiB 100%  # 创建剩余空间的主分区
fi
