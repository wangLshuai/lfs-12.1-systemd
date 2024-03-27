#!/usr/bin/bash
./steps/remove-disk.sh
qemu-system-x86_64 -m 1024M -smp 2 --enable-kvm -drive if=pflash,format=raw,unit=0,file=/usr/share/OVMF/OVMF_CODE.fd,readonly=on -drive if=pflash,format=raw,unit=1,file=/usr/share/OVMF/OVMF_VARS.fd,readonly=on  -hda sda.raw  -nographic
