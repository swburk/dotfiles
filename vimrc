" General {{{

set nocompatible " Disable Vi compatibility
filetype off
execute pathogen#infect()
filetype plugin indent on
set encoding=utf-8 " Set character encoding to Unicode
set modelines=0 " Don't read modelines
set history=1000 " Increase command line history
set autoread " Reload file if changed outside Vim
set title " Change the title of the terminal
set ttyfast " I have a fast terminal
set lazyredraw " Don't redraw screen when executing macros
set hidden " Hide unsaved buffers
set backspace=indent,eol,start " Backspace over everything in insert mode
set nrformats-=octal " Increment numbers with leading zeros correctly
set noswapfile " Don't create swapfiles
set nobackup " Don't make backups
set nowritebackup " Don't write backups
set undofile " Persistent undo across sessions
set undodir=~/.vim/undo " Set undo directory
set cmdheight=2 " Avoid Press ENTER prompts
set cursorline " Highlight current line
set display+=lastline " last line will be displayed if too long
set visualbell t_vb= " Turn off error bells
set showcmd " Show unfinished commands
set ruler " Show cursor position
set showmode " Show the currently active mode
set splitright " Opens vertical window to the right of current window
set splitbelow " Opens horizontal window bellow current window
set list " Show invisible characters
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,trail:· " Set invisible characters
set nojoinspaces " Don't add spaces when joining lines
set complete=
set complete+=. " Complete words from current buffer
set complete+=b " Complete from loaded buffers in the buffer list
set complete+=u " Complete from unloaded buffers in the buffer list
set complete+=] " Complete tags
set wildmenu " Command line completion
set wildmode=longest,list,full " Make completion act like zsh
set wildignore+=*.jpg,*.jpeg,*.png,*.gif,*.bmp " Images
set wildignore+=*.o,*.obj,*.exe,*.dll " Compiled object files
set wildignore+=*.pyc " Python byte code
set wildignore+=.git,.hg " Version control
set mouse=a " Enable mouse in all modes
set sidescroll=1 " Show some context when side scrolling
set sidescrolloff=12 " Start scrolling 12 columns from right edge of window

" }}}
" Colors {{{

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
set statusline+=\ %M\  " Modified flags
set statusline+=%= " Set right-side statusline
set statusline+=%{&filetype}\ \| " File type
set statusline+=\ %l,%c/%L " Line number and column
set statusline+=\ \|\ %P\  " Percentage through file

" }}}
" Folding {{{

set foldenable
set foldlevelstart=0

" Set custom fold text {{{

function! FoldText()
    let gutterwidth = &fdc + (&relativenumber + &number) * &numberwidth
    let windowwidth = winwidth(0) - gutterwidth
    let line = getline(v:foldstart) . ' '
    let foldedlines = v:foldend - v:foldstart . ' lines '
    let fillcharcount = windowwidth - len(line) - len(foldedlines) - 1
    if foldedlines <= fillcharcount
        let fillcharcount = fillcharcount - foldedlines
        let fillchars = repeat("-", foldedlines) . repeat(" ", fillcharcount) . ' '
    else
        let fillchars = repeat("-", fillcharcount) . ' '
    endif

    return line . fillchars . foldedlines
endfunction
set foldtext=FoldText()

" }}}

" }}}
" Mappings {{{

" Time out on key codes but not mappings
set notimeout
set ttimeout
set ttimeoutlen=10

" Convenience {{{

" Remap leader
let mapleader=','

" Y yanks to end of line
nnoremap Y y$

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

" Split lines
nnoremap S i<cr><esc>^mzk:silent! s/ \+$/<cr>:nohlsearch<cr>`z

" Quicker command line commands
nnoremap : ;
nnoremap ; :
vnoremap : ;
vnoremap ; :

" Stay put on * and #
nnoremap * *<c-o>
nnoremap g* g*<c-o>
nnoremap # #<c-o>
nnoremap g# g#<c-o>

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

" Focus current fold
nnoremap <leader>z zMzvzz

" Close buffers
nnoremap <silent> <leader>x :bdelete<cr>

" Select all the text in the buffer
nnoremap <leader>a ggVG

" Reindent the entire document
nnoremap <leader>= gg=G

" Complete filenames in insert mode
inoremap <c-f> <c-x><c-f>

" Complete whole lines in insert mode
inoremap <c-l> <c-x><c-l>

" Output syntax highlighting groups for the word under cursor
function! SynStack()
  echo join(map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")'), ", ")
endfunc
nnoremap <leader>g :call SynStack()<CR>

" }}}
" Toggles {{{

set pastetoggle=<leader>p
nnoremap <silent> <leader>S :set spell!<cr>
nnoremap <silent> <leader>w :set wrap!<cr>
nnoremap <silent> <leader>c :set list!<cr>
nnoremap <silent> <leader>/ :nohlsearch<cr>

" Toggle line numbers {{{

function! ToggleNumbers()
    if(&relativenumber)
        set norelativenumber
        set number
    elseif(&number)
        set nonumber
    else
        set relativenumber
    endif
endfunc
nnoremap <silent> <leader>n :call ToggleNumbers()<cr>

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

" Switch to alternate file
nnoremap ` <c-^>

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

" }}}

" }}}
" Autocommands {{{

if has("autocmd")
    " Resize splits when the window is resized
    augroup resize_splits
        autocmd!
        autocmd VimResized * :wincmd =
    augroup END

    " Source vimrc after it has been saved
    augroup reload_vimrc
        autocmd!
        autocmd BufWritePost $MYVIMRC source $MYVIMRC
    augroup END

    " Only show cursorline in current window
    augroup move_cursorline
        autocmd!
        autocmd WinLeave * set nocursorline
        autocmd WinEnter * set cursorline
    augroup END

    " Don't show trailing whitespace when in insert mode
    augroup show_traling_whitespace
        autocmd!
        autocmd InsertEnter * set listchars-=trail:·
        autocmd InsertLeave * set listchars+=trail:·
    augroup END

    augroup ft_markdown
        autocmd!
        autocmd BufRead,BufNewFile *.md setlocal filetype=markdown
        autocmd FileType markdown setlocal spell
        autocmd FileType markdown setlocal wrap
    augroup END

    augroup ft_vim
        autocmd!
        autocmd FileType vim setlocal foldenable
        autocmd FileType vim setlocal foldmethod=marker
    augroup END
endif

" }}}
" Plugins {{{

" % matches HTML tags, if, else, etc.
runtime macros/matchit.vim

" Badwolf
let g:badwolf_html_link_underline = 0

" Ctrl-P
if executable('ag')
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    let g:ctrlp_use_caching = 0
endif

" }}}
