#!/bin/bash
set -xu

# brew install zsh fzf vim neovim

export VIMRC=~/.vimrc
export NVIM_HOME=~/.config/nvim
export VIM_HOME=~/.vim

# rm -rf ${VIM_HOME} ${VIMRC}
# mkdir ${VIM_HOME}
rm -rf ${NVIM_HOME}
mkdir -p ${NVIM_HOME}

echo -e "set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc" >> ${NVIM_HOME}/init.vim


# mkdir -p ~/.vim/autoload ~/.vim/bundle
# curl -LSso ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# cp vimrc ${VIMRC}

