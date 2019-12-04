function! myfunctions#GitgutterStatus()
   let l:summary = [0, 0, 0]
   if exists('b:gitgutter.summary')
      let l:summary = b:gitgutter.summary
   endif
   return max(l:summary) > 0 ? ' +'.l:summary[0].' ~'.l:summary[1].' -'.l:summary[2].' ' : ''
endfunction

function! myfunctions#GetColorAttribute (color_name, key)
   for color in g:colorscheme_map
      if a:color_name == color.name || (has_key(color, 'comparison') && color.comparison == 'fuzzy' && a:color_name =~ color.name)
         if has_key(color, a:key)
            return color[a:key]
         else
            return -1
         endif
      endif
   endfor
   return -1
endfunction

function! myfunctions#CurrentColorscheme()
   let l:color_name = g:colors_name
   let l:variant_type = myfunctions#GetColorAttribute(g:colors_name, 'variant_type')
   if l:variant_type == 'colorscheme'
      let l:color_name = g:colors_name
   elseif l:variant_type == 'background'
      let l:color_name = g:colors_name . '/' . &background
   elseif l:variant_type == 'ayu_color'
      let l:color_name = g:colors_name . '/' . g:ayucolor
   elseif l:variant_type == 'gruvbox_material_background'
      let l:color_name = g:colors_name . '/' . g:gruvbox_material_background
   elseif l:variant_type == 'material_theme_style'
      let l:color_name = g:colors_name . '/' . g:material_theme_style
   elseif l:variant_type == 'materialbox_contrast'
      if &background == "light"
         let l:color_name = g:colors_name . '/' . g:materialbox_contrast_light
      else
         let l:color_name = g:colors_name . '/' . g:materialbox_contrast_dark
      endif
   endif
   return l:color_name
endfunction

function! myfunctions#ColorschemeHasAirlineTheme(colorscheme)
   let l:airline_theme = myfunctions#GetColorAttribute(a:colorscheme, 'airlinetheme')
   if l:airline_theme == -1
      let l:airline_theme_exists = 0
   else
      let l:airline_theme_exists = 1
   endif
   return l:airline_theme_exists
endfunction

function! s:ColorschemeHasLightlineColorscheme(colorscheme)
   let l:lightline_theme = myfunctions#GetColorAttribute(a:colorscheme, 'lightlinetheme')
   if l:lightline_theme == -1
      let l:lightline_theme_exists = 0
   else
      let l:lightline_theme_exists = 1
   endif
   return l:lightline_theme_exists
endfunction

function! myfunctions#WhichStatus(colorscheme)
   if (!myfunctions#ColorschemeHasAirlineTheme(a:colorscheme) && !s:ColorschemeHasLightlineColorscheme(a:colorscheme)) || exists('g:buftabline_show')
      let l:user_status = "none"
   elseif exists('g:loaded_airline')
      let l:user_status = "airline"
   elseif exists('g:loaded_lightline')
      let l:user_status = "lightline"
   elseif g:prefer_airline && myfunctions#ColorschemeHasAirlineTheme(a:colorscheme)
      let l:user_status = "airline"
   elseif !g:prefer_airline && s:ColorschemeHasLightlineColorscheme(a:colorscheme)
      let l:user_status = "lightline"
   elseif myfunctions#ColorschemeHasAirlineTheme(a:colorscheme)
      let l:user_status = "airline"
   elseif s:ColorschemeHasLightlineColorscheme(a:colorscheme)
      let l:user_status = "lightline"
   endif
   return l:user_status
endfunction

function! myfunctions#ResCur()
   if line("'\"") <= line("$")
      silent! normal! g`"
      return 1
   endif
endfunction

function! myfunctions#MU()
   return get(g:mucomplete#msg#short_methods,
            \ get(g:, 'mucomplete_current_method', ''), '')
endfunction
