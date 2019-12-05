function! myfunctions#GitgutterStatus()
   let l:summary = [0, 0, 0]
   if exists('b:gitgutter.summary')
      let l:summary = b:gitgutter.summary
   endif
   return max(l:summary) > 0 ? ' +'.l:summary[0].' ~'.l:summary[1].' -'.l:summary[2].' ' : ''
endfunction

function! myfunctions#GetColorDictionary(color_name)
   let l:color = {}
   for color in g:colorscheme_map
      if a:color_name == color.name || (has_key(color, 'comparison') && color.comparison == 'fuzzy' && a:color_name =~ color.name)
         let l:color = color
         return l:color
      endif
   endfor
   return l:color
endfunction

function! myfunctions#GetColorAttribute(color_name, key)
   let l:key = ''
   let l:color = myfunctions#GetColorDictionary(a:color_name)
   if has_key (l:color, a:key)
      let l:key = l:color[a:key]
   endif
   return l:key
endfunction

function! myfunctions#CurrentColorscheme()
   let l:color_name = g:colors_name
   let l:variant_type = myfunctions#GetColorAttribute(g:colors_name, 'variant_type')
   if l:variant_type == 'background'
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

function! myfunctions#WhichStatus(colorscheme)
   let l:airlinetheme = myfunctions#GetColorAttribute(a:colorscheme, 'airlinetheme')
   let l:lightlinetheme = myfunctions#GetColorAttribute(a:colorscheme, 'lightlinetheme')
   if (empty(l:airlinetheme) && empty(l:lightlinetheme)) || exists('g:buftabline_show')
      let l:user_status = "none"
   elseif exists('g:loaded_airline')
      let l:user_status = "airline"
   elseif exists('g:loaded_lightline')
      let l:user_status = "lightline"
   elseif g:prefer_airline && !empty(l:airlinetheme)
      let l:user_status = "airline"
   elseif !g:prefer_airline && !empty(l:lightlinetheme)
      let l:user_status = "lightline"
   elseif !empty(l:airlinetheme)
      let l:user_status = "airline"
   elseif !empty(l:lightlinetheme)
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
