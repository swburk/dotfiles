" Preface {{{

set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
filetype plugin indent on

" }}}
" Vundle {{{

" Plugins {{{
"
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

" }}}
" Colorschemes {{{
"
Bundle 'sjl/badwolf'
Bundle 'altercation/vim-colors-solarized'
Bundle 'croaky/vim-colors-github'

" }}}

" }}}
" Settings {{{

" General {{{

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
set noswapfile " Don't create swapfiles
set nobackup " Don't make backups
set nowritebackup " Don't write backups
set undofile " Persistent undo across sessions
set undodir=~/tmp " Set undo directory
set cmdheight=2 " Avoid "Press ENTER prompts
set number " Show line numbers
set cursorline " Highlight current line
set display+=lastline " last linea will be displayed if too long
set visualbell t_vb= " Turn off error bells
set shortmess=I " Don't display intro message
set showcmd " Show unfinished commands
set ruler " Show cursor position
set showmode " Show the currently active mode
set splitright " Opens vertical window to the right of current window
set splitbelow " Opens horizontal window bellow current window
set list " Show invisible characters
set listchars=tab:>\ ,trail:. " Set invisible characters
set nojoinspaces " Don't add spaces when joining lines
set wildmenu " Command line completion
set wildmode=longest,list,full " Make completion act like zsh
set wildignore+=*.jpg,*.jpeg,*.png,*.gif,*.bmp " Images
set wildignore+=*.o,*.exe " Compiled object files
set wildignore+=*.pyc " Python byte code
set wildignore+=*/.git/,*/.hg/ " Version control
set scrolloff=4 " Start scrolling when 4 lines from top or bottom
set sidescrolloff=4
set sidescroll=1 " Show more context when side scrolling
set mouse=a " Enable mouse in all modes
set ttymouse=xterm2 " XTerm mouse codes

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
set smartindent " Auto indentation

" }}}
" Wrapping {{{

set nowrap " Don't wrap long lines
set linebreak " Don't break words when wrapping
set textwidth=79 " Maximum line length
set formatoptions=
set formatoptions+=c " Format comments
set formatoptions+=r " Continue comments by default
set formatoptions+=o " Make comment when using o or O from commented line
set formatoptions+=q " Format comments with gq
set formatoptions+=n " Recognize numbered lists
set formatoptions+=2 " Use indent from second line of a paragraph
set formatoptions+=l " Don't break lines that are already long
set colorcolumn=+1 " Highlight the 80th column

" }}}
" Statusline {{{

set laststatus=2 " Always show the statusline
set statusline=
set statusline+=\ %f " Filename
set statusline+=\ %r%m " Flags
set statusline+=%= " Set right-side statusline
set statusline+=%y " File type
set statusline+=\ %l/%L " Line number and collumn
set statusline+=\ %P\  " Percentage through file

" }}}

" }}}
" Mappings {{{

" Change <leader> to ','
let mapleader=','

" Toggles
set pastetoggle=<leader>p
nnoremap <silent> <f8> :TagbarToggle<cr>
nnoremap <silent> <f2> :NERDTreeToggle<cr>
nnoremap <silent> <leader>S :setlocal spell!<cr>
nnoremap <silent> <leader>w :setlocal wrap!<cr>
nnoremap <silent> <leader>i :setlocal list!<cr>
nnoremap <silent> <leader>/ :nohlsearch<cr>

" Unmap help key
noremap <f1> <nop>
vnoremap <f1> <nop>
inoremap <f1> <nop>

" Clear trailing whitespace
nnoremap <silent> <leader><space> :%s/\s\+$//ge<cr>

" Return cursor position when joining lines
nnoremap J mzJ`z

" Increment/decrement
nnoremap + <c-a>
nnoremap - <c-x>

" Split lines
nnoremap S i<cr><esc>

" Select all
map <leader>a ggVG

" Stay put on * and #
nnoremap * *<c-o>
nnoremap g* g*<c-o>
nnoremap # #<c-o>
nnoremap g# g#<c-o>

" Substitute
nnoremap <leader>s :%s/

" Buffers
nnoremap <silent> <leader>f :CtrlP<cr>
nnoremap <silent> <leader>b :CtrlPBuffer<cr>
nnoremap <silent> [b :bprev<cr>
nnoremap <silent> ]b :bnext<cr>

" Search tags in current buffer
nnoremap <silent> <leader>t :CtrlPTag<cr>

" Visual mode indenting
vnoremap > >gv
vnoremap < <gv

" Switch to alternate file
nnoremap ` <c-^>

" New line above current line
nnoremap <leader><cr> o<esc>

" Save as root
cnoremap w!! w !sudo tee % >/dev/null

" Space toggles fold
nnoremap <space> za

" Complete filenames in insert mode
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

" }}}
" Autocommands {{{

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

" Filetype-specific settings {{{
augroup ft_markdown
    autocmd!
    autocmd BufRead,BufNewFile *.md setlocal filetype=markdown
    autocmd FileType markdown setlocal spell
    autocmd FileType markdown setlocal wrap
augroup END

augroup ft_c
    autocmd!
    autocmd FileType c setlocal foldmethod=marker foldmarker={,}
augroup END

augroup ft_javascript
    autocmd!
    autocmd FileType javascript setlocal foldmethod=marker foldmarker={,}
augroup END

augroup ft_css
    autocmd!
    autocmd FileType css setlocal foldmethod=marker foldmarker={,}
augroup END

augroup ft_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" }}}

" }}}
" Plugin settings {{{

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

" }}}
