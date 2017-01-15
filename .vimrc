filetype plugin indent on
set tabstop=8
set softtabstop=4
set shiftwidth=4
set textwidth=100
set expandtab
set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
set nu
"set mouse=a             " hold shift to copy xterm
"set ttymouse=xterm2     " necessary for gnu screen & mouse
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
" NERDTree - file explore
Plugin 'https://github.com/scrooloose/nerdtree.git'
" taglist - see tag lists
Plugin 'https://github.com/vim-scripts/taglist.vim.git'
" SrcExpl - source explore
Plugin 'https://github.com/wesleyche/SrcExpl.git'
" python syntax
Plugin 'https://github.com/hdima/python-syntax.git'
" FuzzyFinder
Plugin 'https://github.com/vim-scripts/L9.git'
Plugin 'https://github.com/vim-scripts/FuzzyFinder.git'
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
map <F5> :SrcExplToggle<CR> 

" leader key mapping : if being get accustomed, remove things below,
let mapleader = "`"
nnoremap <leader>. <c-i>
nnoremap <leader>, <c-o>
nnoremap <leader>' <c-]>

"macro function cscope
"symbol
nnoremap <leader>/ :call Css()<cr>
"funtion calling
nnoremap <leader>t :call Cst()<cr>
"function called
nnoremap <leader>f :call Csd()<cr>
"define
nnoremap <leader>d :call Csg()<cr>
"========================================================================================================

"ctags
"set tags=/home/jwkang2/work/src/g5/base_0103/humax/humaxtv/apps/humaxtv/octo/tags

"cscope
set csprg=/usr/bin/cscope
set csto=0 
set cst 
set nocsverb 
if filereadable("./cscope.out") 
    cs add "$(pwd)"cscope.out 
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


"========================================================================================================
"SrcExpl
let g:SrcExpl_updateTagsCmd="$(pwd)"
"for update tag automatically
"let g:SrcExpl_updateTagsCmd="ctags --sort=foldcase -R ." 

let g:SrcExpl_pluginList = [ 
        \ "__Tag_List__", 
        \ "_NERD_tree_" 
    \ ]

" // Set 'Enter' key to jump into the exact definition context 
let g:SrcExpl_jumpKey = "<ENTER>" 

" // Set the height of Source Explorer window 
let g:SrcExpl_winHeight = 8 

" // Set 100 ms for refreshing the Source Explorer 
let g:SrcExpl_refreshTime = 100 
"========================================================================================================
"FuzzyFinder 
let g:fuf_coveragefile_exclude = '\v\~$|\.(o|exe|dll|bak|orig|swp|class|cmd|svn)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])'
map <leader>ff :FufFile **/
map <leader>fb :FufBuffer <cr>
nnoremap <Leader>t :FufTag<cr>

" Truth be told, I don't remember what these do, but I must have
" found them necessary back when I installed fuzzyfinder years ago
" these contain a lot of Python-isms, yours will probably vary
let s:extension = '\.bak|\.dll|\.exe|\.o|\.pyc|\.pyo|\.swp|\.swo\.cmd'
let s:dirname = 'build|deploy|dist|vms|\.bzr|\.git|\.svn|\.hg|\.svn|.+\.egg-info'

" limit number of displayed matches
" (makes response instant even on huge source trees)
let g:fuf_enumeratingLimit = 60

"========================================================================================================
" macro function
"ctags macro setting
if version >= 500 "// vim version check 
func! Sts() 
      let st = expand("<cword>")
         exe "sts ".st
endfunc
nmap ,st :call Sts()<cr> 

func! Tj()
      let tj = expand("<cword>")
         exe "tj ".tj
endfunc
nmap ,tj :call Tj()<cr>
endif

"cscope macro
func! Css()
    let css = expand("<cword>")
    exe "cs find s ".css
    if getline(1) == ""
        exe "q!"
    endif
endfunc


func! Cst()
    let cst = expand("<cword>")
    exe "cs find t ".cst
    if getline(1) == ""
        exe "q!"
    endif
endfunc

func! Csd()
    let csd = expand("<cword>")
    exe "cs find d ".csd
    if getline(1) == ""
        exe "q!"
    endif
endfunc


func! Csg()
    let csg = expand("<cword>")
    exe "cs find g ".csg
    if getline(1) == ""
        exe "q!"
    endif
endfunc

nmap ,css :call Css()<cr>
nmap ,csc :call Csc()<cr>
nmap ,csd :call Csd()<cr>
nmap ,csg :call Csg()<cr>

"========================================================================================================

