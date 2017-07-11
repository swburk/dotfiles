" Basic {{{

" General
runtime macros/matchit.vim
filetype plugin indent on
set encoding=utf-8
set history=10000
set autoread
set ttyfast
set hidden
set backspace=indent,eol,start
set nrformats-=octal
set nojoinspaces
set wildmode=list:longest,full
set wildignore+=*.git/
set wildignore+=*.jpg,*.jpeg,*.png,*.gif
set wildignore+=*.o,*.obj
set wildignore+=*.pyc,*.luac
set wildignore+=*.bak,*.swp
set wildignore+=*.DS_Store
set notimeout ttimeout ttimeoutlen=10
set virtualedit=block

" Backups & Undo
set noswapfile
set nobackup
set nowritebackup
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

" Wrapping
set nowrap
set textwidth=79
set formatoptions=crqn1j

" Display
let g:netrw_banner = 0
set lazyredraw
set cmdheight=2
set visualbell t_vb=
set showcmd
set number
set splitright
set splitbelow
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set showbreak=…
set cursorline
set laststatus=2
syntax on
set t_Co=256
colorscheme jellybeans

" }}}
" Folding {{{

set foldlevelstart=99

function! MyFoldText() " {{{
    let s:gutterwidth = &fdc + (&relativenumber + &number) * &numberwidth
    let s:windowwidth = winwidth(0) - s:gutterwidth
    let s:foldedlinecount = v:foldend - v:foldstart
    let s:line = getline(v:foldstart)

    " Replace tab characters with spaces
    let s:softtab = strpart('        ', 0, &tabstop)
    let s:line = substitute(s:line, '\t', s:softtab, 'g')

    " Remove trailing dashes
    let s:line = substitute(s:line, '\s\=--\+', '', 'g')

    " Trim the line length
    let s:toolong = s:windowwidth - len(s:foldedlinecount) - 4
    if len(s:line) >= s:toolong
        let s:line = strpart(s:line, 0, s:toolong)
    endif

    " Display a dash for every folded line
    let s:fillcharcount = s:windowwidth - len(s:line) - len(s:foldedlinecount) - 4
    if s:foldedlinecount <= s:fillcharcount
        let s:fillcharcount = s:fillcharcount - s:foldedlinecount
        let s:fillchars = repeat('-', s:foldedlinecount) . repeat(' ', s:fillcharcount)
    else
        let s:fillchars = repeat('-', s:fillcharcount)
    endif

    return s:line . ' ' . s:fillchars . ' ' . s:foldedlinecount . '… '
endfunction " }}}
set foldtext=MyFoldText()

" }}}
" Mappings {{{

" General {{{

let mapleader=','
let maplocalleader='\'
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

" Space toggles fold
nnoremap <space> za

" Select last changed text
nnoremap gV `[v`]

" Substitute quickly
nnoremap gs :%s///g<left><left>
vnoremap gs :s///g<left><left>

" Capitalize the word behind the cursor
inoremap <c-b> <esc>gUiwgi

" Strip trailing whitespace
nnoremap <silent> <leader><space> :call PreserveSearch(':%s/\s\+$//e')<cr>

" List buffers
nnoremap gb :ls<cr>:b

" Resize splits easily
nnoremap <up> 5<c-w>+
nnoremap <down> 5<c-w>-
nnoremap <left> 5<c-w><
nnoremap <right> 5<c-w>>

" }}}
" Navigation {{{

" Navigate buffer list, idea stolen from unimpared
nnoremap <silent> ]b :<c-u><c-r>=v:count1<cr>bnext<cr>
nnoremap <silent> [b :<c-u><c-r>=v:count1<cr>bprev<cr>

" Command line navigation
cnoremap <c-a> <home>
cnoremap <c-f> <right>
cnoremap <c-b> <left>

" Switch to alternate buffer
nnoremap <tab> <c-^>

" Repeat last f, t, F, or T in reverse
nnoremap <leader><leader> ,
vnoremap <leader><leader> ,

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

" Edit/source vim files
nnoremap <silent> <leader>vv :e $MYVIMRC<cr>
nnoremap <silent> <leader>vf :exe "e ~/.vim/after/ftplugin/" . &ft . ".vim"<cr>

" }}}

" }}}
