" vim: foldmethod=marker
" Basic {{{

" General
runtime macros/matchit.vim
filetype plugin indent on
set encoding=utf-8
set history=1000
set hidden
set backspace=indent,eol,start
set nojoinspaces
set notimeout ttimeout ttimeoutlen=10
set nowrap
set noswapfile
set undofile
set undodir=~/.vim/undo

" Search
set incsearch
set hlsearch
set ignorecase
set smartcase

" Whitespace
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set shiftround

" Display
set showcmd
set listchars+=tab:>\ 
set laststatus=2
syntax on
colorscheme jellybeans

" }}}
" Mappings {{{

" General {{{

set pastetoggle=<leader>p

" Clear search highlighting
nnoremap <silent> <leader>/ :nohlsearch<cr>

function! PreserveSearch(cmd) " {{{
  let prev_search=@/
  let prev_line = line(".")
  let prev_col = col(".")
  exe a:cmd
  let @/=prev_search
  call cursor(prev_line, prev_col)
endfunction " }}}

" Visual */# mappings from http://got-ravings.blogspot.com/2008/07/vim-pr0n-visual-search-mappings.html
function! s:VSetSearch() " {{{
    let temp = @@
    norm! gvy
    let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
    let @@ = temp
endfunction " }}}
vnoremap * :<c-u>call <SID>VSetSearch()<CR>//<CR><c-o>
vnoremap # :<c-u>call <SID>VSetSearch()<CR>??<CR><c-o>

" Split line
nnoremap <Plug>SplitLine i<cr><esc>k:call PreserveSearch('silent! s/ \+$/')<cr>j^:call repeat#set("\<Plug>SplitLine")<cr>
nmap <silent> S <Plug>SplitLine

" Select last changed text
nnoremap gV `[v`]

" Substitute quickly
nnoremap gs :%s///g<left><left>
vnoremap gs :s///g<left><left>

" Capitalize the word behind the cursor
inoremap <c-b> <esc>gUiwgi

" }}}
" Navigation {{{

" Navigate buffer list, idea stolen from unimpared
nnoremap <silent> ]b :<c-u><c-r>=v:count1<cr>bnext<cr>
nnoremap <silent> [b :<c-u><c-r>=v:count1<cr>bprev<cr>

" Navigate quickfix list, idea stolen from unimpared
nnoremap <silent> ]q :<c-u><c-r>=v:count1<cr>cnext<cr>
nnoremap <silent> [q :<c-u><c-r>=v:count1<cr>cprev<cr>

" Switch to alternate buffer
nnoremap <tab> <c-^>

" Quicker window switching
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" }}}
" Files & Directories {{{

" Set working directory for current window to that of the current buffer
nnoremap <leader>c :lcd %:p:h<bar>pwd<cr>

" Save as root
cnoremap w!! w !sudo tee % >/dev/null

" }}}

" }}}
