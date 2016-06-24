" vim-plug {{{

runtime macros/matchit.vim
call plug#begin('~/.vim/plugged')

" Plugins
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tommcdo/vim-exchange'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Colorschemes
Plug 'morhetz/gruvbox'
Plug 'sjl/badwolf'
Plug 'w0ng/vim-hybrid'
Plug 'nanotech/jellybeans.vim'
Plug 'NLKNguyen/papercolor-theme'

call plug#end()

" }}}
" Basic {{{

" General
filetype plugin indent on
set encoding=utf-8
set history=10000
set autoread
set ttyfast
set hidden
set backspace=indent,eol,start
set nrformats-=octal
set nojoinspaces
set wildmenu
set wildmode=list:longest,full
set wildignore+=*.git/
set wildignore+=*.jpg,*.jpeg,*.png,*.gif
set wildignore+=*.o,*.obj
set wildignore+=*.pyc,*.luac
set wildignore+=*.bak,*.swp
set wildignore+=*.DS_Store
set shortmess+=atT
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
set wrapscan

" Whitespace
set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set shiftround

" Wrapping
set nowrap
set linebreak
set textwidth=79
set formatoptions=qrn1jc

" Display
set lazyredraw
set cmdheight=2
set visualbell t_vb=
set showcmd
set showmode
set number
set splitright
set splitbelow
set list
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set showbreak=…
set colorcolumn=+1
set cursorline
set laststatus=2
set statusline=\ %f\ %m%r%=line\ %l\/%L\ \|\ %{&filetype}\ 
syntax on
set t_Co=256
set background=dark
colorscheme jellybeans

" }}}
" Folding {{{

set foldlevelstart=99

function! MyFoldText() " {{{
    " Width of window
    let s:gutterwidth = &fdc + (&relativenumber + &number) * &numberwidth
    let s:windowwidth = winwidth(0) - s:gutterwidth

    " Number of lines inside the fold
    let s:foldedlinecount = v:foldend - v:foldstart

    " Trim the line text
    let s:line = getline(v:foldstart)
    let s:softtab = strpart('        ', 0, &tabstop)
    let s:line = substitute(s:line, '\t', s:softtab, 'g')
    let s:line = substitute(s:line, '\s\=--\+', '', 'g')
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

function! PreserveSearch(cmd) " {{{
  let prev_search=@/
  let prev_line = line(".")
  let prev_col = col(".")
  execute a:cmd
  let @/=prev_search
  call cursor(prev_line, prev_col)
endfunction " }}}

" Visual */# mappings
" From http://got-ravings.blogspot.com/2008/07/vim-pr0n-visual-search-mappings.html
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

" Buffer management
nnoremap <leader>b :ls<cr>:b<space>
nnoremap <silent> <leader>d :b#<bar>bd#<cr>

" Resize current window to the size of textwidth
function! ResizeWindow() " {{{
    let s:gutterwidth = &fdc + (&relativenumber + &number) * &numberwidth
    let s:windowwidth = s:gutterwidth + &textwidth + 1
    exe "wincmd ="
    exe "vertical resize " . s:windowwidth
endfunction " }}}
nnoremap <silent> <c-w>r :call ResizeWindow()<cr>

" }}}
" Toggles {{{

set pastetoggle=<leader>p
nnoremap <silent> <leader>/ :nohlsearch<cr>
nnoremap <silent> <leader>s :set spell!<cr>
nnoremap <silent> <leader>n :set number!<cr>

" }}}
" Navigation {{{

" Navigate buffer list, idea stolen from unimpared
nnoremap <silent> [b :<c-u><c-r>=v:count1<cr>bprev<cr>
nnoremap <silent> ]b :<c-u><c-r>=v:count1<cr>bnext<cr>

" Navigate argument list, idea stolen from unimpared
nnoremap <silent> [a :<c-u><c-r>=v:count1<cr>prev<cr>
nnoremap <silent> ]a :<c-u><c-r>=v:count1<cr>next<cr>

" Navigate quickfix list, idea stolen from unimpared
nnoremap <silent> ]q :<c-u><c-r>=v:count1<cr>cnext<cr>
nnoremap <silent> [q :<c-u><c-r>=v:count1<cr>cprev<cr>

" Navigate location list, idea stolen from unimpared
nnoremap <silent> ]l :<c-u><c-r>=v:count1<cr>lnext<cr>
nnoremap <silent> [l :<c-u><c-r>=v:count1<cr>lprev<cr>

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

" Fuzzy file opener
nnoremap <leader>f :FZF -m<cr>

" Set working directory for current window to that of the current buffer
nnoremap <leader>c :lcd %:p:h<bar>pwd<cr>

" Save as root
cnoremap w!! w !sudo tee % >/dev/null

" Edit/source vim files
nnoremap <silent> <leader>vv :tabe $MYVIMRC<cr>
nnoremap <silent> <leader>vs :source $MYVIMRC<cr>
nnoremap <silent> <leader>vd :tabe ~/.vim/<cr>
nnoremap <silent> <leader>vf :exe "tabe ~/.vim/after/ftplugin/" . &ft . ".vim"<cr>

" }}}

" }}}
" Autocommands {{{

if has("autocmd")
    " Source $MYVIMRC after saving
    augroup SourceVimrc
        au!
        autocmd BufWritePost $MYVIMRC source $MYVIMRC
    augroup END

    " Only show cursorline in current window
    augroup HideCursorline
        au!
        autocmd WinLeave * set nocursorline
        autocmd WinEnter * set cursorline
    augroup END
endif

" }}}
" Plugin Configuration {{{
"
" Netrw {{{

" Don't show the help banner
let g:netrw_banner = 0

" }}}

" }}}
