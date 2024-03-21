#!/usr/bin/env bash
set -e
cd /sources

#rm -rf gcc-13.2.0
#tar -xvf gcc-13.2.0.tar.xz
cd gcc-13.2.0

case $(uname -m) in
    x86_64)
        sed -e '/m64=/s/lib64/lib/' \
            -i.orig gcc/config/i386/t-linux64
    ;;
esac

mkdir -pv build
cd build
../configure  --prefix=/usr \
	LD=ld \
    --enable-default-pie \
    --enable-default-ssp \
    --disable-multilib \
    --disable-bootstrap \
    --disable-fixincludes \
    --with-system-zlib \
    --enable-languages=c,c++

make
ulimit -s 32768
chown -R tester .
set +e
su tester -c "PATH=$PATH make -k check"
set -e
../contrib/test_summary
make install
chown -v -R root:root \
	/usr/lib/gcc/$(gcc -dumpmachine)/13.2.0/include{,-fixed}

ln -svr /usr/bin/cpp /usr/lib
ln -sv gcc.1 /usr/share/man/man1/cc.1
ln -sfv ../../libexec/gcc$(gcc -dumpmachine)/13.2.0/liblto_plugin.so \
	/usr/lib/bfd-plugins/
echo 'init main(){}' > dummy.c
cc dummy.c -v -Wl,--verbose &> dummy.log
readelf -l a.out |grep ': /lib'

grep -E -o '/usr/lib.*/S?crt[1in].*succeeded' dummy.log
grep -B4 '^ /usr/include' dummy.log
grep 'SEARCH.*/usr/lib' dummy.log |sed 's|; |\n|g'
grep "/lib.*/libc.so.6 " dummy.log
grep found dummy.log 
rm -v dummy.c a.out dummy.log
mkdir -pv /usr/share/gdb/auto-load/usr/lib
mv -v /usr/lib/*gdb.py /usr/share/gdb/auto-load/usr/lib
	
# rm -rf /sources/gcc-13.2.0