" Vim color file
" Converted from Textmate theme Putty using Coloration v0.3.2 (http://github.com/sickill/coloration)
 
set background=dark
highlight clear
 
if exists("syntax_on")
  syntax reset
endif
 
let g:colors_name = "Putty"
 
hi Cursor ctermfg=NONE ctermbg=15 cterm=NONE guifg=NONE guibg=#ffffff gui=NONE
hi Visual ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#535c72 gui=NONE
hi CursorLine ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#373635 gui=NONE
hi CursorColumn ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#373635 gui=NONE
hi ColorColumn ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#373635 gui=NONE
 
hi MatchParen ctermfg=193 ctermbg=NONE cterm=bold guifg=#e9eec2 guibg=NONE gui=NONE
 
hi VertSplit ctermfg=240 ctermbg=240 cterm=NONE guifg=#5c5a58 guibg=#5c5a58 gui=NONE
hi StatusLine ctermfg=236 ctermbg=245 cterm=bold guifg=#e5e1dc guibg=#5c5a58 gui=bold
hi StatusLineNC ctermfg=243 ctermbg=236 cterm=NONE guifg=#e5e1dc guibg=#5c5a58 gui=NONE
 
hi Pmenu ctermfg=247 ctermbg=236 cterm=NONE guifg=#ffffff guibg=NONE gui=NONE
hi PmenuSel ctermfg=white ctermbg=33 cterm=bold guifg=NONE guibg=#535c72 gui=NONE
hi IncSearch ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#656657 gui=NONE
hi Search ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#656657 gui=NONE
hi Directory ctermfg=110 ctermbg=NONE cterm=NONE guifg=#7ab8d7 guibg=NONE gui=NONE
hi Folded ctermfg=243 ctermbg=235 cterm=NONE guifg=#747676 guibg=#242322 gui=NONE
 
hi Normal ctermfg=188 ctermbg=235 cterm=NONE guifg=#e5e1dc guibg=#242322 gui=NONE
hi Boolean ctermfg=73 ctermbg=NONE cterm=NONE guifg=#6e9cbe guibg=NONE gui=NONE
hi Character ctermfg=110 ctermbg=NONE cterm=NONE guifg=#7ab8d7 guibg=NONE gui=NONE
hi Comment ctermfg=237 ctermbg=NONE cterm=NONE guifg=#747676 guibg=NONE gui=italic
hi Constant ctermfg=210 ctermbg=NONE cterm=BOLD guifg=#7ab8d7 guibg=NONE gui=NONE
 
hi ErrorMsg ctermfg=15 ctermbg=196 cterm=NONE guifg=#ffffff guibg=#990000 gui=NONE
hi WarningMsg ctermfg=15 ctermbg=166 cterm=NONE guifg=#ffffff guibg=#990000 gui=NONE
 
hi LineNr ctermfg=244 ctermbg=233 cterm=NONE guifg=#85827f guibg=#373635 gui=NONE
 
 
hi Float ctermfg=215 ctermbg=NONE cterm=NONE guifg=#fda35e guibg=NONE gui=NONE
 
hi Function ctermfg=116 ctermbg=NONE cterm=NONE guifg=#d5584b guibg=NONE gui=NONE
 
hi Identifier ctermfg=187 ctermbg=NONE cterm=NONE guifg=#e9eec2 guibg=NONE gui=NONE
hi Operator ctermfg=81 ctermbg=NONE cterm=NONE guifg=#e9eec2 guibg=NONE gui=NONE
 
hi Define ctermfg=75 ctermbg=NONE cterm=NONE guifg=#e9eec2 guibg=NONE gui=NONE
hi Statement ctermfg=39 ctermbg=NONE cterm=bold guifg=#e9eec2 guibg=NONE gui=NONE
 
hi Keyword ctermfg=143 ctermbg=NONE cterm=NONE guifg=#e9eec2 guibg=NONE gui=NONE
 
hi Repeat ctermfg=208 cterm=bold
hi Conditional ctermfg=221 ctermbg=NONE cterm=BOLD guifg=#e9eec2 guibg=NONE gui=NONE
 
hi StorageClass ctermfg=193 ctermbg=NONE cterm=NONE guifg=#e9eec2 guibg=NONE gui=NONE
hi PreProc ctermfg=193 ctermbg=NONE cterm=NONE guifg=#e9eec2 guibg=NONE gui=NONE
 
hi String ctermfg=101 ctermbg=NONE cterm=NONE guifg=#7ab8d7 guibg=NONE gui=NONE
hi NonText ctermfg=238 ctermbg=16 cterm=NONE guifg=#404040 guibg=#2e2d2b gui=NONE
 
hi Typedef         ctermfg=214
hi Type            ctermfg=214                cterm=none
 
hi SpecialChar     ctermfg=229               cterm=bold
 
hi Label ctermfg=110 ctermbg=NONE cterm=NONE guifg=#7ab8d7 guibg=NONE gui=NONE
hi Number ctermfg=215 ctermbg=NONE cterm=NONE guifg=#fda35e guibg=NONE gui=NONE
hi Special ctermfg=188 ctermbg=NONE cterm=NONE guifg=#e5e1dc guibg=NONE gui=NONE
hi SpecialKey ctermfg=238 ctermbg=59 cterm=NONE guifg=#404040 guibg=#373635 gui=NONE
hi Tag ctermfg=173 ctermbg=NONE cterm=NONE guifg=#e87658 guibg=NONE gui=NONE
hi Title ctermfg=188 ctermbg=NONE cterm=bold guifg=#e5e1dc guibg=NONE gui=bold
hi Todo ctermfg=243 ctermbg=NONE cterm=inverse,bold guifg=#747676 guibg=NONE gui=inverse,bold,italic
hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline
 
