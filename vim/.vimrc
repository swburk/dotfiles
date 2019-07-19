filetype plugin indent on
packadd! matchit
set encoding=utf-8
set noswapfile
set hidden
set backspace=indent,eol,start
set notimeout ttimeout ttimeoutlen=10
set nowrap
set incsearch
set hlsearch
set ignorecase
set smartcase
set tabstop=4
set shiftwidth=0
set autoindent
set shiftround
set showcmd
set ruler
set laststatus=2
set colorcolumn=80
syntax enable
colorscheme desert
let g:netrw_fastbrowse=0

function! MyFoldText()
    let s:line = getline(v:foldstart)
    let s:totalwidth = winwidth(0) - &fdc - max([&rnu, &nu]) * &nuw
    let s:foldedlines = v:foldend - v:foldstart

	" Determine if signcolumn is visible.
	let s:signcolumnwidth = 0
	if exists('*sign_getplaced')
		if &signcolumn ==? 'yes' || (len(sign_getplaced()) && &signcolumn !=? 'no')
			let s:signcolumnwidth = 2
		endif
	endif

	" Replace tabs with spaces.
    let s:line = substitute(s:line, '\t', repeat(' ', &tabstop), 'g')

	" Trim the line to fit within the window.
	let s:maxlinelen = s:totalwidth - len(s:foldedlines) - s:signcolumnwidth - 2
	let s:line = strpart(s:line, 0, s:maxlinelen)

    " Display a character for every folded line.
	let s:fillchar = matchstr(&fillchars, 'fold:\zs.')
    let s:fillchars = s:maxlinelen - len(s:line)
	let s:dashes = repeat(s:fillchar, min([s:foldedlines, s:fillchars]))
	let s:spaces = repeat(' ', s:fillchars - len(s:dashes))

    return s:line . ' ' . s:dashes . s:spaces . ' ' . s:foldedlines
endfunction
set foldtext=MyFoldText()

set pastetoggle=<f2>
nnoremap <silent> <Plug>SplitLine
	\ :silent! keeppatterns s/^\(\s*\)\(.\{-}\)\s*\%#\s*\(.*\)/\1\2\r\1\3/<cr>
	\:silent! call repeat#set("\<Plug>SplitLine")<cr>
nmap S <Plug>SplitLine
nnoremap <tab> <c-^>
nnoremap <cr> za
nnoremap <silent> <space> :nohlsearch<cr>
nnoremap gV `[v`]
nnoremap gs :%s///g<left><left>
xnoremap gs :s///g<left><left>
nnoremap gl :ls<cr>:b<space>
