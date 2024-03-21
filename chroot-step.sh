#!/usr/bin/env bash
env

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

install -dfv -m 0750 /root
install -dfv -m 1777 /tmp /var/tmp

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
