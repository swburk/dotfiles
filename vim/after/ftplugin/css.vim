setlocal foldmethod=marker
setlocal foldmarker={,}
setlocal iskeyword+=-
inoremap <buffer> {<cr> {<cr>}<esc>O<esc>zMzvi<tab>
