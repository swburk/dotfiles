"  _               _                 _  __
" | |__   __ _  __| | __      _____ | |/ _|
" | '_ \ / _` |/ _` | \ \ /\ / / _ \| | |_
" | |_) | (_| | (_| |  \ V  V / (_) | |  _|
" |_.__/ \__,_|\__,_|   \_/\_/ \___/|_|_|
"
" Author: Steve Losh <steve@stevelosh.com>
" Modified By: Sam Burk <sam@samburk.com>
"
" Supporting code -------------------------------------------------------------
" Preamble {{{

set background=dark

hi clear

if exists("syntax_on")
    syntax reset
endif

let colors_name = "badwolf"

" }}}
" Palette {{{

" Colors:
"  plain:           #f8f6f2,  15
"  snow:            #ffffff,  15
"  coal:            #000000,  16
"  brightgravel:    #d9cec3,  252
"  lightgravel:     #998f84,  245
"  gravel:          #857f78,  243
"  mediumgravel:    #666462,  241
"  deepgravel:      #45413b,  238
"  deepergravel:    #35322d,  236
"  darkgravel:      #242321,  235
"  blackgravel:     #1c1b1a,  233
"  blackestgravel:  #141413,  232
"  dalespale:       #fade3e,  221
"  dirtyblonde:     #f4cf86,  222
"  taffy:           #ff2c4b,  196
"  saltwatertaffy:  #8cffba,  121
"  tardis:          #0a9dff,  39
"  orange:          #fd971f,  208
"  lime:            #aeee00,  154
"  purple:          #ae81ff,  135
"  dress:           #ff9eb8,  211
"  toffee:          #b88853,  137
"  coffee:          #c7915b,  173
"  darkroast:       #88633f,  95

let s:bwc = {}
let s:bwc.plain = ['f8f6f2', 15]
let s:bwc.snow = ['ffffff', 15]
let s:bwc.coal = ['000000', 16]
let s:bwc.brightgravel = ['d9cec3', 252]
let s:bwc.lightgravel = ['998f84', 245]
let s:bwc.gravel = ['857f78', 243]
let s:bwc.mediumgravel = ['666462', 241]
let s:bwc.deepgravel = ['45413b', 238]
let s:bwc.deepergravel = ['35322d', 236]
let s:bwc.darkgravel = ['242321', 235]
let s:bwc.blackgravel = ['1c1b1a', 233]
let s:bwc.blackestgravel = ['141413', 232]
let s:bwc.dalespale = ['fade3e', 221]
let s:bwc.dirtyblonde = ['f4cf86', 222]
let s:bwc.taffy = ['ff2c4b', 196]
let s:bwc.saltwatertaffy = ['8cffba', 121]
let s:bwc.tardis = ['0a9dff', 39]
let s:bwc.orange = ['ffa724', 214]
let s:bwc.lime = ['aeee00', 154]
let s:bwc.purple = ['ae81ff', 135]
let s:bwc.dress = ['ff9eb8', 211]
let s:bwc.toffee = ['b88853', 137]
let s:bwc.coffee = ['c7915b', 173]
let s:bwc.darkroast = ['88633f', 95]

" }}}
" Highlighting Function {{{
function! s:HL(group, fg, ...)
    " Arguments: group, guifg, guibg, gui, guisp

    let histring = 'hi ' . a:group . ' '

    if strlen(a:fg)
        if a:fg == 'fg'
            let histring .= 'guifg=fg ctermfg=fg '
        else
            let c = get(s:bwc, a:fg)
            let histring .= 'guifg=#' . c[0] . ' ctermfg=' . c[1] . ' '
        endif
    endif

    if a:0 >= 1 && strlen(a:1)
        if a:1 == 'bg'
            let histring .= 'guibg=bg ctermbg=bg '
        else
            let c = get(s:bwc, a:1)
            let histring .= 'guibg=#' . c[0] . ' ctermbg=' . c[1] . ' '
        endif
    endif

    if a:0 >= 2 && strlen(a:2)
        let histring .= 'gui=' . a:2 . ' cterm=' . a:2 . ' '
    endif

    if a:0 >= 3 && strlen(a:3)
        let c = get(s:bwc, a:3)
        let histring .= 'guisp=#' . c[0] . ' '
    endif

    " echom histring

    execute histring
endfunction
" }}}

" Actual colorscheme ----------------------------------------------------------
" Vanilla Vim {{{

" General/UI {{{

