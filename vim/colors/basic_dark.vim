set background=dark
highlight clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name = "basic_dark"

highlight Normal ctermfg=white
highlight NonText ctermfg=darkgray
highlight comment ctermfg=darkgray
highlight constant ctermfg=white
highlight string ctermfg=lightgray
highlight identifier ctermfg=white
highlight statement ctermfg=white cterm=bold
highlight define cterm=bold
highlight preproc ctermfg=white
highlight type ctermfg=white cterm=bold
highlight special ctermfg=white
highlight Underlined ctermfg=white cterm=underline
highlight label ctermfg=white
highlight operator ctermfg=white
highlight delimiter ctermfg=darkgray cterm=NONE
highlight ErrorMsg ctermfg=black
highlight WarningMsg ctermfg=white cterm=bold
highlight ModeMsg ctermfg=white
highlight MoreMsg ctermfg=white
highlight Error ctermfg=white
highlight Todo ctermfg=black ctermbg=yellow
highlight Search ctermfg=black ctermbg=yellow
highlight IncSearch ctermfg=black ctermbg=yellow
highlight LineNr ctermfg=white
highlight Cursor ctermfg=white ctermbg=darkgray
highlight CursorLineNr ctermfg=magenta
highlight StatusLine ctermfg=black ctermbg=white cterm=NONE
highlight StatusLineNC ctermfg=white ctermbg=darkgray cterm=NONE
highlight VertSplit ctermfg=white ctermbg=white
highlight Visual term=reverse ctermfg=white ctermbg=lightgray
highlight Folded ctermfg=white ctermbg=black
