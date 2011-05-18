" local syntax file - set colors on a per-machine basis:
" vim: tw=0 ts=4 sw=4
" Vim color file
" Maintainer:	Maddox <maddox@xmission.com>
" Last Change:	2004 Aug 25
" Base:	modified from murphy color scheme.

hi clear
set background=dark
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "maddox"

hi Normal		ctermbg=Black  ctermfg=lightgreen guibg=Black		 guifg=lightgreen
hi Comment		term=bold	   ctermfg=LightRed   guifg=Orange
hi Constant		term=underline ctermfg=LightYellow guifg=White	gui=NONE
hi Identifier	term=underline ctermfg=LightYellow  guifg=#00ffff
hi Ignore					   ctermfg=black	  guifg=bg
hi PreProc		term=underline ctermfg=LightBlue  guifg=Wheat
hi Search		term=reverse					  guifg=white	guibg=Blue
hi Special		term=bold	   ctermfg=LightRed   guifg=magenta
hi Statement	term=bold	   ctermfg=Yellow	  guifg=LightYellow gui=NONE
hi Type						   ctermfg=LightYellow guifg=grey	gui=none
hi Error		term=reverse   ctermbg=Red	  ctermfg=White guibg=Red  guifg=White
hi Todo			term=standout  ctermbg=Yellow ctermfg=Black guifg=Blue guibg=Yellow
" From the source:
hi Cursor										  guifg=Orchid	guibg=fg
hi Directory	term=bold	   ctermfg=LightYellow  guifg=Yellow
hi ErrorMsg		term=standout  ctermbg=DarkRed	  ctermfg=White guibg=Red guifg=White
hi IncSearch	term=reverse   cterm=reverse	  gui=reverse
hi LineNr		term=underline ctermfg=Yellow					guifg=Yellow
hi ModeMsg		term=bold	   cterm=bold		  gui=bold
hi MoreMsg		term=bold	   ctermfg=LightYellow gui=bold		guifg=SeaGreen
hi NonText		term=bold	   ctermfg=Blue		  gui=bold		guifg=Blue
hi Question		term=standout  ctermfg=LightYellow gui=bold		guifg=Yellow
hi SpecialKey	term=bold	   ctermfg=LightBlue  guifg=Yellow
hi StatusLine	term=reverse,bold cterm=reverse   gui=NONE		guifg=White guibg=darkblue
hi StatusLineNC term=reverse   cterm=reverse	  gui=NONE		guifg=white guibg=#333333
hi Title		term=bold	   ctermfg=LightMagenta gui=bold	guifg=Pink
hi WarningMsg	term=standout  ctermfg=LightRed   guifg=Red
hi Visual		term=reverse   cterm=reverse	  gui=NONE		guifg=white guibg=darkgreen
