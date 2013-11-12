" Preface {{{

set nocompatible
filetype off
execute pathogen#infect()
filetype plugin indent on

" }}}
" Settings {{{

" General {{{

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
runtime macros/matchit.vim " Match more than just (, { and [
set noswapfile " Don't create swapfiles
set nobackup " Don't make backups
set nowritebackup " Don't write backups
set undofile " Persistent undo across sessions
set undodir=~/.vim/undo " Set undo directory
set cmdheight=2 " Avoid "Press ENTER prompts
set relativenumber " Show relative line numbers
set cursorline " Highlight current line
set display+=lastline " last line will be displayed if too long
set visualbell t_vb= " Turn off error bells
set shortmess=I " Don't display intro message
set showcmd " Show unfinished commands
set ruler " Show cursor position
set showmode " Show the currently active mode
set splitright " Opens vertical window to the right of current window
set splitbelow " Opens horizontal window bellow current window
set list " Show invisible characters
set listchars=tab:▸\ ,trail:· " Set invisible characters
set nojoinspaces " Don't add spaces when joining lines
set wildmenu " Command line completion
set wildmode=longest,list,full " Make completion act like zsh
set wildignore+=*.jpg,*.jpeg,*.png,*.gif,*.bmp " Images
set wildignore+=*.o,*.exe " Compiled object files
set wildignore+=*.pyc " Python byte code
set wildignore+=*/.git/,*/.hg/ " Version control
set mouse=a " Enable mouse in all modes
set sidescroll=1 " Show some context
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
set gdefault " All substitutions

" }}}
" Whitespace {{{

set tabstop=4 " Width of literal tab characters
set softtabstop=4 " Amount of whitespace to use in insert mode
set shiftwidth=4 " Amount of whitespace to use in normal mode
set expandtab " Use spaces in space of tabs of tabs
set autoindent " Keep indentation level for new lines
set shiftround " Round indent to multiple of shiftwidth

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
set statusline+=\ %M " Modified flags
set statusline+=%= " Set right-side statusline
set statusline+=%{&filetype}\ \| " File type
set statusline+=\ %l,%c/%L " Line number and column
set statusline+=\ \|\ %P\  " Percentage through file

" }}}
" Folding {{{

set foldlevelstart=0

function! FoldText()
    let line = getline(v:foldstart)
    let line = substitute(line, '^\s\+', '', 'g')

    let numbercolumnwidth = &fdc + (&relativenumber + &number) * &numberwidth
    let windowwidth = winwidth(0) - numbercolumnwidth
    let foldedlinecount = v:foldend - v:foldstart
    let foldlevel = v:foldlevel - 1
    let fillcharcount = windowwidth - foldlevel - len(line) - len(foldedlinecount) - 9

    if foldlevel > 0
        let fillcharcount = fillcharcount - 1
        let line = repeat("-", foldlevel) . ' ' . line
    endif

    if foldedlinecount <= fillcharcount
        let fillcharcount = fillcharcount - foldedlinecount
        let line = line . ' ' . repeat("-", foldedlinecount) . repeat(" ", fillcharcount) . ' ' . foldedlinecount
    else
        let line = line . ' ' . repeat("-", fillcharcount) . ' ' . foldedlinecount
    endif

    if foldedlinecount == 1
        let line = line . '  line '
    else
        let line = line . ' lines '
    endif

    return line
endfunction
set foldtext=FoldText()

" }}}

" }}}
" Mappings {{{

" Convenience {{{

" Remap leader
let mapleader=','

" Remap leader's original functionality
nnoremap <leader><leader> ,
vnoremap <leader><leader> ,

" Unmap help key
noremap <f1> <nop>
vnoremap <f1> <nop>
inoremap <f1> <nop>

" Toggle relative line numbers
function! ToggleRelativeNumber()
    if(&relativenumber)
        set norelativenumber
        set number
    else
        set nonumber
        set relativenumber
    endif
endfunc
nnoremap <leader>n :call ToggleRelativeNumber()<cr>

" Clear trailing whitespace
nnoremap <silent> <leader><space> :%s/\s\+$//ge<cr>

" Return cursor position when joining lines
nnoremap J mzJ`z

" Split lines
nnoremap S i<cr><esc>

" Increment/decrement
nnoremap + <c-a>
nnoremap - <c-x>

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

" Substitute
nnoremap <leader>s :%s/
vnoremap <leader>s :s/

" Visual mode indenting
vnoremap > >gv
vnoremap < <gv

" New line below current line
nnoremap ]<space> o<esc>
nnoremap [<space> O<esc>

" Save as root
cnoremap w!! w !sudo tee % >/dev/null

" Space toggles fold
nnoremap <space> za
vnoremap <space> za

" Complete filenames in insert mode
inoremap <c-f> <c-x><c-f>

" These make more sense
nnoremap Y y$
nnoremap ' `

" Move to beginning and end of line
nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L $

" }}}
" Toggles {{{

set pastetoggle=<leader>p
nnoremap <silent> <f8> :TagbarToggle<cr>
nnoremap <silent> <f2> :NERDTreeToggle<cr>
nnoremap <silent> <leader>S :set spell!<cr>
nnoremap <silent> <leader>w :set wrap!<cr>
nnoremap <silent> <leader>i :set list!<cr>
nnoremap <silent> <leader>/ :nohlsearch<cr>

" }}}
" Navigation {{{

" Buffers
nnoremap <silent> <leader>b :CtrlPBuffer<cr>
nnoremap <silent> [b :bprev<cr>
nnoremap <silent> ]b :bnext<cr>

" Switch to alternate file
nnoremap ` <c-^>

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

" Filetypes {{{
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

augroup ft_cpp
    autocmd!
    autocmd FileType c setlocal foldmethod=marker foldmarker={,}
augroup END

augroup ft_javascript
    autocmd!
    autocmd FileType javascript setlocal foldmethod=marker foldmarker={,}
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
let g:ctrlp_match_window = 'max:20'

" Tagbar
let g:tagbar_sort = 0
let g:tagbar_compact = 1

" }}}
