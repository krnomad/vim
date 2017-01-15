filetype plugin indent on
set tabstop=8
set softtabstop=4
set shiftwidth=4
set textwidth=100
set expandtab
set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
set nocindent

set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/

call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'git://git.wincent.com/command-t.git'

" jwkang2 python plugin
Plugin 'https://github.com/davidhalter/jedi-vim.git'
filetype plugin indent on     " required!
" "
" " file explore
Plugin 'https://github.com/scrooloose/nerdtree.git'
" " tag list
Plugin 'taglist.vim'
" "
" " python syntax
Plugin 'python.vim'
syntax on
" "
" " run python
map <C-b> :! python %<CR>
map <C-b> :! python %<CR>
" "
" " auto tab size 
set expandtab
set ts=4
au Bufenter *.py set et " can do specific file type

set paste

"========================================================================================================
" key map
" ctrl+k <character> let you know string for map command
map <F3> :TlistToggle<CR>
map <F4> :NERDTreeToggle<CR>

"========================================================================================================

"ctags
"set tags=/home/jwkang2/work/src/g5/base_0103/humax/humaxtv/apps/humaxtv/octo/tags

"cscope
set csprg=/usr/bin/cscope
set csto=0 
set cst 
set nocsverb 
if filereadable("./cscope.out") 
    cs add cscope.out 
endif 
set csverb

"========================================================================================================
"Taglist
let Tlist_Ctags_Cmnd = "$(pwd)ctags"
"========================================================================================================

"========================================================================================================
"NERDTree
"display
let NERDTreeWinPos = "right"

"the only NERD left open is a NERDTree, close it automatically
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

autocmd BufEnter *
      \ if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) |
      \ q |
      \ endif

"open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"open NERDTree automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

"open current directory
"autocmd BufEnter * lcd %:p:h
"leader key maeans '\' and it can be replaced with other key. refer to ':help leader'
map <leader>r :NERDTreeFind<cr>

"========================================================================================================


