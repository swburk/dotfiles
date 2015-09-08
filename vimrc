" vim-plug {{{

runtime macros/matchit.vim
call plug#begin('~/.vim/plugged')

" Plugins
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'kana/vim-textobj-user'
Plug 'glts/vim-textobj-comment'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'SirVer/ultisnips'
Plug 'tommcdo/vim-exchange'

" Colorschemes
Plug 'morhetz/gruvbox'
Plug 'sjl/badwolf'

call plug#end()


" }}}
" General {{{

filetype plugin indent on
set encoding=utf-8
set modelines=0
set history=1000
set autoread
set ttyfast
set hidden
set confirm
set backspace=indent,eol,start
set nrformats-=octal
set nojoinspaces
set wildmenu
set wildmode=longest,list,full
set wildignore+=*.git/,*.hg/ " Version control
set wildignore+=*.jpg,*.jpeg,*.png,*.gif,*.bmp " Images
set wildignore+=*.o,*.obj,*.exe,*.dll " Compiled object files
set wildignore+=*.pyc,*.luac " Byte code
set wildignore+=*.bak,*.swp " Backups and swap files
set wildignore+=*.DS_Store " OS X
set shortmess+=aoOtTI
set notimeout ttimeout
set ttimeoutlen=10
set virtualedit=block

" }}}
" Display {{{

set lazyredraw
set cmdheight=2
set visualbell t_vb=
set showcmd
set showmode
set number
set splitright
set splitbelow
set list
set listchars=tab:▸\ ,trail:.,eol:¬,extends:❯,precedes:❮
set showbreak=…
set colorcolumn=+1
set cursorline
set laststatus=2
set statusline=\ %f\ \|\ %M\ %r%= " File name, modified and readonly flags
set statusline+=%{&fileformat}\ \|\ %{&encoding}\ \|\ %{&filetype} " File information
set statusline+=\ \|\ L\ %l\/%L\ C\ %v\ \|\ %P\ " Line number, column number, and position in file
syntax on
set bg=dark
set t_Co=256
colorscheme badwolf

" }}}
" Backups & Undo {{{

set noswapfile
set nobackup
set nowritebackup
set undofile
set undodir=~/.vim/undo

" }}}
" Search {{{

set incsearch
set hlsearch
set ignorecase
set smartcase
set wrapscan

" }}}
" Whitespace {{{

set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set shiftround

" }}}
" Wrapping {{{

set nowrap
set linebreak
set textwidth=79
set formatoptions=qrn1jc

" }}}
" Folding {{{

set foldlevelstart=99

function! MyFoldText() " {{{
    " Width of window
    let gutterwidth = &fdc + (&relativenumber + &number) * &numberwidth
    let windowwidth = winwidth(0) - gutterwidth

    " Number of lines inside the fold
    let foldedlinecount = v:foldend - v:foldstart

    " Trim the line text
    let line = getline(v:foldstart)
    let softtab = strpart('        ', 0, &tabstop)
    let line = substitute(line, '\t', softtab, 'g')
    let line = substitute(line, '\s\=--\+', '', 'g')
    let toolong = windowwidth - len(foldedlinecount) - 4
    if len(line) >= toolong
        let line = strpart(line, 0, toolong)
    endif

    " Display a dash for every folded line
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount) - 4
    if foldedlinecount <= fillcharcount
        let fillcharcount = fillcharcount - foldedlinecount
        let fillchars = repeat('-', foldedlinecount) . repeat(' ', fillcharcount)
    else
        let fillchars = repeat('-', fillcharcount)
    endif

    return line . ' ' . fillchars . ' ' . foldedlinecount . '… '
endfunction " }}}
set foldtext=MyFoldText()

" }}}
" Mappings {{{

" General {{{

let mapleader=','
let maplocalleader='\'

" Y yanks to end of line
nnoremap Y y$

" Return to original cursor position after joining lines
nnoremap J @='mzJ`z'<cr>

