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
            \ || g:colors_name == "space_vim_theme"
            \ || g:colors_name == "cosmic_latte"
            \ || g:colors_name == "vadelma"
            \ || g:colors_name == "one"
      let s:color = g:colors_name . '/' . &background
   else
      let s:color = g:colors_name
   endif
   return s:color
endfunction
