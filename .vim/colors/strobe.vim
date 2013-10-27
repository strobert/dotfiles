"%% SiSU Vim color file
" started from slate and customized...
"    Slate Maintainer: Ralph Amissah <ralph@amissah.com>
"    (originally looked at desert Hans Fugal <hans@fugal.net> http://hans.fugal.net/vim/colors/desert.vim (2003/05/06)
:set background=dark
:highlight clear
if version > 580
 hi clear
 if exists("syntax_on")
 syntax reset
 endif
endif
":hi Normal
":hi Cursor
:hi VertSplit cterm=reverse
:hi Folded ctermfg=grey ctermbg=darkgrey
:hi FoldColumn ctermfg=4 ctermbg=7
:hi IncSearch cterm=none ctermfg=yellow ctermbg=green
:hi ModeMsg cterm=none ctermfg=brown
:hi MoreMsg ctermfg=darkgreen
:hi NonText cterm=bold ctermfg=blue
:hi Question ctermfg=green
:hi Search cterm=none ctermfg=grey ctermbg=blue
:hi SpecialKey ctermfg=darkgreen
:hi StatusLine cterm=bold,reverse
:hi StatusLineNC cterm=reverse
:hi Title cterm=bold ctermfg=yellow
:hi Statement ctermfg=grey
:hi Visual cterm=reverse
:hi WarningMsg ctermfg=1
:hi String ctermfg=darkcyan
:hi Comment ctermfg=darkgreen
:hi Constant ctermfg=green
:hi Special ctermfg=brown
:hi Identifier ctermfg=blue
:hi Include ctermfg=cyan
:hi PreProc ctermfg=darkblue
:hi Operator ctermfg=blue
:hi Define ctermfg=yellow
:hi Type ctermfg=blue
:hi Function ctermfg=brown
:hi Structure ctermfg=green
:hi LineNr ctermfg=3
:hi Ignore cterm=bold ctermfg=7
":hi Todo
:hi Directory ctermfg=darkcyan
:hi ErrorMsg cterm=bold cterm=bold ctermfg=7 ctermbg=1
:hi VisualNOS cterm=bold,underline
:hi WildMenu ctermfg=0 ctermbg=3
:hi DiffAdd ctermbg=4
:hi DiffChange ctermbg=5
:hi DiffDelete cterm=bold ctermfg=4 ctermbg=6
:hi DiffText cterm=bold ctermbg=1
:hi Underlined cterm=underline ctermfg=5
:hi Error cterm=bold ctermfg=7 ctermbg=1
:hi SpellErrors cterm=bold ctermfg=7 ctermbg=1
