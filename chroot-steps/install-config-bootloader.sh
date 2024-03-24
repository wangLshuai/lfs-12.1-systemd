#!/usr/bin/env bash
set -e
grub-install --target=x86_64-efi --removable
device=`findmnt / |sed -n '2p' | awk '{print $2}'`
idFiled=`blkid $device  | awk '{for( i=1;i<=NF;i++) if ($i ~ /^UUID=/) print $i}' `
uuid=${idFiled#*=}
cat > /boot/grub/grub.cfg << EOF
set default=0
set timeout=5

insmod part_gpt
insmod ext2
search --no-floppy --fs-uuid --set=root $uuid

insmod all_video
if loadfont /boot/grub/fonts/unicode.pf2; then
 terminal_output gfxterm
fi

menuentry "GNU/Linux, Linux 6.7.4-lfs-12.1" {
	linux /boot/vmlinuz root=UUID=$uuid ro

}
menuentry "Firmware Setup" {
	fwsetup
}
EOF

