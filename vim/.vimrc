filetype plugin indent on
packadd minpac
if exists('g:loaded_minpac')
	call minpac#init()
	call minpac#add('tpope/vim-repeat')
	call minpac#add('tpope/vim-surround')
	call minpac#add('tpope/vim-commentary')
	call minpac#add('dense-analysis/ale')
	call minpac#add('zacanger/angr.vim')
endif
packadd! matchit
set encoding=utf-8
set noswapfile
set hidden
set undofile
if !isdirectory($HOME . "/.vim/undo")
	call mkdir($HOME . "/.vim/undo")
endif
set undodir=~/.vim/undo
set backspace=indent,eol,start
set ttimeoutlen=10
set nowrap
set incsearch
set hlsearch
set ignorecase
set smartcase
set tabstop=4
set shiftwidth=0
set shiftround
set autoindent
set showcmd
set ruler
syntax enable
silent! colorscheme angr

set pastetoggle=<f2>
nnoremap <silent> <Plug>SplitLine
	\ :silent! keeppatterns s/\v^(\s*)(.{-})\s*%#\s*(.*)/\1\2\r\1\3/<bar>
	\silent! call repeat#set("\<Plug>SplitLine")<cr>
nmap S <Plug>SplitLine
nnoremap <tab> <c-^>
nnoremap <silent> <space> :nohlsearch<cr>
nnoremap gV `[v`]
nnoremap gs :%s///g<left><left>
xnoremap gs :s///g<left><left>
nnoremap gl :ls<cr>:b<space>
cnoremap %% <c-r>=fnameescape(expand('%:h')).'/'<cr>
