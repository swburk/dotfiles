" Plugins {{{

runtime macros/matchit.vim " Enable Matchit plugin
call plug#begin('~/.vim/plugged')

" Plugins
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'kana/vim-textobj-user'
Plug 'glts/vim-textobj-comment'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'scrooloose/syntastic'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Colorschemes
Plug 'morhetz/gruvbox'
Plug 'sjl/badwolf'

call plug#end()

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
" Syntastic {{{

let g:syntastic_mode_map = {
        \ "mode": "passive",
        \ "active_filetypes": ["python", "cpp", "c"],
        \ "passive_filetypes": [] }

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" }}}

" }}}
" General {{{

filetype plugin indent on
set encoding=utf-8 " Set character encoding to Unicode
set modelines=0 " Don't read modelines
set history=1000 " Increase command line history
set autoread " Reload file if changed outside Vim
set ttyfast " I have a fast terminal
set hidden " Hide unsaved buffers
set confirm " Ask to write files when commands fail
set backspace=indent,eol,start " Backspace over everything in insert mode
set nrformats-=octal " Increment numbers with leading zeros correctly
set nojoinspaces " Don't add spaces when joining lines
set complete=.,w,b,u,t,i " Sources for insert mode completion
set wildmenu " Command line completion
set wildmode=longest,list,full " Make completion act like Zsh
set wildignore+=*.git/,*.hg/ " Version control
set wildignore+=*.jpg,*.jpeg,*.png,*.gif,*.bmp " Images
set wildignore+=*.o,*.obj,*.exe,*.dll " Compiled object files
set wildignore+=*.pyc,*.luac " Byte code
set wildignore+=*.bak,*.swp " Backups and swap files
set wildignore+=*.DS_Store " OS X
set shortmess+=aoOtTI " Shortens Vim messages to avoid 'HIT ENTER' prompts
set sidescroll=1 " Show some context when side scrolling
set notimeout ttimeout " Time out on key codes but not mappings
set ttimeoutlen=10 " Time out after 10 milliseconds
set spelllang=en_us " Set language for spell checking
set virtualedit=block " Allow virtual editing in visual block mode

" }}}
" Display {{{

set lazyredraw " Don't redraw screen until the macro has finished
set cmdheight=2 " Avoid Press ENTER prompts
set display=lastline " display the last line even if it's too long
set visualbell t_vb= " Turn off error bells
set showcmd " Show unfinished commands
set showmode " Show current mode
set number " Show line numbers
set splitright " Opens vertical window to the right of current window
set splitbelow " Opens horizontal window bellow current window
set nolist " Show invisible characters
set listchars=tab:▸\ ,trail:.,eol:¬,extends:❯,precedes:❮ " Set invisible characters
set showbreak=… " Shown at the start of the line when wrap is on
set colorcolumn=+1
set cursorline
set laststatus=2 " Always show the status line
set statusline=\ %f\ \|\ %M\ %r%= " File name, modified and readonly flags
set statusline+=%{&fileformat}\ \|\ %{&encoding}\ \|\ %{&filetype} " File information
set statusline+=\ \|\ %l\/%L:%v\ \|\ %P\ " Line and column number and position in file
syntax on " Enable syntax highlighting
set bg=dark
set t_Co=256
colorscheme badwolf

" }}}
" Backups & Undo {{{

set noswapfile " Don't create swap files
set nobackup " Don't create backup files
set nowritebackup " Don't ever create backup files
set undofile " Persistent undo across sessions
set undodir=~/.vim/undo " Set undo directory

" }}}
" Search {{{

set incsearch " Show search results as you type
set hlsearch " Highlight search results
set ignorecase " Ignore case in search patterns
set smartcase " Only ignore case when search pattern is all lowercase
set wrapscan " Continue search after hitting the bottom of the file

" }}}
" Whitespace {{{

set tabstop=8 " Width of literal tab characters
set softtabstop=4 " Amount of whitespace to use in insert mode
set shiftwidth=4 " Amount of whitespace to use in normal mode
set expandtab " Use spaces in space of tabs of tabs
set autoindent " Keep current indentation level when creating new lines
set shiftround " Round indent to multiple of 'shiftwidth'

" }}}
" Wrapping {{{

set nowrap " Don't wrap long lines by default
set linebreak " Don't break words when wrapping
set textwidth=79 " Maximum line length
set formatoptions=qnl1jc " How automatic formatting should be done

" }}}
" Folding {{{

set foldlevelstart=99 " All folds are open by default

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

" Convenience {{{

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

function! ToggleFoldColumn(count) " {{{
    if a:count > 0
        let &foldcolumn=a:count
    else
        if(&foldcolumn)
            let &foldcolumn=0
        else
            let &foldcolumn=4
        endif
    endif
endfunction " }}}
nnoremap <silent> <leader>f :<c-u>call ToggleFoldColumn(v:count)<cr>

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

" }}}
