#!/bin/bash

export VIM_HOME=~/.vim
export VIMRC=~/.vimrc

rm -rf ${VIM_HOME} ${VIMRC}

mkdir ${VIM_HOME}

mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
curl -LSso ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cp vimrc ${VIMRC}
