" General {{{

filetype off
execute pathogen#infect()
filetype plugin indent on
set nocompatible " Disable Vi compatibility
set encoding=utf-8 " Set character encoding to Unicode
set modelines=0 " Don't read modelines
set history=1000 " Increase command line history
set autoread " Reload file if changed outside Vim
set ttyfast " I have a fast terminal
set hidden " Hide unsaved buffers
set backspace=indent,eol,start " Backspace over everything in insert mode
set nrformats-=octal " Increment numbers with leading zeros correctly
set noswapfile " Don't create swapfiles
set nobackup " Don't make backups
set nowritebackup " Don't write backups
set undofile " Persistent undo across sessions
set undodir=~/.vim/undo " Set undo directory
set nojoinspaces " Don't add spaces when joining lines
set complete=
set complete+=. " Complete words from current buffer
set complete+=b " Complete from loaded buffers in the buffer list
set complete+=u " Complete from unloaded buffers in the buffer list
set complete+=] " Complete tags
set wildmenu " Command line completion
set wildmode=longest,list,full " Make completion act like zsh
set wildignore+=.git,.hg " Version control
set wildignore+=*.jpg,*.jpeg,*.png,*.gif,*.bmp " Binary images
set wildignore+=*.o,*.obj,*.exe,*.dll " Compiled object files
set wildignore+=*.pyc " Python byte code
set mouse=a " Enable mouse in all modes
set sidescroll=1 " Show some context when side scrolling
set sidescrolloff=12 " Start scrolling 12 columns from right edge of window
set notimeout ttimeout " Time out on key codes but not mappings
set ttimeoutlen=10 " Time out after 10 miliseconds

" }}}
" Display {{{

set lazyredraw " Don't redraw screen when executing macros
set cmdheight=2 " Avoid Press ENTER prompts
set cursorline " Highlight current line
set display+=lastline " display the last line even if its too long
set visualbell t_vb= " Turn off error bells
set showcmd " Show unfinished commands
set ruler " Show cursor position
set showmode " Show the currently active mode
set nonumber " Don't show line numbers by default
set norelativenumber " Sam for relative line numbers
set splitright " Opens vertical window to the right of current window
set splitbelow " Opens horizontal window bellow current window
set list " Show invisible characters
set listchars=tab:>\ ,eol:¬,extends:>,precedes:< " Set invisible characters
set title " Change the title of the terminal
syntax enable " Enable syntax highlighting
set background=dark " Make the background dark
set t_Co=256 " I have a 256-color terminal
colorscheme badwolf " Set colorscheme

" }}}
" Search {{{

set incsearch " Show search results as you type
set hlsearch " Don't highlight search results
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
set shiftround " Round indent to multiple of shiftwidth

" }}}
" Wrapping {{{

set nowrap " Don't wrap long lines
set linebreak " Don't break words when wrapping
set textwidth=79 " Maximum line length
set formatoptions=
set formatoptions+=q " Format text with gq
set formatoptions+=n " Recognize numbered lists when formatting
set formatoptions+=l " Don't reformat lines that are already long
set formatoptions+=1 " Don't break a line before a one-letter word
set formatoptions+=j " Remove comment leader when joining lines
set formatoptions-=ro " Don't continue comments when making new lines
set colorcolumn=+1 " Highlight the 80th column

" }}}
" Statusline {{{

set laststatus=2 " Always show the statusline
set statusline=
set statusline+=\ %f " Filename
set statusline+=\ %M\  " Modified flag
set statusline+=%= " Align right
set statusline+=%{&filetype}\ \| " File type
set statusline+=\ %l/%L " Line number and column
set statusline+=\ \|\ %P\  " Percentage through file

" }}}
" Folding {{{

set foldenable
set foldlevelstart=0

" Set custom fold text {{{

function! FoldText()
    let gutterwidth = &fdc + (&relativenumber + &number) * &numberwidth
    let windowwidth = winwidth(0) - gutterwidth
    let line = getline(v:foldstart)
    let softtab = strpart('        ', 0, &tabstop)
    let line = substitute(line, '\t', softtab, 'g')
    let foldedlinecount = v:foldend - v:foldstart
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount) - 9
    if foldedlinecount <= fillcharcount
        let fillcharcount = fillcharcount - foldedlinecount
        let fillchars = repeat('-', foldedlinecount) . repeat(' ', fillcharcount)
    else
        let fillchars = repeat('-', fillcharcount)
    endif

    return line . ' ' . fillchars . ' ' . foldedlinecount . ' lines '
endfunction
set foldtext=FoldText()

" }}}

" }}}
" Mappings {{{

" Convenience {{{

" Remap leader
let mapleader=','

" Y yanks to end of line
nnoremap Y y$

" View documentation for word under cursor
nnoremap K :call investigate#Investigate()<cr>

