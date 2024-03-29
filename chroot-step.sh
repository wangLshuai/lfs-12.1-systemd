#!/usr/bin/env bash
set -e
mkdir -pv /{boot,home,mnt,opt,srv}
mkdir -pv /etc{opt,sysconfig}
mkdir -pv /media{floppy,cdrom}
mkdir -pv /usr/{,local/}{include,src}
mkdir -pv /usr/{,local/}share/{color,dict,doc,info,local,man}
mkdir -pv /usr/{,local/}share/{misc,terminfo,zoneinfo}
mkdir -pv /usr/{,local/}share/man/man{1..8}
mkdir -pv /var/{cache,local,log,mail,opt,spool}
mkdir -pv /var/lib/{color,misc,locate}

ln -sfv /run /var/run
ln -sfv /run/lock /var/lock

install -dv -m 0750 /root
install -dv -m 1777 /tmp /var/tmp

ln -sfv /proc/self/mounts /etc/mtab
cat > /etc/hosts << EOF
127.0.0.1 localhost ${hostname}
::1 localhost
EOF

cat > /etc/passwd << "EOF"
root:x:0:0:root:/root:/bin/bash
bin:x:1:1:bin:/dev/null:/usr/bin/false
daemon:x:6:6:Daemon User:/dev/null:/usr/bin/false
messagebus:x:18:18:D-Bus Message Daemon User:/run/dbus:/usr/bin/false
systemd-journal-gateway:x:73:73:systemd Journal Gateway:/:/usr/bin/false
systemd-journal-remote:x:74:74:systemd Journal Remote:/:/usr/bin/false
systemd-journal-upload:x:75:75:systemd Journal Upload:/:/usr/bin/false
systemd-network:x:76:76:systemd Network Management:/:/usr/bin/false
systemd-resolve:x:77:77:systemd Resolver:/:/usr/bin/false
systemd-timesync:x:78:78:systemd Time Synchronization:/:/usr/bin/false
systemd-coredump:x:79:79:systemd Core Dumper:/:/usr/bin/false
uuidd:x:80:80:UUID Generation Daemon User:/dev/null:/usr/bin/false
systemd-oom:x:81:81:systemd Out Of Memory Daemon:/:/usr/bin/false
nobody:x:65534:65534:Unprivileged User:/dev/null:/usr/bin/false
EOF

cat > /etc/group << "EOF"
root:x:0:
bin:x:1:daemon
sys:x:2:
kmem:x:3:
tape:x:4:
tty:x:5:
daemon:x:6:
floppy:x:7:
disk:x:8:
lp:x:9:
dialout:x:10:
audio:x:11:
video:x:12:
utmp:x:13:
cdrom:x:15:
adm:x:16:
messagebus:x:18:
systemd-journal:x:23:
input:x:24:
mail:x:34:
kvm:x:61:
systemd-journal-gateway:x:73:
systemd-journal-remote:x:74:
systemd-journal-upload:x:75:
systemd-network:x:76:
systemd-resolve:x:77:
systemd-timesync:x:78:
systemd-coredump:x:79:
uuidd:x:80:
systemd-oom:x:81:
wheel:x:97:
users:x:999:
nogroup:x:65534:
EOF

echo "tester:x:101:101::/home/tester:/bin/bash" >> /etc/passwd
echo "tester:x:101:" >> /etc/group
install -o tester -d /home/tester

touch /var/log/{btmp,lastlog,faillog,wtmp}
chgrp -v utmp /var/log/lastlog
chmod -v 664  /var/log/lastlog
chmod -v 600  /var/log/btmp

/chroot-steps/compile-gettext-0.22.4.sh
/chroot-steps/compile-bison-3.8.2_1.sh
/chroot-steps/compile-perl-5.38.2_1.sh
/chroot-steps/compile-python-3.12.2_1.sh
/chroot-steps/compile-textinfo-7.1_1.sh
/chroot-steps/compile-util-linux-2.39.3_1.sh

