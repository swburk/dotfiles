filetype plugin indent on
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

function! PreserveSearch(cmd)
  let prev_search=@/
  let prev_line = line(".")
  let prev_col = col(".")
  exe a:cmd
  let @/=prev_search
  call cursor(prev_line, prev_col)
endfunction
nnoremap <Plug>SplitLine i<cr><esc>k:call PreserveSearch('silent! s/ \+$/')<cr>j^:call repeat#set("\<Plug>SplitLine")<cr>
nmap <silent> S <Plug>SplitLine

nnoremap <tab> <c-^>
nnoremap <silent> <space> :nohlsearch<cr>
