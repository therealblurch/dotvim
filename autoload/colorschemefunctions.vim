function! colorschemefunctions#SchemeVariant(delta)
    for color in g:colorscheme_map
        if has_key (color, 'name') && ((g:colors_name =~ color.name && has_key(color, 'comparison') && color.comparison == 'fuzzy') || (g:colors_name == color.name))
            if has_key(color, 'variant_type')
                if color.variant_type == "background"
                    let l:schemes = ['dark', 'light']
                    exe 'colors' l:schemes[((a:delta+index(l:schemes, g:colors_name)) % l:num_variants + l:num_variants) % l:num_variants]
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
                elseif color.variant_type == "ayu_color"
                    let l:num_variants = len(color.variants)
                    let l:schemes = color.variants
                    let g:ayucolor = l:schemes[((a:delta+index(l:schemes, g:ayucolor)) % l:num_variants + l:num_variants) % l:num_variants]
                    let ayucolor = g:ayucolor
                    exe 'colors ayu'
                endif
            endif
        endif
    endfor

    " elseif g:colors_name == "ayu"
    "     let l:schemes = ['light', 'dark', 'mirage']
    "     let g:ayucolor = l:schemes[((a:delta+index(l:schemes, g:ayucolor)) % 3 + 3) % 3]
    "     let ayucolor = g:ayucolor
    "     exe 'colors ayu'
    " elseif g:colors_name == "material"
    "     let l:schemes = ['default', 'palenight', 'ocean', 'lighter', 'darker']
    "     let g:material_theme_style = l:schemes[((a:delta+index(l:schemes, g:material_theme_style)) % 5 + 5) % 5]
    "     exe 'colors material'
    " elseif g:colors_name == "gruvbox-material"
    "     let l:schemes = ['soft', 'medium', 'hard']
    "     if a:delta+index(l:schemes, g:gruvbox_material_background) >= 3 || a:delta+index(l:schemes, g:gruvbox_material_background) < 0
    "        let &background = (&background == "dark") ? "light" : "dark"
    "     endif
    "     let g:gruvbox_material_background = l:schemes[((a:delta+index(l:schemes, g:gruvbox_material_background)) % 3 + 3) % 3]
    "     exe 'colors gruvbox-material'
    " elseif g:colors_name == "materialbox"
    "     let l:schemes = ['soft', 'medium', 'hard']
    "     if &background == "light"
    "         if a:delta+index(l:schemes, g:materialbox_contrast_light) >= 3 || a:delta+index(l:schemes, g:materialbox_contrast_light) < 0
    "            let &background = "dark"
    "         endif
    "         let g:materialbox_contrast_light = l:schemes[((a:delta+index(l:schemes, g:materialbox_contrast_light)) % 3 + 3) % 3]
    "         exe 'colors materialbox'
    "     else
    "         if a:delta+index(l:schemes, g:materialbox_contrast_dark) >= 3 || a:delta+index(l:schemes, g:materialbox_contrast_dark) < 0
    "            let &background = "light"
    "         endif
    "         let g:materialbox_contrast_dark = l:schemes[((a:delta+index(l:schemes, g:materialbox_contrast_dark)) % 3 + 3) % 3]
    "         exe 'colors materialbox'
    "     endif
    " elseif g:colors_name =~ "solarized8"
    "     let l:schemes = map (['', '_low', '_flat', '_high'], '"solarized8".v:val')
    "     if &background == "light"
    "         if a:delta+index(l:schemes, g:colors_name) >= 4 || a:delta+index(l:schemes, g:colors_name) < 0
    "            let &background = "dark"
    "         endif
    "     else
    "         if a:delta+index(l:schemes, g:colors_name) >= 4 || a:delta+index(l:schemes, g:colors_name) < 0
    "            let &background = "light"
    "         endif
    "     endif
    "     exe 'colors' l:schemes[((a:delta+index(l:schemes, g:colors_name)) % 4 + 4) % 4]
    " elseif g:colors_name =~ "onehalf"
    "     let l:schemes = map(['light', 'dark'], '"onehalf".v:val')
    "     exe 'colors' l:schemes[((a:delta+index(l:schemes, g:colors_name)) % 2 + 2) %2]
    " endif
endfunction

function! colorschemefunctions#AirlineTheme(colorscheme)
    for color in g:colorscheme_map
        if has_key (color, 'name') && ((g:colors_name =~ color.name && has_key(color, 'comparison') && color.comparison == 'fuzzy') || (g:colors_name == color.name)
            if has_key(color, 'airlinetheme') && color.airlinetheme == 'colorscheme_bg'
                exec "AirlineTheme " . a:colorscheme . "_" . &background
            endif
        endif
    endfor
    if !myfunctions#ColorschemeHasAirlineTheme(g:colors_name)
        exec "AirlineTheme dark"
    endif
endfunction