call s:HL('Normal', 'plain', 'blackgravel')
call s:HL('Folded', 'mediumgravel', 'bg', 'none')
" call s:HL('VertSplit', 'lightgravel', 'bg', 'none')
call s:HL('VertSplit', 'deepgravel', 'deepgravel', 'none')
call s:HL('CursorLine', '', 'darkgravel', 'none')
call s:HL('CursorColumn', '', 'darkgravel')
call s:HL('ColorColumn', '', 'darkgravel')
call s:HL('TabLine', 'plain', 'blackgravel', 'none')
call s:HL('TabLineFill', 'plain', 'blackgravel', 'none')
call s:HL('TabLineSel', 'coal', 'tardis', 'none')
call s:HL('MatchParen', 'darkgravel', 'tardis', 'bold')
call s:HL('NonText', 'deepgravel', 'bg')
call s:HL('SpecialKey', 'deepgravel', 'bg')
call s:HL('Visual', '', 'deepgravel')
call s:HL('VisualNOS', '', 'deepgravel')
call s:HL('Search', 'coal', 'dalespale', 'bold')
call s:HL('IncSearch', 'coal', 'tardis', 'bold')
call s:HL('Underlined', 'fg', '', 'underline')
call s:HL('StatusLine', 'coal', 'tardis', 'bold')
call s:HL('StatusLineNC', 'snow', 'deepgravel', 'bold')
call s:HL('Directory', 'dirtyblonde', '', 'bold')
call s:HL('Title', 'lime')
call s:HL('ErrorMsg', 'taffy', 'bg', 'bold')
call s:HL('MoreMsg', 'dalespale', '', 'bold')
call s:HL('ModeMsg', 'dirtyblonde', '', 'bold')
call s:HL('Question', 'dirtyblonde', '', 'bold')
call s:HL('WarningMsg', 'dress', '', 'bold')
call s:HL('LongLine', 'snow', 'taffy', '')
call s:HL('Tag', '', '', 'bold')
call s:HL('WildMenu', 'coal', 'dalespale', 'bold')

" }}}
" Gutter {{{

call s:HL('LineNr', 'mediumgravel', 'blackgravel')
call s:HL('SignColumn', '', 'blackgravel')
call s:HL('FoldColumn', 'mediumgravel', 'blackgravel')

" }}}
" Cursor {{{

call s:HL('Cursor', 'coal', 'snow', 'bold')
call s:HL('vCursor', 'coal', 'snow', 'bold')
call s:HL('iCursor', 'coal', 'snow', 'none')

" }}}
" Syntax highlighting {{{

call s:HL('Special', 'plain')
call s:HL('Comment', 'lightgravel')
call s:HL('Todo', 'snow', 'bg', 'bold')
call s:HL('SpecialComment', 'snow', 'bg', 'bold')
call s:HL('String', 'dirtyblonde')
call s:HL('Statement', 'taffy', '', 'bold')
call s:HL('Keyword', 'taffy', '', 'bold')
call s:HL('Conditional', 'taffy', '', 'bold')
call s:HL('Operator', 'taffy', '', 'none')
call s:HL('Label', 'taffy', '', 'none')
call s:HL('Repeat', 'taffy', '', 'none')
call s:HL('Identifier', 'orange', '', 'none')
call s:HL('Function', 'orange', '', 'none')
call s:HL('PreProc', 'lime', '', 'none')
call s:HL('Macro', 'lime', '', 'none')
call s:HL('Define', 'lime', '', 'none')
call s:HL('PreCondit', 'lime', '', 'bold')
call s:HL('Constant', 'toffee', '', '')
call s:HL('Character', 'toffee', '', '')
call s:HL('Boolean', 'toffee', '', '')
call s:HL('Number', 'toffee', '', '')
call s:HL('Float', 'toffee', '', 'bold')
call s:HL('SpecialChar', 'dress', '', 'bold')
call s:HL('Type', 'dress', '', 'none')
call s:HL('StorageClass', 'taffy', '', 'none')
call s:HL('Structure', 'taffy', '', 'none')
call s:HL('Typedef', 'taffy', '', 'bold')
call s:HL('Exception', 'lime', '', 'bold')
call s:HL('Error', 'snow', 'taffy', 'bold')
call s:HL('Debug', 'snow', '', 'bold')
call s:HL('Ignore', 'gravel', '', '')

" }}}
" Completion Menu {{{

call s:HL('Pmenu', 'plain', 'deepergravel')
call s:HL('PmenuSel', 'coal', 'tardis', 'bold')
call s:HL('PmenuSbar', '', 'deepergravel')
call s:HL('PmenuThumb', 'brightgravel')

" }}}
" Diffs {{{

call s:HL('DiffDelete', 'coal', 'coal')
call s:HL('DiffAdd', '', 'deepergravel')
call s:HL('DiffChange', '', 'darkgravel')
call s:HL('DiffText', 'snow', 'deepergravel', 'bold')

" }}}
" Spelling {{{

if has("spell")
    call s:HL('SpellCap', 'snow', 'dalespale', '', '')
    call s:HL('SpellBad', 'snow', 'taffy', '', '')
    call s:HL('SpellLocal', 'snow', 'tardis', '', '')
    call s:HL('SpellRare', 'snow', 'tardis', '', '')
