set guioptions-=T " Don't show toolbar, menu bar, or scroll bars
set guioptions-=m " Don't show menu bar
set guioptions-=rL " Don't show scroll bars
set guioptions+=c " Use console dialogs
set guifont=Source\ Code\ Pro\ 9 " Set default font

" Local config
if filereadable($HOME . "/.gvimrc.local")
    source ~/.gvimrc.local
endif
