function! MarkdownFoldExpression()
    let l1 = getline(v:lnum)
    let l2 = getline(v:lnum + 1)

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
setlocal foldexpr=MarkdownFoldExpression()
