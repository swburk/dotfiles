" General {{{

filetype off
exe pathogen#infect()
filetype plugin indent on
set encoding=utf-8 " Set character encoding to Unicode
set modelines=0 " Don't read modelines
set history=1000 " Increase command line history
set autoread " Reload file if changed outside Vim
set ttyfast " I have a fast terminal
set hidden " Hide unsaved buffers
set backspace=indent,eol,start " Backspace over everything in insert mode
set nrformats-=octal " Increment numbers with leading zeros correctly
set nojoinspaces " Don't add spaces when joining lines
set complete=.,b,u,] " Sources for insert mode completion
set wildmenu " Command line completion
set wildmode=longest,list,full " Make completion act like Zsh
set wildignore+=*.git/,*.hg/ " Version control
set wildignore+=*.jpg,*.jpeg,*.png,*.gif,*.bmp " Binary images
set wildignore+=*.o,*.obj,*.exe,*.dll " Compiled object files
set wildignore+=*.pyc " Python byte code
set wildignore+=*.bak,*.swp " Backups and swap files
set wildignore+=*.DS_Store " OS X
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
set showmode " Show the currently active mode
set splitright " Opens vertical window to the right of current window
set splitbelow " Opens horizontal window bellow current window
set nolist " Show invisible characters
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮ " Set invisible characters
set title " Change the title of the terminal
syntax on " Enable syntax highlighting
set t_Co=256 " I have a 256-color terminal
colorscheme badwolf " Set color scheme
set laststatus=2 " Always show the status line
set statusline=%f\ %m%r%=%y[%l/%L][%P] " Set statusline

" }}}
" Backups, Swaps, and Undo {{{

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

set tabstop=4 " Width of literal tab characters
set softtabstop=4 " Amount of whitespace to use in insert mode
set shiftwidth=4 " Amount of whitespace to use in normal mode
set expandtab " Use spaces in space of tabs of tabs
set autoindent " Keep indentation level for new lines
set smartindent " Smarter auto-indenting when creating a new line
set shiftround " Round indent to multiple of 'shiftwidth'

" }}}
" Wrapping {{{

set nowrap " Don't wrap long lines by default
set linebreak " Don't break words when wrapping
set textwidth=79 " Maximum line length
match ErrorMsg '\%80v.' " Highlight the column after 'textwidth'
set formatoptions=qnl1jc " How automatic formatting should be done

" }}}
" Folding {{{

set foldenable " Enable folding
set foldlevelstart=0 " All folds are closed by default

function! FoldText() " {{{
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
    let toolong = windowwidth - len(foldedlinecount) - 9
    if len(line) >= toolong
        let line = strpart(line, 0, toolong)
    endif

    " Display a dash for every folded line
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount) - 9
    if foldedlinecount <= fillcharcount
        let fillcharcount = fillcharcount - foldedlinecount
        let fillchars = repeat('-', foldedlinecount) . repeat(' ', fillcharcount)
    else
        let fillchars = repeat('-', fillcharcount)
    endif

    return line . ' ' . fillchars . ' ' . foldedlinecount . ' lines '
endfunction " }}}
set foldtext=FoldText()

" }}}
" Mappings {{{

" Convenience {{{

let mapleader=','

" Reformat paragraph or visual selection and return to cursor position
nnoremap Q mzgqip`z
vnoremap Q mzgq`z

" Undo unsaved changes
nnoremap U :e!<cr>

" Y yanks to end of line
nnoremap Y y$

" Join lines and return to original cursor position
nnoremap J @='mzJ`z'<cr>

" Split line
nnoremap S i<cr><esc>^mzk:silent! s/ \+$/<cr>:let @/=''<cr>`z

" Space toggles fold
nnoremap <space> za

" Complete filenames/whole lines in insert mode
inoremap <c-f> <c-x><c-f>
inoremap <c-l> <c-x><c-l>

" Save as root
cnoremap w!! w !sudo tee % >/dev/null

" Select last changed text
nnoremap gV `[v`]

" Search with Ag
nnoremap \ :Ag<space>

" Substitute
nnoremap gs :%s//g<left><left>
vnoremap gs :s//g<left><left>

" Strip trailing whitespace
nnoremap <silent> d<space> mz:%s/\s\+$//ge<cr>:let @/=''<cr>`z

" Close all other folds
nnoremap z. zMzvzz

" Open CtrlP in buffer mode
nnoremap <silent> <c-n> :CtrlPBuffer<cr>

" List buffers
nnoremap <leader>l :ls<cr>

" Navigate to directory of current file
nnoremap <leader>c :cd %:p:h<bar>pwd<cr>

" Opening files and directories
nnoremap <silent> <leader>e :e %:p:h<cr>
nnoremap <silent> <leader>h :sp %:p:h<cr>
nnoremap <silent> <leader>v :vsp %:p:h<cr>
nnoremap <silent> <leader>t :tabe %:p:h<cr>

" Delete buffer
nnoremap <silent> <leader>d :bd<cr>

" Delete buffer without changing window layout
function! DeleteBuffer() " {{{
    let s:bnum = bufnr('%')
    let s:cwin = winnr()
    let s:ctab = tabpagenr()
    for i in range(1,tabpagenr('$'))
        exe 'tabn ' . i
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
nnoremap <silent> <leader>i :set list!<cr>
nnoremap <silent> <leader>/ :nohlsearch<cr>

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

" Command line navigation
cnoremap <c-a> <home>
cnoremap <c-e> <end>
cnoremap <c-f> <right>
cnoremap <c-b> <left>

" Always jump to exact position of mark
nnoremap ' `

" Switch to alternate buffer
nnoremap ` <c-^>

" Repeat last f, t, F, or T in reverse
nnoremap <leader><leader> ,
vnoremap <leader><leader> ,

" Quicker window switching
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" Stay put on * and #
nnoremap * *<c-o>
nnoremap g* g*<c-o>
nnoremap # #<c-o>
nnoremap g# g#<c-o>

" Thanks to Scrooloose for visual */# mappings
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

" Resize splits when entering windows and resizing Vim
augroup ResizeWindows
    au!
    autocmd WinEnter,VimResized * :wincmd =
augroup END

" Source $MYVIMRC after saving
augroup SourceVimrc
    au!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END

" }}}
" Plugins {{{

" Matchit {{{

runtime macros/matchit.vim

" }}}
" Netrw {{{

let g:netrw_banner = 0
let g:netrw_sort_sequence = '\/$,*'
let g:netrw_list_hide = join(map(split(&wildignore, ',\*'), '".*" . escape(v:val, ".*$~") . "$"'), ',') . ',^\.\.\=/\=$'

" }}}
" CtrlP {{{

if executable('ag')
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    let g:ctrlp_use_caching = 0
endif

let g:ctrlp_switch_buffer = 0

" }}}
" Ag.vim {{{

let g:aghighlight = 1
let g:agprg = "ag --smart-case --column"
let g:ag_apply_lmappings = 0
let g:ag_apply_qmappings = 0

" }}}

" }}}
