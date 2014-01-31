" General {{{

filetype off
execute pathogen#infect()
filetype plugin indent on
set encoding=utf-8 " Set character encoding to Unicode
set modelines=0 " Don't read modelines
set history=1000 " Increase command line history
set autoread " Reload file if changed outside Vim
set ttyfast " I have a fast terminal
set hidden " Hide unsaved buffers
set backspace=indent,eol,start " Backspace over everything in insert mode
set nrformats-=octal " Increment numbers with leading zeros correctly
set noswapfile " Don't create swap files
set nobackup " Don't create backup files
set nowritebackup " Don't write backup files
set undofile " Persistent undo across sessions
set undodir=~/.vim/undo " Set undo directory
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
set printoptions=header:0,collate:y,paper:letter " Options used by :hardcopy

" }}}
" Display {{{

set lazyredraw " Don't redraw screen when executing macros
set cmdheight=2 " Avoid Press ENTER prompts
set cursorline " Highlight current line
set display=lastline " display the last line even if it's too long
set visualbell t_vb= " Turn off error bells
set showcmd " Show unfinished commands
set showmode " Show the currently active mode
set winwidth=86 " Minimum window width
set splitright " Opens vertical window to the right of current window
set splitbelow " Opens horizontal window bellow current window
set list " Show invisible characters
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮ " Set invisible characters
set title " Change the title of the terminal
set shortmess=I " Don't show startup message
syntax on " Enable syntax highlighting
set t_Co=256 " I have a 256-color terminal
colorscheme badwolf " Set color scheme

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
set colorcolumn=+1 " Highlight the column after 'textwidth'
set formatoptions=qnl1j " How automatic formatting should be done

" }}}
" Status line {{{

set laststatus=2 " Always show the status line
set statusline=
set statusline+=\ %f " Filename
set statusline+=\ %M\  " Modified flag
set statusline+=%= " Right side
set statusline+=%{&filetype}\ \| " File type
set statusline+=\ %l/%L " Line number
set statusline+=\ \|\ %P\  " Position in file

" }}}
" Folding {{{

set foldenable " Enable folding
set foldlevelstart=0 " All folds are closed by default
set foldminlines=2 " Don't fold single lines

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

" Remap leader
let mapleader=','

" Reload changed file
nnoremap <silent> <f1> :<c-u>checktime<cr>

" The help key isn't helpful
vnoremap <f1> <nop>
inoremap <f1> <nop>

" Y yanks to end of line
nnoremap Y y$

