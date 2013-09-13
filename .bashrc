# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

alias bb='ls -a'
alias rm='rm -i'
alias ls='ls --color=auto'
vim='/usr/local/vim-7.3/bin/vim'
PS1="\[\e[0;34m\]\u\[\e[0;33m\]@\[\e[0;34m\]\h\[\e[0m\][\[\e[1;33m\]\A]\[\e[0;33m\]\W\[\e[0m\]:$ "

MOBA_DIR=/home/training;
export MOBA_DIR
export PATH=$MOBA_DIR/script/tool:$MOBA_DIR/script/daemon:$PATH
