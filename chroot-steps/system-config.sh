#!/usr/bin/env bash
# network
#systemctl disable systemd-network-wait-online
ln -sf /dev/null /etc/systemd/network/99-default.link
#cat > /etc/systemd/network/10-ether0.link << EOF
#[Match]
#MACAddress=
#
#[Link]
#Name=ether0
#EOF

cat > /etc/systemd/network/10-eth-dhcp.network << "EOF"
[Match]
Name=eth0

[Network]
DHCP=ipv4
UserDomains=true
EOF

cat > /etc/resolv.conf << EOF
search DHCP HOST
nameserver 192.168.1.1
nameserver 8.8.8.8
nameserver 4.4.4.4

EOF

echo "<lfs>" > /etc/hostname

cat > /etc/hosts << EOF
::1 ip6-localhost ip6-loopback
127.0.0.1 localhost

EOF

# system hw clock is local 
# timedateclt set-local-rtc 1
cat > /etc/adjtime << EOF
0.0 0 0.1
0
LOCAL
EOF

# timedatectl set-time YYYY-MM-DD HH:MM:SS
# timedatectl set-timezone TIMEZONE
# timedatectl list-timezones

# linux vconsole
echo FONT=Lat2-Terminus16 > /etc/vconsole.conf
#localctl set-keymap us

# locale
#locale -a
cat > /etc/locale.conf << "EOF"
LANG=en_US.UTF-8
EOF
cat > /etc/profile << "EOF"
for i in $(locale); do
	unset ${i%=*}
done

if [[ "$TERM" = linux ]];then
	export LANG=C.UTF-8
else
	source /etc/locale.conf
	
	for i in $(locale); do
	key=${i%=*}
		if [[ -v $key ]]; then
			export $key
		fi
	done
fi
EOF

cat > /etc/inputrc << EOF
# allow the comman prompt to wrap to next line
set horizontal-scroll-mode Off

# Enable 8-bit input
set meta-flag On
set input-meta On

# Truns off 8th bit stripping
set convert-meta Off

# Keep the 8th bit for display
set output-meta On

# none, visible or audible
set bell-style none

# All of the following map the escape sequence of the value
# contained in the 1st argument to the readline specific functions
"\e0d": backward-word
"\e0c": forward-word

# for linux console
"\e[1~": beginning-of-line
"\e[4~": end-of-line
"\e[5~": beginning-of-history
"\e[6~": end-of-history

# for xterm
"\e0H": beginning-of-line
"\e0F": end-of-line

# for Konsole
"\e[H": beginning-of-line
"\e[F": end-of-line

# End /etc/inputrc
EOF

cat > /etc/shells << EOF
/bin/sh
/bin/bash
EOF

# systemd
mkdir -pv /etc/systemd/system/getty@tty1.service.d

cat > /etc/systemd/system/getty@tty1.service.d/noclear.conf << EOF
[Service]
TTYVTDisallocate=no
EOF

# not mount /tmp
# ln -sfv /dev/null /etc/systemd/sysstem/tmp.mount
device=`findmnt / |sed -n '2p' | awk '{print $2}'`
idFiled=`blkid $device  | awk '{for( i=1;i<=NF;i++) if ($i ~ /^UUID=/) print $i}' `
uuid=${idFiled#*=}
cat > /etc/fstab << EOF
/dev/sda2 / ext4 default 1 1
EOF
