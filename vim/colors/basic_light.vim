set background=light
highlight clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name = "basic_light"

highlight Normal ctermfg=black
highlight NonText ctermfg=lightgray
highlight comment ctermfg=darkgray
highlight constant ctermfg=black
highlight string ctermfg=darkgray
highlight identifier ctermfg=black
highlight statement ctermfg=black cterm=bold
highlight define cterm=bold
highlight preproc ctermfg=black
highlight type ctermfg=black cterm=bold
highlight special ctermfg=black
highlight Underlined ctermfg=black cterm=underline
highlight label ctermfg=black
highlight operator ctermfg=black
highlight delimiter ctermfg=darkgray cterm=NONE
highlight ErrorMsg ctermfg=white
highlight WarningMsg ctermfg=black cterm=bold
highlight ModeMsg ctermfg=black
highlight MoreMsg ctermfg=black
highlight Error ctermfg=black
highlight Todo ctermfg=black ctermbg=yellow
highlight Search ctermfg=black ctermbg=yellow
highlight IncSearch ctermfg=black ctermbg=yellow
highlight LineNr ctermfg=black
highlight Cursor ctermfg=black ctermbg=darkgray
highlight CursorLineNr ctermfg=magenta
highlight StatusLine ctermfg=white ctermbg=black cterm=NONE
highlight StatusLineNC ctermfg=black ctermbg=white cterm=NONE
highlight VertSplit ctermfg=black ctermbg=black
highlight Visual term=reverse ctermfg=black ctermbg=lightgray
highlight Folded ctermfg=black ctermbg=white