endif

" }}}

" }}}
" Plugins {{{

" CtrlP {{{

    " the message when no match is found
    call s:HL('CtrlPNoEntries', 'snow', 'taffy', 'bold')

    " the matched pattern
    call s:HL('CtrlPMatch', 'orange', 'bg', 'none')

    " the line prefix '>' in the match window
    call s:HL('CtrlPLinePre', 'deepgravel', 'bg', 'none')

    " the prompt’s base
    call s:HL('CtrlPPrtBase', 'deepgravel', 'bg', 'none')

    " the prompt’s text
    call s:HL('CtrlPPrtText', 'plain', 'bg', 'none')

    " the prompt’s cursor when moving over the text
    call s:HL('CtrlPPrtCursor', 'coal', 'tardis', 'bold')

    " 'prt' or 'win', also for 'regex'
    call s:HL('CtrlPMode1', 'coal', 'tardis', 'bold')

    " 'file' or 'path', also for the local working dir
    call s:HL('CtrlPMode2', 'coal', 'tardis', 'bold')

    " the scanning status
    call s:HL('CtrlPStats', 'coal', 'tardis', 'bold')

" }}}

" }}}
" Filetype-specific {{{

" Clojure {{{

call s:HL('clojureSpecial', 'taffy', '', '')
call s:HL('clojureDefn', 'taffy', '', '')
call s:HL('clojureDefMacro', 'taffy', '', '')
call s:HL('clojureDefine', 'taffy', '', '')
call s:HL('clojureMacro', 'taffy', '', '')
call s:HL('clojureCond', 'taffy', '', '')
call s:HL('clojureKeyword', 'orange', '', 'none')
call s:HL('clojureFunc', 'dress', '', 'none')
call s:HL('clojureRepeat', 'dress', '', 'none')
call s:HL('clojureParen0', 'lightgravel', '', 'none')
call s:HL('clojureAnonArg', 'snow', '', 'bold')

" }}}
" CSS {{{
call s:HL('cssColorProp', 'fg', '', 'none')
call s:HL('cssBoxProp', 'fg', '', 'none')
call s:HL('cssTextProp', 'fg', '', 'none')
call s:HL('cssRenderProp', 'fg', '', 'none')
call s:HL('cssGeneratedContentProp', 'fg', '', 'none')
call s:HL('cssBackgroundProp', 'fg', '', 'none')
call s:HL('cssFontProp', 'fg', '', 'none')
call s:HL('cssBorderProp', 'fg', '', 'none')
call s:HL('cssDimensionProp', 'fg', '', 'none')
call s:HL('cssPositioningProp', 'fg', '', 'none')
call s:HL('cssUIProp', 'fg', '', 'none')
call s:HL('cssListProp', 'fg', '', 'none')
call s:HL('cssValueLength', 'toffee', '', '')
call s:HL('cssColor', 'toffee', '', '')
call s:HL('cssBraces', 'lightgravel', '', 'none')
call s:HL('cssIdentifier', 'orange', '', 'bold')
call s:HL('cssClassName', 'orange', '', 'none')

" }}}
" Diff {{{

call s:HL('gitDiff', 'lightgravel', '',)
call s:HL('diffRemoved', 'dress', '',)
call s:HL('diffAdded', 'lime', '',)
call s:HL('diffFile', 'coal', 'taffy', 'bold')
call s:HL('diffNewFile', 'coal', 'taffy', 'bold')
call s:HL('diffLine', 'coal', 'orange', 'bold')
call s:HL('diffSubname', 'orange', '', 'none')

" }}}
" Django Templates {{{

call s:HL('djangoArgument', 'dirtyblonde', '',)
call s:HL('djangoTagBlock', 'orange', '')
call s:HL('djangoVarBlock', 'orange', '')

" }}}
" HTML {{{

call s:HL('htmlTag', 'orange', 'bg', 'none')
call s:HL('htmlEndTag', 'orange', 'bg', 'none')
call s:HL('htmlTagName', 'taffy', '', 'bold')
call s:HL('htmlSpecialTagName', 'orange', '', 'bold')
call s:HL('htmlSpecialChar', 'lime', '', 'none')
call s:HL('htmlArg', 'dress', '', 'none')
call s:HL('htmlLink', 'lightgravel', '', 'none')

" }}}
" Java {{{

call s:HL('javaClassDecl', 'taffy', '', 'bold')
call s:HL('javaScopeDecl', 'taffy', '', 'bold')
call s:HL('javaCommentTitle', 'gravel', '')
call s:HL('javaDocTags', 'snow', '', 'none')
call s:HL('javaDocParam', 'dalespale', '', '')

" }}}
" LaTeX {{{

