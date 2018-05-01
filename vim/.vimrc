filetype plugin indent on

if exists('*minpac#init')
    call minpac#init()
    call minpac#add('tpope/vim-repeat')
    call minpac#add('tpope/vim-surround')
    call minpac#add('tpope/vim-commentary')
    call minpac#add('nanotech/jellybeans.vim')
endif

set encoding=utf-8
set hidden
set backspace=indent,eol,start
set notimeout ttimeout ttimeoutlen=10
set nowrap
set incsearch
set hlsearch
set ignorecase
set smartcase
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set shiftround
set showcmd
syntax enable
colorscheme desert

nnoremap <silent> <Plug>SplitLine
    \ :silent! keeppatterns s/\s*\%#\s*/\="\r" . matchstr(getline("."), '^\s*')/<cr>
    \:silent! call repeat#set("\<Plug>SplitLine")<cr>
nmap S <Plug>SplitLine
nnoremap <tab> <c-^>
nnoremap <silent> <space> :nohlsearch<cr>
nnoremap gV `[v`]
nnoremap gs :%s///g<left><left>
xnoremap gs :s///g<left><left>
nnoremap gb :ls<cr>:b<space>

command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update()
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()
