function! colorschemefunctions#SchemeVariant(delta)
    for color in g:colorscheme_map
        if has_key (color, 'name') && ((g:colors_name =~ color.name && has_key(color, 'comparison') && color.comparison == 'fuzzy') || g:colors_name == color.name)
            if has_key(color, 'variant_type')
                if color.variant_type == "background"
                    let &background = (&background == "dark") ? "light" : "dark"
                elseif color.variant_type == "colorscheme"
                    let l:num_variants = len(color.variants)
                    let l:variants = deepcopy(color.variants)
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
                elseif color.variant_type == "colorscheme_bg"
                    let l:num_variants = len(color.variants)
                    let l:variants = deepcopy(color.variants)
                    let l:variant_base = color.variant_base
                    let l:schemes = map(l:variants, 'l:variant_base.v:val')
                    if a:delta+index(l:schemes, g:colors_name) >= l:num_variants || a:delta+index(l:schemes, g:colors_name) < 0
                       let &background = (&background == "dark") ? "light" : "dark"
                    endif
                    exe 'colors' l:schemes[((a:delta+index(l:schemes, g:colors_name)) % l:num_variants + l:num_variants) % l:num_variants]
                elseif color.variant_type == "ayu_color"
                    let l:num_variants = len(color.variants)
                    let l:schemes = color.variants
                    let g:ayucolor = l:schemes[((a:delta+index(l:schemes, g:ayucolor)) % l:num_variants + l:num_variants) % l:num_variants]
                    let ayucolor = g:ayucolor
                    exe 'colors ayu'
                elseif color.variant_type == "material_theme_style"
                    let l:num_variants = len(color.variants)
                    let g:material_theme_style = color.variants[((a:delta+index(color.variants, g:material_theme_style)) % l:num_variants + l:num_variants) % l:num_variants]
                    exe 'colors material'
                elseif color.variant_type == "gruvbox_material_background"
                    let l:num_variants = len(color.variants)
                    if a:delta+index(color.variants, g:gruvbox_material_background) >= l:num_variants || a:delta+index(color.variants, g:gruvbox_material_background) < 0
                       let &background = (&background == "dark") ? "light" : "dark"
                    endif
                    let g:gruvbox_material_background = color.variants[((a:delta+index(color.variants, g:gruvbox_material_background)) % l:num_variants + l:num_variants) % l:num_variants]
                    exe 'colors gruvbox-material'
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
    for color in g:colorscheme_map
        if has_key (color, 'name') && ((g:colors_name =~ color.name && has_key(color, 'comparison') && color.comparison == 'fuzzy') || g:colors_name == color.name)
            if has_key(color, 'airlinetheme') && color.airlinetheme == 'colorscheme_bg'
                exec "AirlineTheme " . a:colorscheme . "_" . &background
            endif
            break
        endif
    endfor
    if !myfunctions#ColorschemeHasAirlineTheme(g:colors_name)
        exec "AirlineTheme dark"
    endif
endfunction
