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
" Basic {{{

" General
filetype plugin indent on
set encoding=utf-8
set modelines=0
set history=1000
set autoread
set ttyfast
set hidden
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
set shortmess+=aoOtT
set notimeout ttimeout
set ttimeoutlen=10
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
set listchars=tab:▸\ ,trail:.,eol:¬,extends:❯,precedes:❮
set showbreak=…
set colorcolumn=+1
set cursorline
set laststatus=2
set statusline=\ %f\ \|\ %M\ %r%= " File name, modified and readonly flags
set statusline+=%{&fileformat}\ \|\ %{&encoding}\ \|\ %{&filetype} " File information
set statusline+=\ \|\ L\ %l\/%L\ C\ %v\ \|\ %P\ " Line number, column number, and position in file
syntax on
set t_Co=256
colorscheme default

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

" Y yanks to end of line
nnoremap Y y$

" Split line
nnoremap <silent> S i<cr><esc>k:s/ \+$/<cr>:let @/=''<cr>j^

" Space toggles fold
nnoremap <space> za

" Select last changed text
nnoremap gV `[v`]

" Substitute
nnoremap gs :%s//g<left><left>
vnoremap gs :s//g<left><left>

" Strip trailing whitespace
nnoremap <silent> <leader><space> mz:%s/\s\+$//e<cr>`z:let @/=''<cr>

" Resize current window to the size of textwidth
function! ResizeWindow() " {{{
    let s:gutterwidth = &fdc + (&relativenumber + &number) * &numberwidth
    let s:windowwidth = s:gutterwidth + &textwidth + 1
    exe "wincmd ="
    exe "vertical resize " . s:windowwidth
endfunction " }}}
nnoremap <silent> <c-w>r :call ResizeWindow()<cr>

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
nnoremap <silent> <leader>db :call DeleteBuffer()<cr>

" Delete all other buffers
function! DeleteOtherBuffers() " {{{
    let s:bnum = bufnr('%')
    for s:b in range(1, bufnr('$'))
        if s:b != s:bnum
            exe "bdelete" . s:b
        endif
    endfor
endfunction " }}}
nnoremap <silent> <leader>do :call DeleteOtherBuffers()<cr>

" }}}
" Toggles {{{

set pastetoggle=<leader>p
nnoremap <silent> <leader>s :set spell!<cr>
nnoremap <silent> <leader>w :set wrap!<cr>
nnoremap <silent> <leader>l :set list!<cr>
nnoremap <silent> <leader>/ :nohlsearch<cr>
nnoremap <silent> <c-w>b :set scrollbind!<cr>
nnoremap <silent> <Leader>i :IndentGuidesToggle<cr>

function! ToggleLineNumbers() " {{{
    if(&number)
        set nonumber
        set relativenumber
    elseif(&relativenumber)
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

" Open CtrlP in buffer mode
nnoremap <silent> <c-n> :CtrlPBuffer<cr>

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
" Files & Directories {{{

" Expand path to directory of current file
inoremap <expr> %% expand("%:p:h")
cnoremap <expr> %% expand("%:p:h")

" Set working directory for current window to that of the current buffer
nnoremap <leader>c :lcd %:p:h<bar>pwd<cr>

" Save as root
cnoremap w!! w !sudo tee % >/dev/null

" Make current file executable
nnoremap <leader>x :!chmod 755 %<cr>

" Edit vim files
nnoremap <silent> <leader>vv :edit $MYVIMRC<cr>
nnoremap <silent> <leader>vd :edit ~/.vim/<cr>
nnoremap <silent> <leader>vf :exe "~/.vim/after/ftplugin" . &ft . ".vim"<cr>

" Work directories
nnoremap <leader>1 :lcd /Volumes/mediapanel/www/html/mediapanel/cfmIncludes/<bar>pwd<cr>
nnoremap <leader>2 :lcd /Volumes/mediapanel/www/html/mediapanel/golden_master/BCM2709/home/mediapanel/nodes/<bar>pwd<cr>

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
" Indent Guides {{{

" Don't use the default mapping
let g:indent_guides_default_mapping = 0

" }}}
" CtrlP {{{
 
 " Don't jump to another window when opening a buffer
 let g:ctrlp_switch_buffer = 0
 
 " CtrlP uses the same working directory as Vim
 let g:ctrlp_working_path_mode = 0
 
 " Set the size for the match window
 let g:ctrlp_match_window = 'max:20'
 
 " }}}

" }}}