" Split line
nnoremap S i<cr><esc>^mzk:silent! s/ \+$/<cr>:let @/=''<cr>`z

" Space toggles fold
nnoremap <space> za

" Create new scroll-bound window one page ahead of current window
noremap <silent> <c-w>\ :<c-u>set noscb<cr><c-w>vLjzt:setl scb<cr><c-w>p:setl scb<cr>
noremap <silent> <c-w><c-\> :<c-u>set noscb<cr><c-w>vLjzt:setl scb<cr><c-w>p:setl scb<cr>

" Complete filenames and lines in insert mode
inoremap <c-f> <c-x><c-f>
inoremap <c-l> <c-x><c-l>

" Uppercase word
inoremap <c-b> <esc>mzgUiw`za
inoremap <c-l> <esc>mzguiw`za

" Save as root
cnoremap w!! w !sudo tee % >/dev/null

" Select last changed text
nnoremap gV `[v`]

" Increment/decrement numbers
nnoremap + <c-a>
nnoremap - <c-x>

" Search with Ag
nnoremap \ :Ag<space>

" Substitute
nnoremap <bar> :%s//g<left><left>
vnoremap <bar> :s//g<left><left>

" Strip trailing whitespace
nnoremap <silent> d<space> mz:%s/\s\+$//ge<cr>:let @/=''<cr>`z

" Close all other folds
nnoremap z<cr> zMzvzt
nnoremap z. zMzvzz
nnoremap z- zMzvzb

" Open CtrlP in buffer mode
nnoremap <silent> <c-n> :CtrlPBuffer<cr>

" Opening files and directories
nnoremap <silent> <leader>ee :e %:p:h<cr>
nnoremap <silent> <leader>es :sp %:p:h<cr>
nnoremap <silent> <leader>ev :vsp %:p:h<cr>
nnoremap <silent> <leader>et :tabe %:p:h<cr>

" Delete buffer without messing up splits
nnoremap <leader>d :b#<bar>bd#<cr>

" }}}
" Toggles {{{

set pastetoggle=<leader>p
nnoremap <silent> <leader>c :set spell!<cr>
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

" Cycle through buffer list, idea stolen from unimpared
nnoremap <silent> [b :<c-u><c-r>=v:count<cr>bprev<cr>
nnoremap <silent> ]b :<c-u><c-r>=v:count<cr>bnext<cr>

" Cycle through argument list, idea stolen from unimpared
nnoremap <silent> [a :<c-u><c-r>=v:count<cr>prev<cr>
nnoremap <silent> ]a :<c-u><c-r>=v:count<cr>next<cr>

" Cycle through quickfix list, idea stolen from unimpared
nnoremap <silent> ]q :<c-u><c-r>=v:count<cr>cnext<cr>
nnoremap <silent> [q :<c-u><c-r>=v:count<cr>cprev<cr>
 
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

" Align things in the middle when jumping around
nnoremap n nzvzz
nnoremap N Nzvzz
nnoremap g; g;zvzz
nnoremap g, g,zvzz
nnoremap <c-o> <c-o>zvzz
nnoremap <c-i> <c-i>zvzz

" Stay put on * and #
nnoremap * *<c-o>
nnoremap g* g*<c-o>
nnoremap # #<c-o>
nnoremap g# g#<c-o>

function! s:VSetSearch() " {{{
    let temp = @@
    norm! gvy
    let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
    let @@ = temp
endfunction " }}}
vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR><c-o>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR><c-o>

" }}}

" }}}
" Autocommands {{{

" Resize splits when entering windows and resizing Vim
augroup ResizeWindows
    au!
    autocmd WinEnter,VimResized * :wincmd =
augroup END

" Only show cursor line in current window
augroup ShowCursorLine
    au!
    autocmd WinLeave * set nocursorline
    autocmd WinEnter * set cursorline
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

" Don't show the help banner
let g:netrw_banner = 0

" Sort directories first
let g:netrw_sort_sequence = '[\/]$,*'

" Files to hid, modified from vim-vinegar
let g:netrw_list_hide = join(map(split(&wildignore, ',\*'), '".*" . escape(v:val, ".*$~") . "$"'), ',') . ',^\.\.\=/\=$'

" Navigate to home directory
autocmd FileType netrw nnoremap <buffer> ~ :e ~/<cr>

" }}}
" CtrlP {{{

" Use Ag to list files
if executable('ag')
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    let g:ctrlp_use_caching = 0
endif

" Max match window height
let g:ctrlp_match_window = 'max:20'

" Don't switch to already open files
let g:ctrlp_switch_buffer = 0

" Edit CtrlP prompt mappings
let g:ctrlp_prompt_mappings = {
    \ 'PrtSelectMove("j")': ['<c-j>', '<down>', '<s-tab>'],
    \ 'PrtSelectMove("k")': ['<c-k>', '<up>', '<tab>'],
    \ 'ToggleFocus()': ['<c-tab>'],
    \ }

" Custom CtrlP status line
let g:ctrlp_status_func = {
    \ 'main': 'CtrlPStatusMain',
    \ 'prog': 'CtrlPStatusProg',
    \ }

function! CtrlPStatusMain(...) " {{{
    let focus = ' ' . a:1 . ' '
    let item = '(' . a:5 . ')'
    let marked = ' marked:' . substitute(a:7, '\s\|<\|>', '', 'g')
    let dir = ' %=%<' . getcwd() . ' '

    return focus . item . marked . dir
endfunction " }}}

function! CtrlPStatusProg(...) " {{{
    let len = ' ' . a:1
    let dir = ' %=%<' . getcwd() . ' '

    return len . dir
endfunction " }}}

" }}}
" Ag.vim {{{

" Highlight search results
let g:aghighlight = 1

" Ignore case unless search term contains capitals
let g:agprg = "ag --smart-case --column"

" Don't use custom mappings in location or quickfix list
let g:ag_apply_lmappings = 0
let g:ag_apply_qmappings = 0

" }}}

" }}}
