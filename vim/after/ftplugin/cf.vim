setl colorcolumn=
set softtabstop=2
set shiftwidth=2
setlocal commentstring=<!---\ %s\ --->

if exists("b:did_ftplugin")
    finish
endif
let b:did_ftplugin = 1

if exists("loaded_matchit")
    let b:match_ignorecase = 1
    let b:match_words = '<:>,' .
    \ '<\@<=[ou]l\>[^>]*\%(>\|$\):<\@<=li\>:<\@<=/[ou]l>,' .
    \ '<\@<=dl\>[^>]*\%(>\|$\):<\@<=d[td]\>:<\@<=/dl>,' .
    \ '<\@<=\([^/][^ \t>]*\)[^>]*\%(>\|$\):<\@<=/\1>'
    syntax sync fromstart
endif
