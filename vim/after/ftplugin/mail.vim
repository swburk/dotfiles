setl spell
setl textwidth=78
setl formatoptions=tn1qaw

" Remove additional quoting levels
nnoremap <silent> <localleader>l :call PreserveSearch(':g/\v^(\s*\>){2,}/d')<cr>
