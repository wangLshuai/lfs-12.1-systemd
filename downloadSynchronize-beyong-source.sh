#!/bin/env bash
#!/usr/bin/env bash
#run in ubuntu-docker
set -e
if [ ! "$HOSTNAME" = "lfs-docker" ];then
    echo "run this script in lfs-docker"
    exit 1
fi
wget https://ftp.gnu.org/gnu/wget/wget-1.21.4.tar.gz --continue --directory-prefix=./beyong-sources
wget https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-9.6p1.tar.gz --continue --directory-prefix=./beyong-sources
wget  https://github.com/libusb/libusb/releases/download/v1.0.27/libusb-1.0.27.tar.bz2 --continue --directory-prefix=./beyong-sources
wget https://kernel.org/pub/linux/utils/usb/usbutils/usbutils-017.tar.xz --continue --directory-prefix=./beyong-sources
wget https://github.com/lsof-org/lsof/releases/download/4.99.0/lsof-4.99.0.tar.gz --continue --directory-prefix=./beyong-sources

pushd beyong-sources
echo "e7f7ca2f215b711f76584756ebd3c853 wget-1.21.4.tar.gz" | md5sum -c
echo "5e90def5af3ffb27e149ca6fff12bef3  openssh-9.6p1.tar.gz" | md5sum -c
echo "8ff21441faf2e8128e4810b3d6e49059  usbutils-017.tar.xz"  | md5sum -c
echo "1fb61afe370e94f902a67e03eb39c51f  libusb-1.0.27.tar.bz2" |md5sum -c
echo "8c858675f6d6e137df9b4e26ad6c46e8  lsof-4.99.0.tar.gz" | md5sum -c
popd

steps/remove-disk.sh
steps/disk.sh
steps/part-disk.sh
steps/mount.sh
cp -rf beyong-sources "$LFS"
cp beyong-lfs-step.sh "$LFS"
cp -rf beyong-lfs-steps "$LFS"
steps/remove-disk.sh