hi rubyClass ctermfg=193 ctermbg=NONE cterm=NONE guifg=#e9eec2 guibg=NONE gui=NONE
hi rubyFunction ctermfg=167 ctermbg=NONE cterm=NONE guifg=#d5584b guibg=NONE gui=NONE
hi rubyInterpolationDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubySymbol ctermfg=110 ctermbg=NONE cterm=NONE guifg=#7ab8d7 guibg=NONE gui=NONE
hi rubyConstant ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubyStringDelimiter ctermfg=110 ctermbg=NONE cterm=NONE guifg=#7ab8d7 guibg=NONE gui=NONE
hi rubyBlockParameter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubyInstanceVariable ctermfg=110 ctermbg=NONE cterm=NONE guifg=#7ab8d7 guibg=NONE gui=NONE
hi rubyInclude ctermfg=193 ctermbg=NONE cterm=NONE guifg=#e9eec2 guibg=NONE gui=NONE
hi rubyGlobalVariable ctermfg=110 ctermbg=NONE cterm=NONE guifg=#7ab8d7 guibg=NONE gui=NONE
hi rubyRegexp ctermfg=110 ctermbg=NONE cterm=NONE guifg=#7ab8d7 guibg=NONE gui=NONE
hi rubyRegexpDelimiter ctermfg=110 ctermbg=NONE cterm=NONE guifg=#7ab8d7 guibg=NONE gui=NONE
hi rubyEscape ctermfg=215 ctermbg=NONE cterm=NONE guifg=#fda35e guibg=NONE gui=NONE
hi rubyControl ctermfg=193 ctermbg=NONE cterm=NONE guifg=#e9eec2 guibg=NONE gui=NONE
hi rubyClassVariable ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubyOperator ctermfg=193 ctermbg=NONE cterm=NONE guifg=#e9eec2 guibg=NONE gui=NONE
hi rubyException ctermfg=193 ctermbg=NONE cterm=NONE guifg=#e9eec2 guibg=NONE gui=NONE
hi rubyPseudoVariable ctermfg=110 ctermbg=NONE cterm=NONE guifg=#7ab8d7 guibg=NONE gui=NONE
hi rubyRailsUserClass ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubyRailsARAssociationMethod ctermfg=167 ctermbg=NONE cterm=NONE guifg=#d4584b guibg=NONE gui=NONE
hi rubyRailsARMethod ctermfg=167 ctermbg=NONE cterm=NONE guifg=#d4584b guibg=NONE gui=NONE
hi rubyRailsRenderMethod ctermfg=167 ctermbg=NONE cterm=NONE guifg=#d4584b guibg=NONE gui=NONE
hi rubyRailsMethod ctermfg=167 ctermbg=NONE cterm=NONE guifg=#d4584b guibg=NONE gui=NONE
hi erubyDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi erubyComment ctermfg=243 ctermbg=NONE cterm=NONE guifg=#747676 guibg=NONE gui=italic
hi erubyRailsMethod ctermfg=167 ctermbg=NONE cterm=NONE guifg=#d4584b guibg=NONE gui=NONE
hi htmlTag ctermfg=173 ctermbg=NONE cterm=NONE guifg=#e87658 guibg=NONE gui=NONE
hi htmlEndTag ctermfg=173 ctermbg=NONE cterm=NONE guifg=#e87658 guibg=NONE gui=NONE
hi htmlTagName ctermfg=173 ctermbg=NONE cterm=NONE guifg=#e87658 guibg=NONE gui=NONE
hi htmlArg ctermfg=173 ctermbg=NONE cterm=NONE guifg=#e87658 guibg=NONE gui=NONE
hi htmlSpecialChar ctermfg=110 ctermbg=NONE cterm=NONE guifg=#7ab8d7 guibg=NONE gui=NONE
hi javaScriptFunction ctermfg=193 ctermbg=NONE cterm=NONE guifg=#e9eec2 guibg=NONE gui=NONE
hi javaScriptRailsFunction ctermfg=167 ctermbg=NONE cterm=NONE guifg=#d4584b guibg=NONE gui=NONE
hi javaScriptBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi yamlKey ctermfg=173 ctermbg=NONE cterm=NONE guifg=#e87658 guibg=NONE gui=NONE
hi yamlAnchor ctermfg=110 ctermbg=NONE cterm=NONE guifg=#7ab8d7 guibg=NONE gui=NONE
hi yamlAlias ctermfg=110 ctermbg=NONE cterm=NONE guifg=#7ab8d7 guibg=NONE gui=NONE
hi yamlDocumentHeader ctermfg=110 ctermbg=NONE cterm=NONE guifg=#7ab8d7 guibg=NONE gui=NONE
hi cssURL ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi cssFunctionName ctermfg=167 ctermbg=NONE cterm=NONE guifg=#d4584b guibg=NONE gui=NONE
hi cssColor ctermfg=110 ctermbg=NONE cterm=NONE guifg=#7ab8d7 guibg=NONE gui=NONE
hi cssPseudoClassId ctermfg=173 ctermbg=NONE cterm=NONE guifg=#e87658 guibg=NONE gui=NONE
hi cssClassName ctermfg=173 ctermbg=NONE cterm=NONE guifg=#e87658 guibg=NONE gui=NONE
hi cssValueLength ctermfg=215 ctermbg=NONE cterm=NONE guifg=#fda35e guibg=NONE gui=NONE
hi cssCommonAttr ctermfg=215 ctermbg=NONE cterm=NONE guifg=#fda35e guibg=NONE gui=NONE
hi cssBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