" Split line
nnoremap S i<cr><esc>^mzk:silent! s/ \+$/<cr>:let @/=''<cr>`z

" Space toggles fold
nnoremap <space> za

" Select last changed text
nnoremap gV `[v`]

" Substitute
nnoremap gs :%s//g<left><left>
vnoremap gs :s//g<left><left>

" Focus current fold
nnoremap z. zMzvzz

" Resize windows
noremap <up> <C-W>+
noremap <down> <C-W>-
noremap <left> <C-W><
noremap <right> <C-W>>

" Save as root
cnoremap w!! w !sudo tee % >/dev/null

" Strip trailing whitespace
nnoremap <silent> <leader><space> mz:%s/\s\+$//e<cr>`z:let @/=''<cr>

" Yank to system clipboard
nnoremap <leader>yy "*yy
nnoremap <leader>ya gg"*yG
vnoremap <leader>y "*y

" Set working directory for current window to current buffer
nnoremap <leader>c :lcd %:p:h<bar>pwd<cr>

" Edit vim files
nnoremap <silent> <leader>vv :tabe $MYVIMRC<cr>
nnoremap <silent> <leader>vf :tabe ~/.vim/<cr>

" Delete buffer without changing window layout
function! DeleteBuffer() " {{{
    let s:bnum = bufnr('%')
    let s:cwin = winnr()
    let s:ctab = tabpagenr()
    for s:i in range(1,tabpagenr('$'))
        exe 'tabn ' . s:i
        while bufwinnr(s:bnum) != -1
            exe bufwinnr(s:bnum) . 'wincmd w|bn'
        endwhile
    endfor
    exe 'tabn ' . s:ctab . '|' . s:cwin . 'wincmd w'
    exe 'bd' . s:bnum
endfunction " }}}
nnoremap <silent> <leader>x :call DeleteBuffer()<cr>

" }}}
" Toggles {{{

set pastetoggle=<leader>p
nnoremap <silent> <leader>s :set spell!<cr>
nnoremap <silent> <leader>w :set wrap!<cr>
nnoremap <silent> <leader>l :set list!<cr>
nnoremap <silent> <leader>/ :nohlsearch<cr>
nnoremap <silent> <Leader>i <Plug>IndentGuidesToggle

function! ToggleLineNumbers() " {{{
    if(&number && !&relativenumber)
        set nonumber
        set relativenumber
    elseif(&relativenumber && !&number)
        set number
    elseif(&relativenumber && &number)
        set nonumber
        set norelativenumber
    else
        set number
    endif
endfunction " }}}
nnoremap <silent> <leader>n :call ToggleLineNumbers()<cr>

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

" Always jump to exact position of mark
nnoremap ' `

" Switch to alternate buffer
nnoremap ` <c-^>

" Navigate wrapped lines
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" Repeat last f, t, F, or T in reverse
nnoremap <leader><leader> ,
vnoremap <leader><leader> ,

" Quicker window switching
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" Visual */# mappings (Thanks to Scrooloose)
function! s:VSetSearch() " {{{
    let temp = @@
    norm! gvy
    let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
    let @@ = temp
endfunction " }}}
vnoremap * :<c-u>call <SID>VSetSearch()<CR>//<CR><c-o>
vnoremap # :<c-u>call <SID>VSetSearch()<CR>??<CR><c-o>

" }}}

" }}}
" Autocommands {{{

" Source $MYVIMRC after saving
augroup SourceVimrc
    au!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END

" Only show cursorline in current window
augroup cline
    au!
    autocmd WinLeave * set nocursorline
    autocmd WinEnter * set cursorline
augroup END

" }}}
" Plugin Configuration {{{
"
" Netrw {{{

" Don't show the help banner
let g:netrw_banner = 0

" }}}
" CtrlP {{{

" Don't jump to another window when opening a buffer
let g:ctrlp_switch_buffer = 0

" CtrlP uses the same working directory as Vim
let g:ctrlp_working_path_mode = 0

" Set the size for the match window
let g:ctrlp_match_window = 'max:20'

" }}}
" Indent Guides {{{

" Don't use the default mapping
let g:indent_guides_default_mapping = 0

" }}}

" }}}
