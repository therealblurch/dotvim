set mouse=a
set mousehide
set guioptions=aAci
set vb t_vb=

let g:fontlist=[
  \ 'agave\ Nerd\ Font\ Mono\ 14',
  \ 'Anonymice\ Nerd\ Font\ Mono\ 12',
  \ 'AurulentSansMono\ Nerd\ Font\ Mono\ 12',
  \ 'CaskaydiaCove\ Nerd\ Font\ Mono\ 12',
  \ 'Cousine\ Nerd\ Font\ Mono\ 12',
  \ 'DaddyTimeMono\ Nerd\ Font\ Mono\ 12',
  \ 'DejaVuSansMono\ Nerd\ Font\ Mono\ 12',
  \ 'DroidSansMono\ Nerd\ Font\ Mono\ 12',
  \ 'FantasqueSansMono\ Nerd\ Font\ Mono\ 12',
  \ 'Fira\ Code\ iCursive\ S12\ 12',
  \ 'FuraMono\ Nerd\ Font\ Mono\ 12',
  \ 'FuraCode\ Nerd\ Font\ Mono\ Medium\ 12',
  \ 'Hack\ iCursive\ S12\ 12',
  \ 'Hack\ Nerd\ Font\ Mono\ 12',
  \ 'Hasklug\ Nerd\ Font\ Mono\ Medium\ 12',
  \ 'Hurmit\ Nerd\ Font\ Mono\ Medium\ 12',
  \ 'Inconsolata\ Nerd\ Font\ Mono\ 12',
  \ 'InconsolataLGC\ iCursive\ S12\ Medium\ 12',
  \ 'Meslo\ iCursive\ S12\ 12',
  \ 'MesloLGL\ Nerd\ Font\ Mono\ 12',
  \ 'Monofur\ Nerd\ Font\ Mono\ 12',
  \ 'Monoid\ Nerd\ Font\ Mono\ Light\ Semi-Condensed\ 12',
  \ 'mononoki\ Nerd\ Font\ Mono\ 12',
  \ 'SauceCodePro\ Nerd\ Font\ Mono\ 12',
  \ 'ShureTechMono\ Nerd\ Font\ Mono\ 12',
  \ 'Source\ Code\ Pro\ iCursive\ S12\ 12',
  \ 'SpaceMono\ Nerd\ Font\ Mono\ 12',
  \ 'TerminessTTF\ Nerd\ Font\ Mono\ Medium\ 12',
  \ 'UbuntuMono\ Nerd\ Font\ Mono\ 12',
  \ 'VictorMono\ Nerd\ Font\ Mono\ 12'
  \]

let s:new_font = g:fontlist[localtime() % len(g:fontlist)]
exec 'set guifont=' . s:new_font

" if has('win32') || has('win64')
"   set guifont=InconsolataForPowerline_NF:h12:cANSI:qDRAFT
" else
"   set guifont=Hack\ Nerd\ Font\ Mono\ 12
" endif
