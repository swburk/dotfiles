setl colorcolumn=
setl commentstring=<!---\ %s\ --->

" Make matchit.vim work for Coldfusion
if exists("b:did_ftplugin")
  finish
endif

let b:did_ftplugin = 1

if exists("loaded_matchit")
    
    let b:match_words = '<:>,' .
            \ '<\@<=[ou]l\>[^>]*\%(>\|$\):<\@<=li\>:<\@<=/[ou]l>,' .
            \ '<\@<=dl\>[^>]*\%(>\|$\):<\@<=d[td]\>:<\@<=/dl>,' .
            \ '<\@<=\([^/][^ \t>]*\)[^>]*\%(>\|$\):<\@<=/\1>,'
    syntax sync fromstart

endif " exists("loaded_matchit")
