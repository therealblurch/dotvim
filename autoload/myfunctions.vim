function! myfunctions#GitgutterStatus()
  let l:summary = [0, 0, 0]
  if exists('b:gitgutter.summary')
    let l:summary = b:gitgutter.summary
  endif
  return max(l:summary) > 0 ? ' +'.l:summary[0].' ~'.l:summary[1].' -'.l:summary[2].' ' : ''
endfunction

function! myfunctions#ResCur()
  if line("'\"") <= line("$")
    silent! normal! g`"
    return 1
  endif
endfunction

function! myfunctions#MU()
  return get(g:mucomplete#msg#short_methods, get(g:, 'mucomplete_current_method', ''), '')
endfunction

function! myfunctions#AtelierMap (key,val) dict
  if &background == 'light'
    let l:back = 'Light'
  else
    let l:back = 'Dark'
  endif
  return self.name . '_' . a:val . l:back
endfunction

function! myfunctions#AtelierLightlineTheme() dict
  if &background == 'Light'
    let l:lightlinetheme = split (g:colors_name, "Light")
  else
    let l:lightlinetheme = split (g:colors_name, "Dark")
  endif
  return l:lightlinetheme
endfunction

function! myfunctions#FlattenedMap (key,val) dict
  return self.name . a:val
endfunction

function! myfunctions#SeagullAirlineTheme() dict
  return 'seagull'
endfunction

function! myfunctions#Base16AirlineTheme() dict
  return 'base16'
endfunction

function! myfunctions#FlattenedAirlineTheme() dict
  return 'solarized'
endfunction

function! myfunctions#VimspectrMap (key,val) dict
  return self.name . a:val . '-' . &background
endfunction

function! myfunctions#SeagullToggle() dict
  if g:colors_name == 'seagull'
    let l:colorscheme = 'petrel'
  endif
  if g:colors_name == 'petrel'
    let l:colorscheme = 'seagull'
  endif
  if g:colors_name == 'greygull'
    let l:colorscheme = 'stormpetrel'
  endif
  if g:colors_name == 'stormpetrel'
    let l:colorscheme = 'greygull'
  endif
  exec 'colors ' . l:colorscheme
endfunction
