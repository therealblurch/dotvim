function! myfunctions#GitgutterStatus()
   let l:summary = [0, 0, 0]
   if exists('b:gitgutter.summary')
      let l:summary = b:gitgutter.summary
   endif
   return max(l:summary) > 0 ? ' +'.l:summary[0].' ~'.l:summary[1].' -'.l:summary[2].' ' : ''
endfunction

function! myfunctions#CurrentColorscheme()
   let l:color_name = g:colors_name
   for color in g:colorscheme_map
      if has_key (color, 'name') && ((g:colors_name =~ color.name && has_key(color, 'comparison') && color.comparison == 'fuzzy') || g:colors_name == color.name)
         if has_key(color, 'variant_type')
            if color.variant_type == 'colorscheme'
               let l:color_name = g:colors_name
            elseif color.variant_type == 'background'
               let l:color_name = g:colors_name . '/' . &background
            elseif color.variant_type == 'ayu_color'
               let l:color_name = g:colors_name . '/' . g:ayucolor
            elseif color.variant_type == 'gruvbox_material_background'
               let l:color_name = g:colors_name . '/' . g:gruvbox_material_background
            elseif color.variant_type == 'material_theme_style'
               let l:color_name = g:colors_name . '/' . g:material_theme_style
            elseif color.variant_type == 'materialbox_contrast'
               if &background == "light"
                  let l:color_name = g:colors_name . '/' . g:materialbox_contrast_light
               else
                  let l:color_name = g:colors_name . '/' . g:materialbox_contrast_dark
               endif
            endif
         endif
         break
      endif
   endfor
   return l:color_name
endfunction

function! myfunctions#ColorschemeHasAirlineTheme(colorscheme)
   let l:airline_theme_exists = 0
   for color in g:colorscheme_map
      if has_key (color, 'name') && ((g:colors_name =~ color.name && has_key(color, 'comparison') && color.comparison == 'fuzzy') || g:colors_name == color.name)
         if has_key(color, 'airlinetheme')
            let l:airline_theme_exists = 1
         endif
         break
      endif
   endfor
   return l:airline_theme_exists
endfunction

function! s:ColorschemeHasLightlineColorscheme(colorscheme)
   let l:lightline_theme_exists = 0
   for color in g:colorscheme_map
      if has_key (color, 'name') && ((g:colors_name =~ color.name && has_key(color, 'comparison') && color.comparison == 'fuzzy') || g:colors_name == color.name)
         if has_key(color, 'lightlinetheme')
            let l:lightline_theme_exists = 1
         endif
         break
      endif
   endfor
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
