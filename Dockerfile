FROM ubuntu:22.04
ENV LFS=/mnt/lfs
ENV LANG=C.UTF-8
RUN apt update && apt-get -y install binutils ca-certificates gcc g++ gawk bison yacc fdisk kpartx vim dosfstools parted qemu-system-x86

CMD ["/bin/bash"]
