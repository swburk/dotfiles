function! PythonFoldExpression(lnum)
    let line = getline(a:lnum)
    let ind = indent(a:lnum)
    let nlnum = nextnonblank(a:lnum + 1)
    let nind = indent(nlnum)

    if line =~ '^\s*\(class\|def\)\s\='
        let w:cind = ind
        return ">" . (ind / &sw + 1)
    endif

    if nind <= w:cind
        return "<" . (nind / &sw + 1)
    endif

    return "="
endfunction

setl foldmethod=expr
setl foldexpr=PythonFoldExpression(v:lnum)
