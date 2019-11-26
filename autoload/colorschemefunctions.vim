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

function! colorschemefunctions#SchemeVariant(delta)
    for color in g:colorscheme_map
        if has_key (color, 'name') && ((g:colors_name =~ color.name && has_key(color, 'comparison') && color.comparison == 'fuzzy') || g:colors_name == color.name)
            if has_key(color, 'variant_type')
                "BACKGROUND variant: Toggle between dark and light background.
                if color.variant_type == "background"
                    let &background = (&background == "dark") ? "light" : "dark"
                "COLORSCHEME variant: Toggle between light and dark versions
                " of the same colorscheme.
                elseif color.variant_type == "colorscheme"
                    let l:num_variants = len(color.variants)
                    let l:variants = deepcopy(color.variants)
                    " variant_base is the common part of the colorscheme name.
                    " If it is set to "drop" then the background value is in
                    " the colorscheme name and needs to be changed.
                    if color.variant_base == "drop"
                        for variant in color.variants
                            if match(g:colors_name, variant) != -1
                                let l:variant_list = split(g:colors_name, variant)
                                let l:variant_base = l:variant_list[0]
                            endif
                        endfor
                    else
                        let l:variant_base = color.variant_base
                    endif
                    let l:schemes = map(l:variants, 'l:variant_base.v:val')
                    exe 'colors' l:schemes[((a:delta+index(l:schemes, g:colors_name)) % l:num_variants + l:num_variants) % l:num_variants]
                "COLORSCHEME_BG Variant: The colorscheme has variants and also
                "changes based on the background value.
                elseif color.variant_type == "colorscheme_bg"
                    let l:num_variants = len(color.variants)
                    let l:variants = deepcopy(color.variants)
                    let l:variant_base = color.variant_base
                    let l:schemes = map(l:variants, 'l:variant_base.v:val')
                    if a:delta+index(l:schemes, g:colors_name) >= l:num_variants || a:delta+index(l:schemes, g:colors_name) < 0
                       let &background = (&background == "dark") ? "light" : "dark"
                    endif
                    exe 'colors' l:schemes[((a:delta+index(l:schemes, g:colors_name)) % l:num_variants + l:num_variants) % l:num_variants]
                elseif color.variant_type == "colorscheme_group"
                    let l:num_variants = len(color.variants)
                    exe 'colors' color.variants[((a:delta+index(color.variants, g:colors_name)) % l:num_variants + l:num_variants) % l:num_variants]
                elseif color.variant_type == "vimspectr"
                    let l:num_variants = len(color.variants)
                    let l:variants = deepcopy(color.variants)
                    let l:schemes = map(l:variants, function('colorschemefunctions#VimspectrMap'))
                    exe 'colors' l:schemes[((a:delta+index(l:schemes, g:colors_name)) % l:num_variants + l:num_variants) % l:num_variants]
                    if a:delta+index(l:schemes, g:colors_name) >= l:num_variants || a:delta+index(l:schemes, g:colors_name) < 0
                       let &background = (&background == "dark") ? "light" : "dark"
                    endif
                elseif color.variant_type == "Atelier"
                    let l:num_variants = len(color.variants)
                    let l:variants = deepcopy(color.variants)
                    let l:schemes = map(l:variants, function('colorschemefunctions#AtelierMap'))
                    exe 'colors' l:schemes[((a:delta+index(l:schemes, g:colors_name)) % l:num_variants + l:num_variants) % l:num_variants]
                "AYU_COLOR Variant: specific to the ayu colorscheme, which
                "uses a variable to determine which variant to select
                elseif color.variant_type == "ayu_color"
                    let l:num_variants = len(color.variants)
                    let l:schemes = color.variants
                    let g:ayucolor = l:schemes[((a:delta+index(l:schemes, g:ayucolor)) % l:num_variants + l:num_variants) % l:num_variants]
                    let ayucolor = g:ayucolor
                    exe 'colors ayu'
                "MATERIAL_THEME_STYLE Variant: Specific to the material
                "colorscheme, which uses a variable to determine which variant
                "to select.
                elseif color.variant_type == "material_theme_style"
                    let l:num_variants = len(color.variants)
                    let g:material_theme_style = color.variants[((a:delta+index(color.variants, g:material_theme_style)) % l:num_variants + l:num_variants) % l:num_variants]
                    exe 'colors material'
                "GRUVBOX_MATERIAL_BACKGROUND Variant: Specific to the
                "qruvbox_material colorscheme, which uses a variable to select the
                "contrast level.
                elseif color.variant_type == "gruvbox_material_background"
                    let l:num_variants = len(color.variants)
                    if a:delta+index(color.variants, g:gruvbox_material_background) >= l:num_variants || a:delta+index(color.variants, g:gruvbox_material_background) < 0
                       let &background = (&background == "dark") ? "light" : "dark"
                    endif
                    let g:gruvbox_material_background = color.variants[((a:delta+index(color.variants, g:gruvbox_material_background)) % l:num_variants + l:num_variants) % l:num_variants]
                    exe 'colors gruvbox-material'
                "MATERIALBOX_CONTRAST Variant: Specific to the materialbox
                "colorscheme, which uses two variables to select the contrast
                "level.
                elseif color.variant_type == "materialbox_contrast"
                    let l:num_variants = len(color.variants)
                    if &background == "light"
                        if a:delta+index(color.variants, g:materialbox_contrast_light) >= l:num_variants || a:delta+index(color.variants, g:materialbox_contrast_light) < 0
                           let &background = "dark"
                        endif
                        let g:materialbox_contrast_light = color.variants[((a:delta+index(color.variants, g:materialbox_contrast_light)) % l:num_variants + l:num_variants) % l:num_variants]
                        exe 'colors materialbox'
                    else
                        if a:delta+index(color.variants, g:materialbox_contrast_dark) >= l:num_variants || a:delta+index(color.variants, g:materialbox_contrast_dark) < 0
                           let &background = "light"
                        endif
                        let g:materialbox_contrast_dark = color.variants[((a:delta+index(color.variants, g:materialbox_contrast_dark)) % l:num_variants + l:num_variants) % l:num_variants]
                        exe 'colors materialbox'
                    endif
                endif
            endif
            break
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
