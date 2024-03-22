#!/usr/bin/env bash
set -e
cd /sources

rm -rf vim-9.1.0041
tar -xvf vim-9.1.0041.tar.gz
cd vim-9.1.0041
echo '#define SYS_VIMRC_FILE "/etc/vimrc"' >> src/feature.h
./configure --prefix=/usr

make
chown -R tester .
su tester -c "TERM=xterm-256color LANG=en_US.UTF-8 make -j1 test" \
	&> vim-test.log
make -j1 install
ln -sfv vim /usr/bin/vi
for L in /usr/share/man/{,*/}man1/vim.1; do
	ln -sfv vim.1 $(dirname $L)/vi.1
done
ln -sfv ../vim/vim91/doc /usr/share/doc/vim-9.1.0041
cat > /etc/vimrc << "EOF"
" Begin /etc/vimrc

" Ensuer default are set before customizing settings, not after
source $VIMRUNTIME/default.vim
let skip_default_vim=1

set nocompatible
set backspace=2
set mouse=
syntax on
if ($term == "xterm") || (&term == "putty")
	set background=dark
endif

" End /etc/vimrc
EOF
rm -rf /sources/vim-9.1.0041

