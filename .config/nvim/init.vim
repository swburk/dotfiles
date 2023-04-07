set undofile
set nowrap
set ignorecase
set smartcase
set tabstop=4
set shiftwidth=0
set shiftround
set formatoptions=cqj
set number
colorscheme catppuccin

nnoremap <Plug>(SplitLine)
	\ <cmd>keeppatterns s/\v^(\s*)(.{-})\s*%#\s*(.*)/\1\2\r\1\3/<bar>
	\call repeat#set("\<Plug>(SplitLine)")<cr>
nmap S <Plug>(SplitLine)
nnoremap <tab> <c-^>
nnoremap gV `[v`]
nnoremap gs :%s///g<left><left>
xnoremap gs :s///g<left><left>
nnoremap gl <cmd>ls<cr>:b<space>
cnoremap %% <c-r>=fnameescape(expand('%:h')).'/'<cr>
