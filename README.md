# vim
my own vimrc + vundle plugin

# pre-requirement

1. setup bundle (vim plugin manager)
   git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/vundle
    
    Reference 
        (in ~/.vimrc, below commands make it possible to install bundle plugin tool
        set nocompatible
        filetype off
         
        set rtp+=~/.vim/bundle/vundle/
         
        call vundle#rc()
        Bundle 'gmarik/vundle'
        Bundle 'git://git.wincent.com/command-t.git'
         
        filetype plugin indent on

2. :PluginInstall
