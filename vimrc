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
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'

" Colorschemes
Bundle 'sjl/badwolf'
Bundle 'altercation/vim-colors-solarized'
Bundle 'croaky/vim-colors-github'

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
runtime macros/matchit.vim " Match more than just (, { and [
set virtualedit+=block " Put cursor where no character exists

" Backup, swap, and undo
set noswapfile " Don't create swapfiles
set nobackup " Don't make backups
set nowritebackup " Don't write backups
set undofile " Persistent undo across sessions
set undodir=~/tmp " Set undo directory

" Search
set incsearch " Show search results as you type
set hlsearch " Don't highlight search results
set ignorecase " Ignore case in search patterns
set smartcase " Only ignore case when search pattern is all lowercase
set wrapscan " Continue search after hitting the bottom of the file

" Wildmenu completion
set wildmenu " Command line completion
set wildmode=longest,list,full " Make completion act like zsh
set wildignore+=*.jpg,*.jpeg,*.png,*.gif,*.bmp " Images
set wildignore+=*.o,*.exe " Compiled object files
set wildignore+=*.pyc " Python byte code
set wildignore+=*/.git/,*/.hg/ " Version control

" Insert mode completion
set complete=.,w,b,u,t
" set completeopt=

" Display
set cmdheight=2 " Avoid "Press ENTER prompts
set number " Show line numbers
set cursorline " Highlight current line
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

" Syntax
syntax enable " Enable syntax highlighting
set background=dark " Make the background dark
set t_Co=256 " I have a 256-color terminal
colorscheme badwolf " Set colorscheme

" Indentation
set tabstop=4 " Width of literal tab characters
set softtabstop=4 " Amount of whitespace to use in insert mode
set shiftwidth=4 " Amount of whitespace to use in normal mode
set expandtab " Use spaces in space of tabs of tabs
set autoindent " Keep indentation level for new lines
set smartindent " Auto indentation

" Statusline
set laststatus=2 " Always show the statusline
set statusline= " Clear default statusline
set statusline+=\ %f " Filename
set statusline+=\ %r%m " Flags
set statusline+=%= " Set right-side statusline
set statusline+=%y " File type
set statusline+=\ %l/%L " Line number and collumn
set statusline+=\ %P\  " Percentage through file

" Scrolling
set scrolloff=4 " Start scrolling when 4 lines from top or bottom
set sidescrolloff=4
set sidescroll=1 " Show more context when side scrolling

" Folding
set foldmethod=indent " Set foldlevel based on indent level
set foldnestmax=4 " Maximum foldlevel
set foldlevel=4 " Unfold all folds by default

" Wrapping
set nowrap " Don't wrap long lines
set linebreak " Don't break words when wrapping
set textwidth=79 " Maximum line length
set formatoptions= " Clear default setting
set formatoptions+=c " Format comments
set formatoptions+=r " Continue comments by default
set formatoptions+=q " Format comments with gq
set formatoptions+=n " Recognize numbered lists
set formatoptions+=2 " Use indent from second line of a paragraph
set formatoptions+=l " Don't break lines that are already long
set colorcolumn=+1 " Highlight the 80th column

" Mouse
set mouse=a " Enable mouse in all modes
set ttymouse=xterm2 " XTerm mouse codes

" Mappings
" Change <leader> to ','
let mapleader=','

" Toggles
set pastetoggle=<f2>
nnoremap <silent> <f8> :TagbarToggle<cr>
nnoremap <silent> <f2> :NERDTreeToggle<cr>
nnoremap <silent> <leader>o :setlocal spell!<cr>
nnoremap <silent> <leader>w :setlocal wrap!<cr>
nnoremap <silent> <leader>i :setlocal list!<cr>
nnoremap <silent> <leader><space> :nohlsearch<cr>

" Unmap help key
noremap <f1> <nop>
inoremap <f1> <nop>

" Clear trailing whitespace
nnoremap <silent> <leader>t :%s/\s\+$//ge<cr>

" Format text
nnoremap Q gqip
vnoremap Q gq

" Return cursor position when joining lines
nnoremap J mzJ`z

" Split lines
nnoremap S i<cr><esc>

" Stay put on *
nnoremap * *<c-o>

" Substitute
nnoremap <leader>s :%s/

" Buffers
nnoremap <silent> <leader>f :CtrlP<cr>
nnoremap <silent> <leader>b :CtrlPBuffer<cr>
nnoremap <silent> <leader>[ :bprev<cr>
nnoremap <silent> <leader>] :bnext<cr>

" Search tags in current buffer
nnoremap <silent> <leader>c :CtrlPTag<cr>

" cd to the directory of the current buffer
nnoremap <silent> <leader>d :cd %:p:h<cr>

" Visual mode indenting
vnoremap > >gv
vnoremap < <gv

" Switch to alternate file
nnoremap ` <c-^>

" New line above or below current line
nnoremap <leader><cr> o<esc>

" Save as root
cnoremap w!! w !sudo tee % >/dev/null

" Space toggles fold
nnoremap <space> za

" Complete filenames
inoremap <c-f> <c-x><c-f>

" These make more sense
nnoremap Y y$
nnoremap ' `

" Quicker window switching
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" Sane wrapped line navigation
nnoremap j gj
nnoremap k gk
nnoremap $ g$
nnoremap 0 g0
nnoremap ^ g^
vnoremap j gj
vnoremap k gk
vnoremap $ g$
vnoremap 0 g0
vnoremap ^ g^

" Align things in the middle when jumping around
nnoremap n nzz
nnoremap N Nzz
nnoremap g; g;zz
nnoremap g, g,zz
nnoremap <c-o> <c-o>zz
nnoremap <c-i> <c-i>zz

" Autocommands
augroup resize_splits
    autocmd!
    autocmd VimResized * :wincmd =
augroup END

augroup reload_vimrc
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END

augroup markdown
    autocmd!
    autocmd BufRead,BufNewFile *.md set filetype=markdown
    autocmd BufRead,BufNewFile *.md set spell
    autocmd BufRead,BufNewFile *.md set wrap
augroup END

" Colorscheme & plugin settings
" Badwolf
let g:badwolf_html_link_underline = 0

" Ctrl-P
let g:ctrlp_working_path_mode = 'rc'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_extensions = ['tag']
let g:ctrlp_match_window = 'max:20'

" Syntastic
let g:syntastic_mode_map = {
    \ "mode": "active",
    \ "active_filetypes": [],
    \ "passive_filetypes": ['html'] }
let g:syntastic_check_on_open = 1
