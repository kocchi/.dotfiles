#!/bin/sh

STEP1=1
STEP2=0
STEP3=0


STARTDIR=`pwd`

if [ "$STEP1" = 1 ]; then
	echo ""
	echo "#####"
	echo "##### START STEP1 #####"
	echo "##### synboric link (.vimrc .vim/)"
	echo "#####"

	cd ~/ && \
	ln -snf .dotfiles/.vimrc .vimrc && \
	ln -snf .dotfiles/.vim/ .vim && \
	cd ~/.vim/bundle/ && \
	git clone https://github.com/Shougo/neobundle.vim && \
	cd ~

	RET=$?
	if [ "$RET" != 0 ]; then
		echo "ERROR STEP 1"
		exit 1
	fi
fi


if [ "$STEP2" = 1 ]; then
	echo ""
	echo "#####"
	echo "##### START STEP2 #####"
	echo "##### copy (.bashrc .bash_profile)"
	echo "#####"

	cd ~/ && \
		mv .bashrc .dashrc.org && \
		mv .bash_profile .dash_profile.org && \
		ln -s .dotfiles/.bashrc .dotfiles/.bash_profile . && \
		sudo mv /root/.bashrc /root/.bashrc.org && \
		sudo mv /root/.bash_profile /root/.bash_profile.org && \
		sudo cp .dotfiles/.bashrc.root /root/.bashrc && \
		sudo cp .dotfiles/.bash_profile.root /root/.bash_profile && \
		source .bashrc && \
		source .bash_profile

	RET=$?
	if [ "$RET" != 0 ]; then
		echo "ERROR STEP 1"
		exit 1
	fi
fi

if [ "$STEP3" = 1 ]; then
	echo ""
	echo "#####"
	echo "##### START STEP3 #####"
	echo "##### INSTALL VIM 7.3"
	echo "#####"

	sudo yum -y remove vim vim-enhanced && \
	sudo yum -y install ncurses-devel && \
	mkdir install_vim7.3/ && \
	cd ./install_vim7.3/ && \
	wget ftp://ftp.vim.org/pub/vim/unix/vim-7.3.tar.bz2 && \
	wget ftp://ftp.jp.vim.org/pub/vim/extra/vim-7.2-extra.tar.gz && \
	wget ftp://ftp.vim.org/pub/vim/extra/vim-7.2-lang.tar.gz &&\
	tar jxvf vim-7.3.tar.bz2  && \
	tar zxvf vim-7.2-extra.tar.gz && \
	tar zxvf vim-7.2-lang.tar.gz && \
	mv vim72 vim73/ && \
	cd vim73/src && \
	./configure --enable-multibyte --with-features=huge --disable-selinux --prefix='/usr/local/vim-7.3' && \
	sudo make install && \
    cd ~/.dotfiles/ &&\
	sudo rm -fr install_vim7.3

	RET=$?
	if [ "$RET" != 0 ]; then
		echo "ERROR STEP 1"
		exit 1
	fi
fi

echo ""
echo "##### setup end #####"
