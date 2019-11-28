function! colorschemefunctions#VimspectrMap (key, val)
    return 'vimspectr' . a:val . '-' . &background
endfunction

function! colorschemefunctions#AtelierMap (key, val)
    if &background == 'light'
        let l:back = 'Light'
    else
        let l:back = 'Dark'
    endif
    return 'Atelier_' . a:val . l:back
endfunction

function! colorschemefunctions#ToggleBackground()
    for color in g:colorscheme_map
        if has_key(color, 'name') && ((g:colors_name =~ color.name && has_key(color, 'comparison') && color.comparison == 'fuzzy') || g:colors_name == color.name)
            if has_key(color, 'variant_type')
                if color.variant_type == 'background' || color.variant_type == 'colorscheme_bg' || color.variant_type == 'gruvbox_material_background'
                    let &background = (&background == 'dark') ? 'light' : 'dark'
                elseif color.variant_type == 'Atelier'
                    let l:new_colors_name = (g:colors_name =~# 'Dark') ? substitute(g:colors_name, 'Dark', 'Light', '') : substitute(g:colors_name, 'Light', 'Dark', '')
                    call xolox#colorscheme_switcher#switch_to(l:new_colors_name)
                elseif color.variant_type == 'vimspectr'
                    let l:new_colors_name = (g:colors_name =~# 'dark') ? substitute(g:colors_name, 'dark', 'light', '') : substitute(g:colors_name, 'light', 'dark', '')
                    call xolox#colorscheme_switcher#switch_to(l:new_colors_name)
                elseif color.variant_type == 'colorscheme' && color.variant_base == 'drop'
                    let l:new_colors_name = (g:colors_name =~# 'dark') ? substitute(g:colors_name, 'dark', 'light', '') : substitute(g:colors_name, 'light', 'dark', '')
                    call xolox#colorscheme_switcher#switch_to(l:new_colors_name)
                elseif color.variant_type == 'materialbox_contrast'
                    if (&background == 'dark')
                        let g:materialbox_contrast_light = g:materialbox_contrast_dark
                        let &background = 'light'
                    else
                        let g:materialbox_contrast_dark = g:materialbox_contrast_light
                        let &background = 'dark'
                    endif
                endif
            endif
            break
        endif
    endfor
endfunction

function! colorschemefunctions#GetNextScheme (delta, schemes, current_scheme, num_variants)
    return a:schemes[((a:delta+index(a:schemes, a:current_scheme)) % a:num_variants + a:num_variants) % a:num_variants]
endfunction

function! colorschemefunctions#SchemeVariant(delta)
    for color in g:colorscheme_map
        if has_key (color, 'name') && ((g:colors_name =~ color.name && has_key(color, 'comparison') && color.comparison == 'fuzzy') || g:colors_name == color.name)
            if has_key(color, 'variant_type')
                "BACKGROUND variant: Toggle between dark and light background.
                if color.variant_type == "background"
                    let &background = (&background == "dark") ? "light" : "dark"
                "COLORSCHEME variant: Toggle between light and dark versions
                " of the same colorscheme.
                else
                    let l:num_variants = len(color.variants)
                    let l:variants = deepcopy(color.variants)
                    if color.variant_type == 'colorscheme'
                        if color.variant_base == 'drop'
                            for variant in color.variants
                                if match(g:colors_name, variant) != -1
                                    let l:variant_list = split(g:colors_name, variant)
                                    let l:variant_base = l:variant_list[0]
                                endif
                            endfor
                        else
                            let l:variant_base = color.variant_base
                        endif
                    elseif color.variant_type == 'colorscheme_bg'
                        let l:variant_base = color.variant_base
                    elseif color.variant_type == 'colorscheme_bg'
                        let l:variant_base = color.variant_base
                        let l:schemes = map(l:variants, 'l:variant_base.v:val')
                    elseif color.variant_type == 'vimspectr'
                        let l:schemes = map(l:variants, function('colorschemefunctions#VimspectrMap'))
                    elseif color.variant_type == 'Atelier'
                        let l:schemes = map(l:variants, function('colorschemefunctions#AtelierMap'))
                    else
                        let l:schemes = color.variants
                    endif

                    if color.variant_type == 'ayu_color'
                        let l:current_scheme = g:ayucolor
                    elseif color.variant_type == 'material_theme_style'
                        let l:current_scheme = g:material_theme_style
                    elseif color.variant_type == 'gruvbox_material_background'
                        let l:current_scheme = g:gruvbox_material_background
                    elseif color.variant_type == 'materialbox_contrast'
                        if &background == 'light'
                            let l:current_scheme = g:materialbox_contrast_light
                        else
                            let l:current_scheme = g:materialbox_contrast_dark
                        endif
                    else
                        let l:current_scheme = g:colors_name
                    endif

                    let l:next_scheme = colorschemefunctions#GetNextScheme(a:delta, l:schemes, l:current_scheme, l:num_variants)

                    if color.variant_type == 'ayu_color'
                        let g:ayucolor = l:next_scheme
                        let ayucolor = g:ayucolor
                        exe 'colors ayu'
                    elseif color.variant_type == 'material_theme_style'
                        let g:material_theme_style = l:next_scheme
                        exe 'colors material'
                    elseif color.variant_type == 'gruvbox_material_background'
                        let g:gruvbox_material_background = l:next_scheme
                        exe 'colors gruvbox-material'
                    elseif color.variant_type == 'materialbox_contrast'
                        if &background == 'light'
                            let g:materialbox_contrast_light = l:next_scheme
                        else
                            let g:materialbox_contrast_dark = l:next_scheme
                        endif
                        exe 'colors materialbox'
                    else
                        exe 'colors' l:next_scheme
                    endif

                    if color.variant_type == 'colorscheme_bg' || color.variant_type == 'vimspectr' || color.variant_type == 'gruvbox_material_background' || color.variant_type == 'materialbox_contrast'
                        if a:delta+index(l:schemes, l:current_scheme) >= l:num_variants || a:delta+index(l:schemes, l:current_scheme) < 0
                            let &background = (&background == 'dark') ? 'light' : 'dark'
                        endif
                    endif
                endif
                break
            endif
        endif
    endfor
endfunction

function! colorschemefunctions#AirlineTheme(colorscheme)
    if !myfunctions#ColorschemeHasAirlineTheme(g:colors_name)
        exec "AirlineTheme dark"
    else
        for color in g:colorscheme_map
            if has_key (color, 'name') && ((g:colors_name =~ color.name && has_key(color, 'comparison') && color.comparison == 'fuzzy') || g:colors_name == color.name)
                if has_key(color, 'airlinetheme')
                    if (color.airlinetheme == 'colorscheme_bg')
                        exec "AirlineTheme " . a:colorscheme . "_" . &background
                    endif
                endif
                break
            endif
        endfor
    endif
endfunction

function! colorschemefunctions#SetLastColorscheme()
    let l:last_colorscheme = readfile(expand(g:colorscheme_file))
    let l:colorscheme_is_group_member = 0

    for color in g:colorscheme_map
        if has_key (color, 'name') && ((color.name =~ l:last_colorscheme[1] && has_key(color, 'comparison') && color.comparison == 'fuzzy') || color.name == last_colorscheme[1])
            if has_key(color, 'variant_type') && color.variant_type == 'background'
                exec 'set background=' . l:last_colorscheme[0]
            endif
            break
        endif
    endfor

    for colorscheme_group in values(g:colorscheme_groups)
        for colorscheme_group_member in colorscheme_group
            if l:last_colorscheme[1] == colorscheme_group_member
                call xolox#colorscheme_switcher#switch_to(colorscheme_group[localtime() % len(colorscheme_group)])
                let l:colorscheme_is_group_member = 1
                break
            endif
        endfor
    endfor

    if !l:colorscheme_is_group_member
        call xolox#colorscheme_switcher#switch_to(l:last_colorscheme[1])
    endif
endfunction
