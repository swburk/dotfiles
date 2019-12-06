filetype plugin indent on
packadd! matchit
set encoding=utf-8
set noswapfile
set hidden
set backspace=indent,eol,start
set ttimeoutlen=10
set nowrap
set incsearch
set hlsearch
set ignorecase
set smartcase
set tabstop=4
set shiftwidth=0
set autoindent
set showcmd
set ruler
syntax enable
colorscheme angr

set pastetoggle=<f2>
nnoremap <silent> <Plug>SplitLine
	\ :silent! keeppatterns s/^\(\s*\)\(.\{-}\)\s*\%#\s*\(.*\)/\1\2\r\1\3/<cr>
	\:silent! call repeat#set("\<Plug>SplitLine")<cr>
nmap S <Plug>SplitLine
nnoremap <tab> <c-^>
nnoremap <silent> <space> :nohlsearch<cr>
nnoremap gV `[v`]
nnoremap gs :%s///g<left><left>
xnoremap gs :s///g<left><left>
nnoremap gl :ls<cr>:b<space>
