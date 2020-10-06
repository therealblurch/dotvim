function! b_lib#GitgutterStatus()
  let l:summary = [0, 0, 0]
  if exists('b:gitgutter.summary')
    let l:summary = b:gitgutter.summary
  endif
  return max(l:summary) > 0 ? ' +'.l:summary[0].' ~'.l:summary[1].' -'.l:summary[2].' ' : ''
endfunction

function! b_lib#ResCur()
  if line("'\"") <= line("$")
    silent! normal! g`"
    return 1
  endif
endfunction

function! b_lib#MU()
  return get(g:mucomplete#msg#short_methods, get(g:, 'mucomplete_current_method', ''), '')
endfunction

function! b_lib#AtelierLightlineTheme() dict
  if &background == 'Light'
    let l:lightlinetheme = split (g:colors_name, "Light")
  else
    let l:lightlinetheme = split (g:colors_name, "Dark")
  endif
  return l:lightlinetheme
endfunction

function! b_lib#FlattenedMap (key,val) dict
  let l:color_name = mgr#get_color_dict_key(g:colors_name)
  return l:color_name . a:val
endfunction

function! b_lib#SeagullAirlineTheme() dict
  return 'seagull'
endfunction

function! b_lib#Base16AirlineTheme() dict
  return 'base16'
endfunction

function! b_lib#FlattenedAirlineTheme() dict
  return 'solarized'
endfunction

function! b_lib#MonokaiAirlineTheme() dict
  return 'molokai'
endfunction

function! b_lib#OceanicNextToggle() dict
  let l:new_colorscheme = (g:colors_name =~# 'Light') ? substitute(g:colors_name, 'Light', '', '') : g:colors_name . 'Light'
  exec 'colors ' . l:new_colorscheme
endfunction

function! b_lib#VimspectrMap (key,val) dict
  return self.name . a:val . '-' . &background
endfunction

function! b_lib#SpaceVimLightlineTheme() dict
  return substitute(g:colors_name, 'theme', &background, "")
endfunction

function! b_lib#ColorschemeAppendVim() dict
  return g:colors_name . '_vim'
endfunction

function! b_lib#SeagullToggle() dict
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
