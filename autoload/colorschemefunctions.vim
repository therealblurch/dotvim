function! colorschemefunctions#GetColorDictionary(color_name)
  let l:color = {}
  for color in g:colorscheme_map
    if a:color_name == color.name || (has_key(color, 'comparison') && color.comparison == 'fuzzy' && a:color_name =~ color.name)
      let l:color = color
      break
    endif
  endfor
  return l:color
endfunction

function! colorschemefunctions#SchemeVariant(delta) abort
  if (has_key(g:current_color_dictionary, 'NextVariant'))
    call g:current_color_dictionary.NextVariant(a:delta)
  endif
endfunction

function! colorschemefunctions#AirlineTheme(colorscheme)
  if has_key (g:current_color_dictionary, 'AirlineTheme')
    let l:airlinetheme = g:current_color_dictionary.AirlineTheme()
  else
    let l:airlinetheme = ''
  endif
  if empty(l:airlinetheme)
    exec "AirlineTheme distinguished"
  else
    exec "AirlineTheme " . l:airlinetheme
  endif
endfunction

function! s:ChooseNextColorscheme (last_colorscheme)
  let l:new_colorscheme = a:last_colorscheme
  for colorscheme_group in values(g:colorscheme_groups)
    for colorscheme_group_member in colorscheme_group
      if a:last_colorscheme == colorscheme_group_member
        let l:new_colorscheme = colorscheme_group[localtime() % len(colorscheme_group)]
        break
      endif
    endfor
  endfor
  return l:new_colorscheme
endfunction

function! colorschemefunctions#SetLastColorscheme()
  let l:last_colorscheme = readfile(expand(g:colorscheme_file))
  exec 'set background='.l:last_colorscheme[0]
  let g:current_color_dictionary = colorschemefunctions#GetColorDictionary(l:last_colorscheme[1])
  call xolox#colorscheme_switcher#switch_to(s:ChooseNextColorscheme(l:last_colorscheme[1]))
endfunction
