function! myfunctions#GitgutterStatus()
   let s:summary = [0, 0, 0]
   if exists('b:gitgutter.summary')
      let s:summary = b:gitgutter.summary
   endif
   return max(s:summary) > 0 ? ' +'.s:summary[0].' ~'.s:summary[1].' -'.s:summary[2].' ' : ''
endfunction

function! myfunctions#CurrentColorscheme()
   if g:colors_name == "ayu"
      let s:color = g:colors_name . '/' . g:ayucolor
   elseif g:colors_name == "material"
      let s:color = g:colors_name . '/' . g:material_theme_style
   elseif g:colors_name == "gruvbox-material"
      let s:color = g:colors_name . '/' . g:gruvbox_material_background
   elseif g:colors_name == "materialbox"
      if &background == "light"
         let s:color = g:colors_name . '/' . g:materialbox_contrast_light
      else
         let s:color = g:colors_name . '/' . g:materialbox_contrast_dark
      endif
   elseif g:colors_name == "snow"
            \ || g:colors_name == "stellarized"
            \ || g:colors_name == "cosmic_latte"
            \ || g:colors_name == "vadelma"
            \ || g:colors_name == "one"
            \ || g:colors_name == "space_vim_theme"
            \ || g:colors_name == "pencil"
      let s:color = g:colors_name . '/' . &background
   else
      let s:color = g:colors_name
   endif
   return s:color
endfunction

function! s:ColorschemeHasAirlineTheme(colorscheme)
   let s:airline_theme_exists = 0
   if a:colorscheme == "nord"
            \ || a:colorscheme == "ayu"
            \ || a:colorscheme == "iceberg"
            \ || a:colorscheme == "afterglow"
            \ || a:colorscheme == "dracula"
            \ || a:colorscheme == "dracula"
            \ || a:colorscheme == "tender"
            \ || a:colorscheme =~ "typewriter"
            \ || a:colorscheme == "materialbox"
            \ || a:colorscheme == "jellybeans"
            \ || a:colorscheme == "cosmic_latte"
            \ || a:colorscheme == "seabird"
            \ || a:colorscheme == "greygull"
            \ || a:colorscheme == "petrel"
            \ || a:colorscheme == "stormpetrel"
            \ || a:colorscheme == "snow"
            \ || a:colorscheme == "stellarized"
            \ || a:colorscheme =~ "one"
            \ || a:colorscheme == "pencil"
            \ || a:colorscheme == "apprentice"
            \ || a:colorscheme == "gruvbox-materiel"
            \ || a:colorscheme == "srcery"
            \ || a:colorscheme == "desertink"
            \ || a:colorscheme == "deep-space"
      let s:airline_theme_exists = 1
   endif
   return s:airline_theme_exists
endfunction

function! s:ColorschemeHasLightlineColorscheme(colorscheme)
   let s:lightline_theme_exists = 0
   if a:colorscheme == "apprentice"
            \ || a:colorscheme == "ayu"
            \ || a:colorscheme == "cosmic_latter"
            \ || a:colorscheme == "darcula"
            \ || a:colorscheme == "dracula"
            \ || a:colorscheme == "deep-space"
            \ || a:colorscheme == "gruvbox-material"
            \ || a:colorscheme == "iceberg"
            \ || a:colorscheme == "jellybeans"
            \ || a:colorscheme == "material"
            \ || a:colorscheme == "night-owl"
            \ || a:colorscheme == "nord"
            \ || a:colorscheme =~ "one"
            \ || a:colorscheme == "pencil"
            \ || a:colorscheme == "snazzy"
            \ || a:colorscheme == "snow"
            \ || a:colorscheme == "space_vim_theme"
            \ || a:colorscheme == "srcery"
            \ || a:colorscheme == "stellarized"
            \ || a:colorscheme == "tender"
            \ || a:colorscheme =~ "typewriter"
            \ || a:colorscheme == "vadelma"
      let s:lightline_theme_exists = 1
   endif
   return s:lightline_theme_exists
endfunction

function! myfunctions#WhichStatus(colorscheme)
   if (!s:ColorschemeHasAirlineTheme(a:colorscheme) && !s:ColorschemeHasLightlineColorscheme(a:colorscheme)) || exists('g:buftabline_show')
      let s:user_status = "none"
   elseif g:prefer_airline
      if exists('g:loaded_lightline') || !s:ColorschemeHasAirlineTheme(a:colorscheme)
         let s:user_status = "lightline"
      elseif exists('g:loaded_airline') || s:ColorschemeHasAirlineTheme(a:colorscheme)
         let s:user_status = "airline"
      endif
   else
      if exists('g:loaded_airline') || !s:ColorschemeHasLightlineColorscheme(a:colorscheme)
         let s:user_status = "airline"
      elseif exists('g:loaded_lightline') || s:ColorschemeHasLightlineColorscheme(a:colorscheme)
         let s:user_status = "lightline"
      endif
   endif
   return s:user_status
endfunction