rm -rf /usr/share/{info,man,doc}/*
find /usr/{lib,libexec} -name \*.la -delete
rm -rf /tools
/chroot-steps/compile-man-pages-6.06_1.sh
/chroot-steps/copy-iana-etc-20240125.sh
/chroot-steps/compile-glibc-2.39_2.sh
/chroot-steps/compile-zlib-1.3.1.sh
/chroot-steps/compile-bzip2-1.0.8.sh
/chroot-steps/compile-xz-5.4.6.sh
/chroot-steps/compile-zstd-1.5.5.sh
/chroot-steps/compile-file-5.45.sh
/chroot-steps/compile-readline-8.2.sh
/chroot-steps/compile-m4-1.4.19.sh
/chroot-steps/compile-bc-6.7.5.sh
/chroot-steps/compile-flex-2.6.4.sh
/chroot-steps/compile-tcl-8.6.13.sh
/chroot-steps/compile-expect-5.45.4.sh
/chroot-steps/compile-dejagnu-1.6.3.sh
/chroot-steps/compile-pkgconf-2.1.1.sh
/chroot-steps/compile-binutils-2.42.sh
/chroot-steps/compile-gmp-6.3.0.sh
/chroot-steps/compile-mpfr-4.2.1.sh
/chroot-steps/compile-mpc-1.3.1.sh
/chroot-steps/compile-attr-2.5.2.sh
/chroot-steps/compile-acl-2.3.2.sh
/chroot-steps/compile-libcap-2.69.sh
/chroot-steps/compile-libxcrypt-4.4.36.sh
/chroot-steps/compile-shadow-4.14.5.sh
/chroot-steps/compile-gcc-13.2.0.sh
/chroot-steps/compile-ncurses-6.4-20230520.sh
/chroot-steps/compile-sed-4.9.sh
/chroot-steps/compile-psmisc-23.6.sh
/chroot-steps/compile-gettext-0.22.4_2.sh
/chroot-steps/compile-bison-3.8.2.sh
/chroot-steps/compile-grep-3.11.sh
/chroot-steps/compile-bash-5.2.21.sh
/chroot-steps/compile-libtool-2.4.7.sh
/chroot-steps/compile-gdbm-1.23.sh
/chroot-steps/compile-gperf-3.1.sh
/chroot-steps/compile-expat-2.6.0.sh
/chroot-steps/compile-inetutils-2.5.sh
/chroot-steps/compile-less-643.sh
/chroot-steps/compile-perl-5.38.2.sh
/chroot-steps/compile-xml-parser-2.47.sh
/chroot-steps/compile-intltool-0.51.0.sh
/chroot-steps/compile-autoconf-2.72.sh
/chroot-steps/compile-automake-1.16.5.sh
/chroot-steps/compile-openssl-3.2.1.sh
/chroot-steps/compile-kmod-31.sh
/chroot-steps/compile-elfutils-0.190.sh
/chroot-steps/compile-libffi-3.4.4.sh
/chroot-steps/compile-python-3.12.2.sh
/chroot-steps/compile-flit-core-3.9.0.sh
/chroot-steps/compile-wheel-0.42.0.sh
/chroot-steps/compile-setuptools-69.1.0.sh
/chroot-steps/compile-ninja-1.11.1.sh
/chroot-steps/compile-meson-1.3.2.sh
/chroot-steps/compile-coreutils-9.4.sh
/chroot-steps/compile-check-0.15.2.sh
/chroot-steps/compile-diffutils-3.10.sh
/chroot-steps/compile-gawk-5.3.0.sh
/chroot-steps/compile-findutils-4.9.0.sh
/chroot-steps/compile-groff-1.23.0.sh
/chroot-steps/compile-gzip-1.13.sh
/chroot-steps/compile-iproute2-6.7.0.sh
/chroot-steps/compile-kbd-2.6.4.sh
/chroot-steps/compile-libpipeline-1.5.7.sh
/chroot-steps/compile-make-4.4.1.sh
/chroot-steps/compile-patch-2.7.6.sh
/chroot-steps/compile-tar-1.35.sh
/chroot-steps/compile-texinfo-7.1.sh
/chroot-steps/compile-vim-9.1.0041.sh
/chroot-steps/compile-markupsafe-2.1.5.sh
/chroot-steps/compile-jinja2-3.1.3.sh
/chroot-steps/compile-systemd-255.sh
/chroot-steps/compile-d-bus-1.14.10.sh
/chroot-steps/compile-man-db-2.12.0.sh
/chroot-steps/compile-procps-ng-4.0.4.sh
/chroot-steps/compile-util-linux-2.39.3.sh
/chroot-steps/compile-e2fsprogs-1.47.0.sh
/chroot-steps/compile-freetype-2.13.2.sh
/chroot-steps/compile-libaio-0.3.113.sh
/chroot-steps/compile-lvm2-2.03.23.sh
/chroot-steps/compile-grub-2.12.sh
/chroot-steps/strip-debug-sysbol.sh

rm -rf /tmp/*
find /usr/lib /usr/libexec -name \*.la -delete
find /usr -depth -name $(uname -m)-lfs-linux-gnu\* |xargs rm -rf
userdel -r tester
/chroot-steps/system-config.sh
/chroot-steps/compile-linux-6.7.4.sh
/chroot-steps/install-config-bootloader.sh
rm -rf /souces
