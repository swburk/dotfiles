function! PythonFoldExpression(lnum)
    let line = getline(a:lnum)
    let ind = indent(a:lnum)
    let nlnum = nextnonblank(a:lnum + 1)
    let nind = indent(nlnum)

    if line =~ '^\s*\(class\|def\|if\|elif\|else\|for\|while\|try\|except\|with\)\s\='
        let w:cind = ind
        return ">" . (ind / &shiftwidth + 1)
    endif

    if nind <= w:cind
        return "<" . (nind / &shiftwidth + 1)
    endif

    return "="
endfunction

setl foldmethod=expr
setl foldexpr=PythonFoldExpression(v:lnum)
setl foldminlines=2
setl textwidth=72
setl colorcolumn=80
