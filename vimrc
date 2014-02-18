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
colorscheme muon " Set color scheme
if &diff
    colorscheme github
endif

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
" Status line {{{

set laststatus=2 " Always show the status line
set statusline=
set statusline+=%f " Filename
set statusline+=\ %m " Modified flag
set statusline+=%r " Readonly flag
set statusline+=%= " Right side
set statusline+=%y " File type
set statusline+=[%l/%L] " Line number
set statusline+=[%P] " Position in file

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

let mapleader=','

" The help key is not helpful
nnoremap <f1> <nop>
vnoremap <f1> <nop>
inoremap <f1> <nop>

" Reformat paragraph or selection
nnoremap Q mzgqip`z
vnoremap Q mzgq`z

" Y yanks to end of line
nnoremap Y y$

" Join lines and return to original cursor position
nnoremap J @='mzJ`z'<cr>

" Split line
nnoremap S i<cr><esc>^mzk:silent! s/ \+$/<cr>:let @/=''<cr>`z

" Space toggles fold
nnoremap <space> za

" Create new scroll-bound window one page ahead of current window
nnoremap <silent> <c-w>\ :<c-u>set noscb<cr><c-w>vLjzt:setl scb<cr><c-w>p:setl scb<cr>
nnoremap <silent> <c-w><c-\> :<c-u>set noscb<cr><c-w>vLjzt:setl scb<cr><c-w>p:setl scb<cr>

" Complete filenames/whole lines in insert mode
inoremap <c-f> <c-x><c-f>
inoremap <c-l> <c-x><c-l>

" Uppercase/lowercase word in insert mode
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
nnoremap gs :%s//g<left><left>
vnoremap gs :s//g<left><left>

" Strip trailing whitespace
nnoremap <silent> d<space> mz:%s/\s\+$//ge<cr>:let @/=''<cr>`z

" Align columns of text
vnoremap <silent> c<space> :!column -t<cr>

" Close all other folds
nnoremap z<cr> zMzvzt
nnoremap z. zMzvzz
nnoremap z- zMzvzb

" List buffers
nnoremap <silent> <leader>ls :ls<cr>

" Open CtrlP in buffer mode
nnoremap <silent> <c-n> :CtrlPBuffer<cr>

" Navigate to directory of current file
nnoremap <leader>cd :cd %:p:h<bar>pwd<cr>

" Opening files and directories
nnoremap <silent> <leader>ed :e %:p:h<cr>
nnoremap <silent> <leader>es :sp %:p:h<cr>
nnoremap <silent> <leader>ev :vsp %:p:h<cr>
nnoremap <silent> <leader>et :tabe %:p:h<cr>

function! DeleteBuffer() " {{{
    let s:bnum = bufnr('%')
    let s:cwin = winnr()
    let s:ctab = tabpagenr()
    exe 'tabfirst'
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

function! CycleColorscheme(direction) " {{{
    let s:colors = split(globpath('~/.vim/colors/', '*'), "\n")

    for i in range(len(s:colors))
        let s:colors[i] = fnamemodify(s:colors[i], ':t:r')
        if s:colors[i] == g:colors_name
            let s:colorscheme = i
        endif
    endfor

    if a:direction == 'next'
        for i in range(1, v:count1)
            if s:colorscheme == len(s:colors) - 1
                let s:colorscheme = 0
            else
                let s:colorscheme = s:colorscheme + 1
            endif
        endfor
    elseif a:direction == 'prev'
        for i in range(1, v:count1)
            if s:colorscheme == 0
                let s:colorscheme = -1
            else
                let s:colorscheme = s:colorscheme - 1
            endif
        endfor
    endif
    exe 'colorscheme ' . s:colors[s:colorscheme]
endfunction " }}}
nnoremap <silent> ]c :<c-u>call CycleColorscheme('next')<cr>
nnoremap <silent> [c :<c-u>call CycleColorscheme('prev')<cr>

" }}}
" Navigation {{{

" Cycle through buffer list, idea stolen from unimpared
nnoremap <silent> [b :<c-u><c-r>=v:count1<cr>bprev<cr>
nnoremap <silent> ]b :<c-u><c-r>=v:count1<cr>bnext<cr>

" Cycle through argument list, idea stolen from unimpared
nnoremap <silent> [a :<c-u><c-r>=v:count1<cr>prev<cr>
nnoremap <silent> ]a :<c-u><c-r>=v:count1<cr>next<cr>

" Cycle through quickfix list, idea stolen from unimpared
nnoremap <silent> ]q :<c-u><c-r>=v:count1<cr>cnext<cr>
nnoremap <silent> [q :<c-u><c-r>=v:count1<cr>cprev<cr>

" Command line navigation
cnoremap <c-a> <home>
cnoremap <c-e> <end>
cnoremap <c-f> <right>
cnoremap <c-b> <left>

" Always jump to exact position of mark
nnoremap ' `
vnoremap ' `

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
nnoremap } }zvzz
nnoremap { {zvzz
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
let g:netrw_sort_sequence = '[\/]$,*'
let g:netrw_list_hide = join(map(split(&wildignore, ',\*'), '".*" . escape(v:val, ".*$~") . "$"'), ',') . ',^\.\.\=/\=$'
autocmd FileType netrw nnoremap <buffer> ~ :e ~/<cr>

" }}}
" CtrlP {{{

if executable('ag')
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    let g:ctrlp_use_caching = 0
endif

let g:ctrlp_match_window = 'max:20'
let g:ctrlp_switch_buffer = 0
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

let g:aghighlight = 1
let g:agprg = "ag --smart-case --column"
let g:ag_apply_lmappings = 0
let g:ag_apply_qmappings = 0

" }}}

" }}}
