#!/usr/bin/env bash
set -e
install -v -g sys -m700 -d /var/lib/sshd && groupadd -g 50 sshd && \
	useradd -c 'sshd PrivSep' \
	-d /var/lib/sshd \
	-g sshd \
	-s /bin/false \
	-u 50 sshd

cd /beyong-sources

rm -rf openssh-9.6p1
tar -xvf openssh-9.6p1.tar.gz
cd openssh-9.6p1

CFLAGS=-O0 ./configure --prefix=/usr \
	--sysconfdir=/etc/ssh \
	--with-privsep-path=/var/lib/sshd \
	--with-default-path=/usr/bin \
	--with-superuser-path=/usr/sbin:/usr/bin \
	--with-pid-dir=/run 

make
make install
install -v -m755 contrib/ssh-copy-id /usr/bin
install -v -m644 contrib/ssh-copy-id.1 /usr/share/man/man1
install -v -m755 -d /usr/share/doc/openssl-9.6p1
install -v -m644 INSTALL LICENSE OVERVIEW README* /usr/share/doc/openssh-9.6p1
rm -rf /beyong-sources/openssh-9.6p1

cat > /usr/lib/systemd/system/sshd.service <<EOF
[Unit]
Description=OpenSSH Daemon
Wants=sshdgenkeys.service
After=sshdgenkeys.service
After=network.target

[Service]
ExecStart=/usr/sbin/sshd -D
ExecReload=/bin/kill -HUP $MAINPID
KillMode=process
Restart=always

[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl enable --now sshd
