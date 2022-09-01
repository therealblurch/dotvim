set mouse=a
set mousehide
set guioptions=aAci
set vb t_vb=

let g:fontlist=[
  \ 'agave\ Nerd\ Font\ Mono\ 10',
  \ 'Anonymice\ Nerd\ Font\ Mono\ 11',
  \ 'Cousine\ Nerd\ Font\ Mono\ 11',
  \ 'DaddyTimeMono\ Nerd\ Font\ Mono\ 11',
  \ 'DejaVuSansMono\ Nerd\ Font\ Mono\ 11',
  \ 'DroidSansMono\ Nerd\ Font\ Mono\ 11',
  \ 'FantasqueSansMono\ Nerd\ Font\ Mono\ 11',
  \ 'FuraMono\ Nerd\ Font\ Mono\ 11',
  \ 'FuraCode\ Nerd\ Font\ Mono\ Medium\ 11',
  \ 'Hack\ Nerd\ Font\ Mono\ 11',
  \ 'Hasklug\ Nerd\ Font\ Mono\ Medium\ 11',
  \ 'Hurmit\ Nerd\ Font\ Mono\ Medium\ 11',
  \ 'MesloLGL\ Nerd\ Font\ Mono\ 11',
  \ 'Monofur\ Nerd\ Font\ Mono\ 11',
  \ 'Monoid\ Nerd\ Font\ Mono\ Light\ Semi-Condensed\ 11',
  \ 'mononoki\ Nerd\ Font\ Mono\ 11',
  \ 'SauceCodePro\ Nerd\ Font\ Mono\ 11',
  \ 'ShureTechMono\ Nerd\ Font\ Mono\ 11',
  \ 'SpaceMono\ Nerd\ Font\ Mono\ 11',
  \ 'TerminessTTF\ Nerd\ Font\ Mono\ Medium\ 11',
  \ 'UbuntuMono\ Nerd\ Font\ Mono\ 11',
  \ 'VictorMono\ Nerd\ Font\ Mono\ 11'
  \]

let s:new_font = g:fontlist[localtime() % len(g:fontlist)]
exec 'set guifont=' . s:new_font

" if has('win32') || has('win64')
"   set guifont=InconsolataForPowerline_NF:h11:cANSI:qDRAFT
" else
"   set guifont=Hack\ Nerd\ Font\ Mono\ 11
" endif
