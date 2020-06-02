function! s:VimspectrMap (key, val)
    return 'vimspectr' . a:val . '-' . &background
endfunction

function! s:AtelierMap (key, val)
    if &background == 'light'
        let l:back = 'Light'
    else
        let l:back = 'Dark'
    endif
    return 'Atelier_' . a:val . l:back
endfunction

function! s:ToggleBG()
    let &background = (&background == 'dark') ? 'light' : 'dark'
endfunction

function! s:GetColorschemeVariantList (colordict)
    if has_key(a:colordict,'variants')
        let l:variants = deepcopy(a:colordict.variants)
        if a:colordict.variant_type == 'colorscheme'
            if a:colordict.variant_base == 'drop'
                for variant in a:colordict.variants
                    if match(g:colors_name, variant) != -1
                        let l:variant_list = split(g:colors_name, variant)
                        let l:variant_base = l:variant_list[0]
                    endif
                endfor
            else
                let l:variant_base = a:colordict.variant_base
            endif
            let s:variant_list =  map(l:variants, 'l:variant_base.v:val')
        elseif a:colordict.variant_type == 'colorscheme_bg'
            let l:variant_base = a:colordict.variant_base
            let s:variant_list =  map(l:variants, 'l:variant_base.v:val')
        elseif a:colordict.variant_type == 'vimspectr'
            let s:variant_list =  map(l:variants, function('s:VimspectrMap'))
        elseif a:colordict.variant_type == 'Atelier'
            let s:variant_list =  map(l:variants, function('s:AtelierMap'))
        else
            let s:variant_list =  a:colordict.variants
        endif
    endif
    return s:variant_list
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

function! colorschemefunctions#GetColorAttribute(color_name, key)
   let l:key = ''
   let l:color = colorschemefunctions#GetColorDictionary(a:color_name)
   if has_key (l:color, a:key)
      let l:key = l:color[a:key]
   endif
   return l:key
endfunction

function! colorschemefunctions#GetColorAttributefromDictionary(color_dict, key)
   let l:key = ''
   if has_key (a:color_dict, a:key)
      let l:key = a:color_dict[a:key]
   endif
   return l:key
endfunction

function! colorschemefunctions#CurrentColorscheme()
   let l:color_name = g:colors_name
   let l:variant_type = colorschemefunctions#GetColorAttributefromDictionary(g:current_color_dictionary, 'variant_type')
   if l:variant_type == 'background'
      let l:color_name = g:colors_name . '/' . &background
   elseif l:variant_type == 'ayu_color'
      let l:color_name = g:colors_name . '/' . g:ayucolor
   elseif l:variant_type == 'sonokai_style'
      let l:color_name = g:colors_name . '/' . g:sonokai_style
   elseif l:variant_type == 'gruvbox_material_background'
      let l:color_name = g:colors_name . '/' . g:gruvbox_material_background
   elseif l:variant_type == 'material_theme_style'
      let l:color_name = g:colors_name . '/' . g:material_theme_style
   elseif l:variant_type == 'gruvbox_contrast'
      if &background == "light"
         let l:color_name = g:colors_name . '/' . g:gruvbox_contrast_light
      else
         let l:color_name = g:colors_name . '/' . g:gruvbox_contrast_dark
      endif
   elseif l:variant_type == 'materialbox_contrast'
      if &background == "light"
         let l:color_name = g:colors_name . '/' . g:materialbox_contrast_light
      else
         let l:color_name = g:colors_name . '/' . g:materialbox_contrast_dark
      endif
   endif
   return l:color_name
endfunction

function! s:GetCurrentColorschemeVariant (colordict)
    if a:colordict.variant_type == 'ayu_color'
        let l:variant = g:ayucolor
     elseif a:colordict.variant_type == 'sonokai_style'
        let l:variant = g:sonokai_style
    elseif a:colordict.variant_type == 'material_theme_style'
        let l:variant = g:material_theme_style
    elseif a:colordict.variant_type == 'gruvbox_material_background'
        let l:variant = g:gruvbox_material_background
    elseif a:colordict.variant_type == 'gruvbox_contrast'
        if &background == 'light'
            let l:variant = g:gruvbox_contrast_light
        else
            let l:variant = g:gruvbox_contrast_dark
        endif
    elseif a:colordict.variant_type == 'materialbox_contrast'
        if &background == 'light'
            let l:variant = g:materialbox_contrast_light
        else
            let l:variant = g:materialbox_contrast_dark
        endif
    else
        let l:variant = g:colors_name
    endif
    return l:variant
endfunction

