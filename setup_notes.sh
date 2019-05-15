#!/bin/bash

export NOTES_ZIP=notes.zip
export MISC_ZIP=misc.zip
export VIM_HOME=~/.vim

mkdir ${VIM_HOME}

wget -O ${NOTES_ZIP} http://peterodding.com/code/vim/downloads/notes.zip
wget -O ${MISC_ZIP} http://peterodding.com/code/vim/downloads/misc.zip

unzip ${NOTES_ZIP} -d ${VIM_HOME} 
unzip ${MISC_ZIP} -d ${VIM_HOME}

rm ${NOTES_ZIP} ${MISC_ZIP}