call s:HL('texStatement', 'tardis', '', 'none')
call s:HL('texMathZoneX', 'orange', '', 'none')
call s:HL('texMathZoneA', 'orange', '', 'none')
call s:HL('texMathZoneB', 'orange', '', 'none')
call s:HL('texMathZoneC', 'orange', '', 'none')
call s:HL('texMathZoneD', 'orange', '', 'none')
call s:HL('texMathZoneE', 'orange', '', 'none')
call s:HL('texMathZoneV', 'orange', '', 'none')
call s:HL('texMathZoneX', 'orange', '', 'none')
call s:HL('texMath', 'orange', '', 'none')
call s:HL('texMathMatcher', 'orange', '', 'none')
call s:HL('texRefLabel', 'dirtyblonde', '', 'none')
call s:HL('texRefZone', 'lime', '', 'none')
call s:HL('texComment', 'darkroast', '', 'none')
call s:HL('texDelimiter', 'orange', '', 'none')
call s:HL('texZone', 'brightgravel', '', 'none')

augroup badwolf_tex
    au!
    autocmd BufRead,BufNewFile *.tex syn region texMathZoneV start="\\(" end="\\)\|%stopzone\>" keepend contains=@texMathZoneGroup
    autocmd BufRead,BufNewFile *.tex syn region texMathZoneX start="\$" skip="\\\\\|\\\$" end="\$\|%stopzone\>" keepend contains=@texMathZoneGroup
augroup END

" }}}
" Mail {{{

call s:HL('mailSubject', 'orange', '', 'bold')
call s:HL('mailHeader', 'lightgravel', '', '')
call s:HL('mailHeaderKey', 'lightgravel', '', '')
call s:HL('mailHeaderEmail', 'snow', '', '')
call s:HL('mailURL', 'toffee', '', 'underline')
call s:HL('mailSignature', 'gravel', '', 'none')
call s:HL('mailQuoted1', 'gravel', '', 'none')
call s:HL('mailQuoted2', 'dress', '', 'none')
call s:HL('mailQuoted3', 'dirtyblonde', '', 'none')
call s:HL('mailQuoted4', 'orange', '', 'none')
call s:HL('mailQuoted5', 'lime', '', 'none')

" }}}
" Markdown {{{

call s:HL('markdownHeadingRule', 'lightgravel', '', 'bold')
call s:HL('markdownHeadingDelimiter', 'lightgravel', '', 'bold')
call s:HL('markdownOrderedListMarker', 'lightgravel', '', 'bold')
call s:HL('markdownListMarker', 'lightgravel', '', 'bold')
call s:HL('markdownItalic', 'snow', '', 'bold')
call s:HL('markdownBold', 'snow', '', 'bold')
call s:HL('markdownH1', 'orange', '', 'bold')
call s:HL('markdownH2', 'lime', '', 'bold')
call s:HL('markdownH3', 'lime', '', 'none')
call s:HL('markdownH4', 'lime', '', 'none')
call s:HL('markdownH5', 'lime', '', 'none')
call s:HL('markdownH6', 'lime', '', 'none')
call s:HL('markdownLinkText', 'toffee', '', 'underline')
call s:HL('markdownIdDeclaration', 'toffee')
call s:HL('markdownAutomaticLink', 'toffee', '', 'bold')
call s:HL('markdownUrl', 'toffee', '', 'bold')
call s:HL('markdownUrldelimiter', 'lightgravel', '', 'bold')
call s:HL('markdownLinkDelimiter', 'lightgravel', '', 'bold')
call s:HL('markdownLinkTextDelimiter', 'lightgravel', '', 'bold')
call s:HL('markdownCodeDelimiter', 'dirtyblonde', '', 'bold')
call s:HL('markdownCode', 'dirtyblonde', '', 'none')
call s:HL('markdownCodeBlock', 'dirtyblonde', '', 'none')

" }}}
" Python {{{

hi def link pythonOperator Operator
call s:HL('pythonBuiltin', 'dress')
call s:HL('pythonBuiltinObj', 'dress')
call s:HL('pythonBuiltinFunc', 'dress')
call s:HL('pythonEscape', 'dress')
call s:HL('pythonException', 'lime', '', 'bold')
call s:HL('pythonExceptions', 'lime', '', 'none')
call s:HL('pythonPrecondit', 'lime', '', 'none')
call s:HL('pythonDecorator', 'taffy', '', 'none')
call s:HL('pythonRun', 'gravel', '', 'bold')
call s:HL('pythonCoding', 'gravel', '', 'bold')

" }}}
" Vim {{{

call s:HL('VimCommentTitle', 'brightgravel', '', 'bold')
call s:HL('VimMapMod', 'dress', '', 'none')
call s:HL('VimMapModKey', 'dress', '', 'none')
call s:HL('VimNotation', 'dress', '', 'none')
call s:HL('VimBracket', 'dress', '', 'none')

" }}}

" }}}