function s:GetNextColorscheme (colordict, next_scheme)
    if a:colordict.variant_type == 'ayu_color'
        let g:ayucolor = a:next_scheme
        let ayucolor = g:ayucolor
        let s:next_colorscheme = 'ayu'
     elseif a:colordict.variant_type == 'sonokai_style'
        let g:sonokai_style = a:next_scheme
        let s:next_colorscheme = 'sonokai'
    elseif a:colordict.variant_type == 'material_theme_style'
        let g:material_theme_style = a:next_scheme
        let s:next_colorscheme = 'material'
    elseif a:colordict.variant_type == 'gruvbox_material_background'
        let g:gruvbox_material_background = a:next_scheme
        let s:next_colorscheme = 'gruvbox-material'
    elseif a:colordict.variant_type == 'gruvbox_contrast'
        if &background == 'light'
            let g:gruvbox_contrast_light = a:next_scheme
        else
            let g:gruvbox_contrast_dark = a:next_scheme
        endif
        let s:next_colorscheme = 'gruvbox'
    elseif a:colordict.variant_type == 'materialbox_contrast'
        if &background == 'light'
            let g:materialbox_contrast_light = a:next_scheme
        else
            let g:materialbox_contrast_dark = a:next_scheme
        endif
        let s:next_colorscheme = 'materialbox'
    else
        let s:next_colorscheme = a:next_scheme
    endif
    return s:next_colorscheme
endfunction

function! s:PossiblyToggleBackground (delta, colordict, variants, current_variant)
    let l:num_variants = len(a:variants)
    if a:colordict.variant_type == 'colorscheme_bg' || a:colordict.variant_type == 'gruvbox_material_background' || a:colordict.variant_type == 'materialbox_contrast' || a:colordict.variant_type == 'gruvbox_contrast'
        if a:delta+index(a:variants, a:current_variant) >= l:num_variants || a:delta+index(a:variants, a:current_variant) < 0
            call s:ToggleBG()
        endif
    endif
endfunction

function! s:GetNextScheme (delta, schemes, current_scheme)
    let l:num_variants = len(a:schemes)
    return a:schemes[((a:delta+index(a:schemes, a:current_scheme)) % l:num_variants + l:num_variants) % l:num_variants]
endfunction

function! colorschemefunctions#ToggleBackground()
    let l:variant_type = colorschemefunctions#GetColorAttributefromDictionary(g:current_color_dictionary, 'variant_type')
    if l:variant_type == 'background' || l:variant_type == 'colorscheme_bg' || l:variant_type == 'gruvbox_material_background'
        call s:ToggleBG()
    elseif l:variant_type == 'Atelier'
        let l:new_colors_name = (g:colors_name =~# 'Dark') ? substitute(g:colors_name, 'Dark', 'Light', '') : substitute(g:colors_name, 'Light', 'Dark', '')
        call xolox#colorscheme_switcher#switch_to(l:new_colors_name)
    elseif l:variant_type == 'vimspectr'
        let l:new_colors_name = (g:colors_name =~# 'dark') ? substitute(g:colors_name, 'dark', 'light', '') : substitute(g:colors_name, 'light', 'dark', '')
        call xolox#colorscheme_switcher#switch_to(l:new_colors_name)
    elseif l:variant_type == 'colorscheme' && color.variant_base == 'drop'
        let l:new_colors_name = (g:colors_name =~# 'dark') ? substitute(g:colors_name, 'dark', 'light', '') : substitute(g:colors_name, 'light', 'dark', '')
        call xolox#colorscheme_switcher#switch_to(l:new_colors_name)
    elseif l:variant_type == 'gruvbox_contrast'
        if (&background == 'dark')
            let g:gruvbox_contrast_light = g:gruvbox_contrast_dark
            let &background = 'light'
        else
            let g:gruvbox_contrast_dark = g:gruvbox_contrast_light
            let &background = 'dark'
        endif
    elseif l:variant_type == 'materialbox_contrast'
        if (&background == 'dark')
            let g:materialbox_contrast_light = g:materialbox_contrast_dark
            let &background = 'light'
        else
            let g:materialbox_contrast_dark = g:materialbox_contrast_light
            let &background = 'dark'
        endif
    endif
endfunction

function! colorschemefunctions#SchemeVariant(delta)
    let l:variant_type = colorschemefunctions#GetColorAttributefromDictionary(g:current_color_dictionary, 'variant_type')
    if l:variant_type == 'background'
        call s:ToggleBG()
    elseif l:variant_type != ''
        let l:schemes = s:GetColorschemeVariantList (g:current_color_dictionary)
        let l:current_scheme = s:GetCurrentColorschemeVariant (g:current_color_dictionary)
        let l:next_scheme = s:GetNextScheme(a:delta, l:schemes, l:current_scheme)
        call xolox#colorscheme_switcher#switch_to(s:GetNextColorscheme(g:current_color_dictionary, l:next_scheme))
        call s:PossiblyToggleBackground (a:delta, g:current_color_dictionary, l:schemes, l:current_scheme)
    endif
endfunction

function! colorschemefunctions#AirlineTheme(colorscheme)
    let l:airlinetheme = colorschemefunctions#GetColorAttribute(a:colorscheme, 'airlinetheme')
    if empty(l:airlinetheme)
        exec "AirlineTheme distinguished"
    elseif l:airlinetheme == 'colorscheme_bg'
        exec "AirlineTheme " . a:colorscheme . "_" . &background
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
    call xolox#colorscheme_switcher#switch_to(s:ChooseNextColorscheme(l:last_colorscheme[1]))
endfunction
