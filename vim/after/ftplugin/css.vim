setl foldmethod=marker
setl foldmarker={,}
setl iskeyword+=-
inoremap <buffer> {<cr> {<cr>}<esc>O<esc>zMzvi<tab>
nnoremap <buffer> <leader>r vi{:sort<cr>
