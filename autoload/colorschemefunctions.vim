function! colorschemefunctions#SchemeVariant(delta)
    if g:colors_name =~ "typewriter"
        let l:schemes = map(['', '-night'], '"typewriter".v:val')
        exe 'colors' l:schemes[((a:delta+index(l:schemes, g:colors_name)) % 2 + 2) % 2]
    elseif g:colors_name =~ "corvine"
        let l:schemes = map(['', '_light'], '"corvine".v:val')
        exe 'colors' l:schemes[((a:delta+index(l:schemes, g:colors_name)) % 2 + 2) % 2]
    elseif g:colors_name == "ayu"
        let l:schemes = ['light', 'dark', 'mirage']
        let g:ayucolor = l:schemes[((a:delta+index(l:schemes, g:ayucolor)) % 3 + 3) % 3]
        let ayucolor = g:ayucolor
        exe 'colors ayu'
    elseif g:colors_name == "material"
        let l:schemes = ['default', 'palenight', 'ocean', 'lighter', 'darker']
        let g:material_theme_style = l:schemes[((a:delta+index(l:schemes, g:material_theme_style)) % 5 + 5) % 5]
        exe 'colors material'
    elseif g:colors_name == "snow"
                \ || g:colors_name == "cosmic_latte"
                \ || g:colors_name == "stellarized"
                \ || g:colors_name == "vadelma"
                \ || g:colors_name == "one"
                \ || g:colors_name == "space_vim_theme"
                \ || g:colors_name == "pencil"
                \ || g:colors_name == "quantum"
                \ || g:colors_name == "edge"
        let l:schemes = ['dark', 'light']
        let &background = l:schemes[((a:delta+index(l:schemes, &background)) %2 + 2) % 2]
    elseif g:colors_name == "gruvbox-material"
        let l:schemes = ['soft', 'medium', 'hard']
        if a:delta+index(l:schemes, g:gruvbox_material_background) >= 3 || a:delta+index(l:schemes, g:gruvbox_material_background) < 0
           let &background = (&background == "dark") ? "light" : "dark"
        endif
        let g:gruvbox_material_background = l:schemes[((a:delta+index(l:schemes, g:gruvbox_material_background)) % 3 + 3) % 3]
        exe 'colors gruvbox-material'
    elseif g:colors_name == "materialbox"
        let l:schemes = ['soft', 'medium', 'hard']
        if &background == "light"
            if a:delta+index(l:schemes, g:materialbox_contrast_light) >= 3 || a:delta+index(l:schemes, g:materialbox_contrast_light) < 0
               let &background = "dark"
            endif
            let g:materialbox_contrast_light = l:schemes[((a:delta+index(l:schemes, g:materialbox_contrast_light)) % 3 + 3) % 3]
            exe 'colors materialbox'
        else
            if a:delta+index(l:schemes, g:materialbox_contrast_dark) >= 3 || a:delta+index(l:schemes, g:materialbox_contrast_dark) < 0
               let &background = "light"
            endif
            let g:materialbox_contrast_dark = l:schemes[((a:delta+index(l:schemes, g:materialbox_contrast_dark)) % 3 + 3) % 3]
            exe 'colors materialbox'
        endif
    elseif g:colors_name =~ "onehalf"
        let l:schemes = map(['light', 'dark'], '"onehalf".v:val')
        exe 'colors' l:schemes[((a:delta+index(l:schemes, g:colors_name)) % 2 + 2) %2]
    endif
endfunction

function! colorschemefunctions#AirlineTheme(colorscheme)
    if a:colorscheme == "cosmic_latte"
                \ || a:colorscheme == "snow"
                \ || a:colorscheme == "stellarized"
        exec "AirlineTheme " . a:colorscheme . "_" . &background
    elseif a:colorscheme == "greygull"
                \ || a:colorscheme == "petrel"
                \ || a:colorscheme == "stormpetrel"
        exec "AirlineTheme seagull"
    elseif a:colorscheme == "corvine"
                \ || a:colorscheme == "corvine_light"
                \ || a:colorscheme == "darcula"
                \ || a:colorscheme == "material"
                \ || a:colorscheme == "snazzy"
                \ || a:colorscheme == "space_vim_theme"
                \ || a:colorscheme == "substrata"
                \ || a:colorscheme == "vadelma"
                \ || a:colorscheme == "vibrantink"
                \ || a:colorscheme == "vividchalk"
        exec "AirlineTheme dark"
    endif
endfunction
