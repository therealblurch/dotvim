function! colorschemefunctions#NextColorschemeVariant(delta) dict
  let l:current_variant = g:colors_name
  let l:num_variants = len(self.variants)
  let l:next_variant = self.variants[((a:delta+index(self.variants, l:current_variant)) % l:num_variants + l:num_variants) % l:num_variants]
  call xolox#colorscheme_switcher#switch_to(l:next_variant)
endfunction

function! colorschemefunctions#NextColorschemeVariantMap(delta) dict
  let l:variant_list = copy(self.variants)
  call map(l:variant_list, function(self.Map))
  let l:current_variant = g:colors_name
  let l:num_variants = len(l:variant_list)
  let l:next_variant = l:variant_list[((a:delta+index(l:variant_list, l:current_variant)) % l:num_variants + l:num_variants) % l:num_variants]
  call xolox#colorscheme_switcher#switch_to(l:next_variant)
endfunction

function! colorschemefunctions#NextStyleVariant(delta) dict
  let l:num_variants = len(self.variants)
  exec 'let ' . self.style_variable_name . ' = self.variants[((a:delta+index(self.variants, ' . self.style_variable_name . ')) % l:num_variants + l:num_variants) % l:num_variants]'
  call xolox#colorscheme_switcher#switch_to(self.name)
endfunction

function! colorschemefunctions#NextBackgroundVariant(delta) dict
  let &background = (&background == 'dark') ? 'light' : 'dark'
endfunction

function! colorschemefunctions#ToggleBackground() dict
  let &background = (&background == 'dark') ? 'light' : 'dark'
endfunction

function! colorschemefunctions#ToggleColorscheme() dict
  let l:new_colorscheme = (g:colors_name =~# self.dark_tag) ? substitute(g:colors_name, self.dark_tag, self.light_tag, '') : substitute(g:colors_name, self.light_tag, self.dark_tag, '')
  call xolox#colorscheme_switcher#switch_to(l:new_colorscheme)
endfunction

function! colorschemefunctions#StatusColorscheme() dict
  return g:colors_name
endfunction

function! colorschemefunctions#StatusColorschemeStyle() dict
  exec 'let l:current_style = ' . self.style_variable_name
  return g:colors_name . '/' . l:current_style
endfunction

function! colorschemefunctions#StatusColorschemeBackground() dict
  return g:colors_name . '/' . &background
endfunction

function! colorschemefunctions#AirlineThemeColorscheme() dict
  return g:colors_name
endfunction

function! colorschemefunctions#AirlineThemeColorschemeTR() dict
  return tr(g:colors_name, '-', '_')
endfunction

function! colorschemefunctions#AirlineThemeColorschemeBackground() dict
  return g:colors_name . '_' . &background
endfunction

function! colorschemefunctions#LightlineThemeColorscheme() dict
  return g:colors_name
endfunction

function! colorschemefunctions#LightlineThemeColorschemeTR() dict
  return tr(g:colors_name, '-', '_')
endfunction

function! colorschemefunctions#LightlineThemeColorschemeBackground() dict
  return g:colors_name . '_' . &background
endfunction

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
  if has_key(g:current_color_dictionary, 'NextVariant')
    call g:current_color_dictionary.NextVariant(a:delta)
  endif
endfunction

function! colorschemefunctions#ToggleScheme() abort
  if has_key(g:current_color_dictionary, 'ToggleScheme')
    call g:current_color_dictionary.ToggleScheme()
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
