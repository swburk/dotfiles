setl foldmethod=marker
setl foldmarker={,}

" Reformat JSON
nnoremap <buffer> <localleader>p ^vg_:!python -m json.tool<cr>
vnoremap <buffer> <localleader>p :!python -m json.tool<cr>
