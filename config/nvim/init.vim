" vim-plug {{{

call plug#begin('~/.config/nvim/plugged')

" Plugins
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tommcdo/vim-exchange'

" Colorschemes
Plug 'sjl/badwolf'
Plug 'nanotech/jellybeans.vim'

call plug#end()

" }}}
" Basic {{{

" General
set hidden
set nojoinspaces
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
set undodir=~/.config/nvim/undo

" Search
set ignorecase
set smartcase

" Whitespace
set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab
set shiftround

" Wrapping
set nowrap
set linebreak
set textwidth=79
set formatoptions=qrn1jc

" Display
let g:netrw_banner = 0
set lazyredraw
set cmdheight=2
set visualbell
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
set statusline=\ %f\ %m%r%=line\ %l\/%L:%c\ \|\ %{&filetype}\ 
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
set pastetoggle=<leader>p

nnoremap K <nop>

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
nnoremap gb :ls<cr>:b<space>
nnoremap <silent> <leader>d :b#<bar>bd#<cr>

" Resize splits easily
nnoremap <up> 5<c-w>+
nnoremap <down> 5<c-w>-
nnoremap <left> 5<c-w><
nnoremap <right> 5<c-w>>

" Open scratch window
function! Scratch(cmd) " {{{
  let s:ft = &filetype
  exe a:cmd
  exe "setl buftype=nofile bufhidden=wipe nobuflisted ft=" . s:ft
endfunction
" }}}
nnoremap <silent> <leader>se :<c-u>call Scratch('enew')<cr>
nnoremap <silent> <leader>ss :<c-u>call Scratch('new')<cr>
nnoremap <silent> <leader>sv :<c-u>call Scratch('vnew')<cr>

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
nnoremap <bs> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" Faster side-scrolling
nnoremap + 5zl
nnoremap - 5zh

" }}}
" Files & Directories {{{

" Set working directory for current window to that of the current buffer
nnoremap <leader>c :lcd %:p:h<bar>pwd<cr>

" Save as root
cnoremap w!! w !sudo tee % >/dev/null

" Edit/source neovim files
nnoremap <silent> <leader>vv :e $MYVIMRC<cr>
nnoremap <silent> <leader>vd :e ~/.config/nvim/<cr>
nnoremap <silent> <leader>vf :exe "e ~/.config/nvim/after/ftplugin/" . &ft . ".vim"<cr>

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
