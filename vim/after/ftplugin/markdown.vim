" Modified from Steve Losh's Gist: https://gist.github.com/sjl/1038710
function! MarkdownFoldExpression(lnum)
    let l1 = getline(a:lnum)
    let l2 = getline(a:lnum + 1)

    if l2 =~ '^==\+'
        return '>1'
    elseif l2 =~ '^--\+'
        return '>2'
    elseif l1 =~ '^#'
        return '>'.matchend(l1, '^#\+')
    else
        return '='
    endif
endfunction

setlocal foldmethod=expr
setlocal foldexpr=MarkdownFoldExpression(v:lnum)
setlocal spell
setlocal wrap