" Undo all unsaved changes
nnoremap <leader>u :e!<cr>

" Unmap help key
noremap <f1> <nop>
vnoremap <f1> <nop>
inoremap <f1> <nop>

" Strip trailing whitespace
nnoremap <silent> <leader><space> mz:%s/\s\+$//ge<cr>:let @/=''<cr>`z

" Return cursor position when joining lines
nnoremap J mzJ`z

" Split line
nnoremap S i<cr><esc>^mzk:silent! s/ \+$/<cr>:nohlsearch<cr>`z

" Quicker command line commands
nnoremap : ;
nnoremap ; :
vnoremap : ;
vnoremap ; :

" Select last changed text
nnoremap <leader>v `[v`]
nnoremap <leader>V `[V`]

" Substitute
nnoremap <leader>s :%s//g<left><left>
vnoremap <leader>s :s//g<left><left>

" Substitute word under cursor
nnoremap <leader>* :%s/\<<c-r><c-w>\>//g<left><left>

" New line below current line
nnoremap <leader><cr> o<esc>

" Save as root
cnoremap w!! w !sudo tee % >/dev/null

" Space toggles fold
nnoremap <space> za
vnoremap <space> za

" Close all other folds
nnoremap <leader>z zMzvzz

" Close buffer
nnoremap <silent> <leader>x :bdelete<cr>

" Select all the text in the buffer
nnoremap <leader>a ggVG

" Reindent the entire buffer
nnoremap <leader>= gg=G

" Complete filenames in insert mode
inoremap <c-f> <c-x><c-f>

" Complete whole lines in insert mode
inoremap <c-l> <c-x><c-l>

" Output syntax highlighting groups for the word under cursor
function! HighlightGroups()
  echo join(map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")'), ", ")
endfunc
nnoremap <leader>g :call HighlightGroups()<CR>

" }}}
" Toggles {{{

set pastetoggle=<leader>p
nnoremap <silent> <leader>S :set spell!<cr>
nnoremap <silent> <leader>w :set wrap!<cr>
nnoremap <silent> <leader>c :set list!<cr>
nnoremap <silent> <leader>/ :nohlsearch<cr>

" Toggle line numbers {{{

function! ToggleLineNumbers()
    if(&relativenumber)
        set norelativenumber
        set number
    elseif(&number)
        set nonumber
    else
        set relativenumber
    endif
endfunc
nnoremap <silent> <leader>n :call ToggleLineNumbers()<cr>

" }}}
" Toggle fold column {{{

function! ToggleFoldColumn()
    if(&foldcolumn)
        set foldcolumn=0
    else
        set foldcolumn=4
    endif
endfunc
nnoremap <silent> <leader>f :call ToggleFoldColumn()<cr>

" }}}

" }}}
" Navigation {{{

" Buffers
nnoremap <silent> <leader>b :CtrlPBuffer<cr>
nnoremap <silent> [b :bprev<cr>
nnoremap <silent> ]b :bnext<cr>

" Always jump to exact position of mark
nnoremap ' `

" Switch to alternate buffer
nnoremap ` <c-^>

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

" Use * and # in visual mode
function! s:VSetSearch()
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = temp
endfunction

vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR><c-o>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR><c-o>

" Align things in the middle when jumping around
nnoremap n nzvzz
nnoremap N Nzvzz
nnoremap g; g;zvzz
nnoremap g, g,zvzz
nnoremap <c-o> <c-o>zvzz
nnoremap <c-i> <c-i>zvzz

" }}}

" }}}
" Autocommands {{{

" Resize splits when the window is resized
autocmd VimResized * :wincmd =

" Only show cursorline in current window
autocmd WinLeave * set nocursorline
autocmd WinEnter * set cursorline

" }}}
" Filetypes {{{

" C {{{

autocmd FileType c setlocal foldmethod=syntax

" }}}
" Markdown {{{

autocmd BufRead,BufNewFile *.md setlocal filetype=markdown
autocmd FileType markdown setlocal spell
autocmd FileType markdown setlocal wrap

" }}}
" CSS {{{

autocmd FileType css setlocal foldmethod=marker
autocmd FileType css setlocal foldmarker={,}

" }}}
" Javascript {{{

autocmd FileType javascript setlocal foldmethod=marker
autocmd FileType javascript setlocal foldmarker={,}

" }}}
" Vim {{{

autocmd FileType vim setlocal foldmethod=marker

" }}}

" }}}
" Plugins {{{

" % matches HTML tags, if, else, etc.
runtime macros/matchit.vim

" Investigate
let g:investigate_use_dash = 1

" Badwolf
let g:badwolf_html_link_underline = 0

" Ctrl-P
if executable('ag')
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    let g:ctrlp_use_caching = 0
endif

" }}}
