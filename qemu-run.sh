#!/usr/bin/bash
./steps/remove-disk.sh
mkdir -p share
ip tuntap add dev tap0 mode tap
ip addr add 192.168.55.1/24 dev tap0
ip link set tap0 up
qemu-system-x86_64 -m 1024M -smp 2 -cpu Haswell -machine q35 --enable-kvm -drive if=pflash,format=raw,unit=0,file=/usr/share/OVMF/OVMF_CODE.fd,readonly=on -drive if=pflash,format=raw,unit=1,file=/usr/share/OVMF/OVMF_VARS.fd,readonly=on  -hda sda.raw -nographic  -fsdev local,id=fs0,security_model=passthrough,path=./share -device virtio-9p-pci,fsdev=fs0,mount_tag=myshare -net nic -net tap,ifname=tap0,script=no,downscript=no
