#!/bin/sh


STARTDIR=`pwd`

if [ "$STARTDIR" = ~/.dotfiles  ]; then
	echo ""
	echo "#####"
	echo "##### START STEP1 #####"
	echo "##### synboric link (.vimrc .vim/)"
	echo "#####"

	ln -s .vimrc .vim ../ 

else
	echo "ERROR STEP 1"
	echo ".dotfiles 内で実行して下さい"
	exit 1
fi


if [ "$STARTDIR" = ~/.dotfiles  ]; then
	echo ""
	echo "#####"
	echo "##### START STEP2 #####"
	echo "##### copy (.bashrc .bash_profile)"
	echo "#####"

	cp .bashrc .bash_profile ../ && \
	sudo cp .bash_profile.root /root/.bash_profile && \
	sudo cp .bashrc.root /root/.bashrc 

else
	echo "ERROR STEP 2"
	echo ".dotfiles 内で実行して下さい"
	exit 1
fi	

echo ""
echo "##### setup end #####"
