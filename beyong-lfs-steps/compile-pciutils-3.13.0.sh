#!/usr/bin/env bash
sed -e
cd /beyong-sources
rm -rf pciutils-3.13.0
tar -xvf pciutils-3.13.0.tar.gz
cd pciutils-3.13.0

sed -r '/INSTALL/{/PCI_IDS|update-pciids /d; s/update-pciids.8//}' -i Makefile
make PREFIX=/usr \
     SHAREDIR=/usr/share/hwdata \
     SHARED=yes

make PREFIX=/usr \
     SHAREDIRE=/usr/share/hwdata \
     SHARED=yes \
     install install-lib

chmod -v 755 /usr/lib/libpci.so
