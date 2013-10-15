set nocompatible " Disable Vi compatibility
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Plugins
Bundle 'gmarik/vundle'
Bundle 'tomtom/tcomment_vim'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'majutsushi/tagbar'
Bundle 'kien/ctrlp.vim'
Bundle 'SirVer/ultisnips'
" Bundle 'scrooloose/syntastic'

" Colorschemes
Bundle 'sjl/badwolf'
Bundle 'altercation/vim-colors-solarized'

" General settings
filetype plugin indent on " Enable filetype detection and plugins
set encoding=utf-8 " Set character encoding to Unicode
set history=1000 " Increase command line history
set autoread " Reload file if changed outside Vim
set title " Change the title of the terminal
set ttyfast " I have a fast terminal
set lazyredraw " Don't redraw screen when executing macros
set hidden " Hide unsaved buffers
set backspace=indent,eol,start " Backspace over everything in insert mode
set nrformats-=octal " Increment numbers with leading zeros correctly

" Backup, swap, and undo
set noswapfile " Don't create swapfiles
set nobackup " Don't make backups
set nowritebackup " Don't write backups
set undofile " Persistent undo across sessions
set undodir=~/tmp " Set undo directory

" Search
set incsearch " Show search results as you type
set nohlsearch " Don't highlight search results
set ignorecase " Ignore case in search patterns
set smartcase " Only ignore case when search pattern is all lowercase
set wrapscan " Continue search after hitting the bottom of the file

" Completion
set wildmenu " Command line completion
set wildmode=longest,list,full " Make completion act like zsh
set wildignore+=*.jpg,*.jpeg,*.png,*.gif,*.bmp " Binary images
set wildignore+=*.o,*.exe " Compiled object files
set wildignore+=*.pyc " Python byte code
set wildignore+=*/.git/,*/.hg/ " Version control

" Display
set number " Show line numbers
set cursorline " Highlight current line
set linebreak " Don't break words when wrapping
set display+=lastline " last linea will be displayed if too long
set visualbell t_vb= " Turn off error bells
set shortmess=I " Don't display intro message
set showcmd " Show unfinished commands
set showmode " Show the currently active mode
set splitright " Opens vertical window to the right of current window
set splitbelow " Opens horizontal window bellow current window
set list " Show invisible characters
set listchars=tab:>\ ,trail:. " Set invisible characters
set nojoinspaces " Don't add spaces when joining lines
set guicursor=a:blinkon0 " Disable cursor blink

" Syntax
syntax enable " Enable syntax highlighting
set background=dark " Make the background dark
set t_Co=256 " I have a 256-color terminal
colorscheme solarized " Set colorscheme

" Indentation
set tabstop=4 " Width of tab characters
set softtabstop=4 " Amount of whitespace to use for insert mode commands
set shiftwidth=4 " Amount of whitespace to use for normal mode commands
set expandtab " Use spaces in space of tabs of tabs
set autoindent " Keep indentation level for new lines
set smartindent " Auto indentation

" Statusline
set laststatus=2 " Always show the statusline
set statusline= " Clear default statusline
set statusline+=\ %f\ %y%r%m " filename, filetype, readonly, and modified
set statusline+=%= " Set right-side statusline
set statusline+=L:%l/%L\ C:%02c\ " Line number and collumn

" Scrolling
set scrolloff=4 " Start scrolling when 4 lines from top or bottom
set sidescroll=1 " Show more context when side scrolling

" Folding
set foldmethod=indent " Set foldlevel based on indent level
set foldnestmax=3 " Maximum foldlevel
set foldlevel=3 " Unfold all folds by default

" Wrapping
set nowrap " Don't wrap long lines
set textwidth=79 " Maximum line length
set formatoptions=
set formatoptions+=c " Format comments
set formatoptions+=r " Continue comments by default
set formatoptions+=o " Make comment when using o or O from comment line
set formatoptions+=q " Format comments with gq
set formatoptions+=n " Recognize numbered lists
set formatoptions+=2 " Use indent from second line of a paragraph
set formatoptions+=l " Don't break lines that are already long
set formatoptions+=1 " Break before one-letter words
set colorcolumn=80 " Highlight the 80th column

" Mappings
" Change <leader> to '-'
let mapleader=','

" Map paste toggle
set pastetoggle=<leader>p

" Toggles
nnoremap <silent> <leader>t :TagbarToggle<cr>
nnoremap <silent> <leader>s :setlocal spell!<cr>
nnoremap <silent> <leader>w :setlocal wrap!<cr>
nnoremap <silent> <leader>c :setlocal list!<cr>

" Clear trailing whitespace
nnoremap <silent> <leader><space> :%s/\s\+$//ge<cr>

" Buffers
nnoremap <silent> <leader>f :CtrlP<cr>
nnoremap <silent> <leader>b :CtrlPBuffer<cr>
nnoremap <silent> <leader>[ :bprev<cr>
nnoremap <silent> <leader>] :bnext<cr>

" Switch to alternate file
nnoremap <leader>a <c-^>

" New line above or below current line
nnoremap <cr> o<esc>
nnoremap <leader><cr> O<esc>

" Save as root
command! W :execute 'w !sudo tee % >/dev/null'

" Space toggles fold
nnoremap <space> za

" These make more sense
nnoremap Y y$
nnoremap ' `

" Quicker window switching
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" Autocommands
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

augroup markdown " {
    autocmd!
    autocmd BufRead,BufNewFile *.md set filetype=markdown
    autocmd BufRead,BufNewFile *.md set spell
    autocmd BufRead,BufNewFile *.md set wrap
augroup END " }
