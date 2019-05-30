#!/bin/bash

export VIM_HOME=~/.vim
export VIMRC=~/.vimrc

rm -rf ${VIM_HOME} ${VIMRC}

mkdir ${VIM_HOME}

mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

cp .vimrc ${VIMRC}

git clone https://github.com/scrooloose/nerdtree.git ${VIM_HOME}/bundle/nerdtree
git clone https://github.com/xolox/vim-misc ${VIM_HOME}/bundle/vim-misc
git clone https://github.com/xolox/vim-notes ${VIM_HOME}/bundle/vim-notes
git clone https://github.com/tpope/vim-commentary ${VIM_HOME}/bundle/vim-commentary
git clone https://github.com/tpope/vim-fugitive.git ${VIM_HOME}/bundle/vim-fugitive
git clone https://github.com/itchyny/lightline.vim ${VIM_HOME}/bundle/lightline.vim
