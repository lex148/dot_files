#!/bin/bash

#mv ~/.vim ~/.vim.old.one
#mv ~/.vimrc ~/.vimrc.old.one

mkdir -p ~/.vim/tmp/undo
mkdir -p ~/.vim/tmp/backup
mkdir -p ~/.vim/tmp/swap

git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
curl https://raw.github.com/cajun/dot_vim/master/.vimrc > ~/.vimrc

vim +BundleInstall +qall
