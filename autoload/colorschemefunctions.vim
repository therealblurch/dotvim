function! colorschemefunctions#SchemeVariant(delta)
    if g:colors_name =~ "typewriter"
        let l:schemes = map(['', '-night'], '"typewriter".v:val')
        exe 'colors' l:schemes[((a:delta+index(l:schemes, g:colors_name)) % 2 + 2) % 2]
    elseif g:colors_name =~ "corvine"
        let l:schemes = map(['', '_light'], '"corvine".v:val')
        exe 'colors' l:schemes[((a:delta+index(l:schemes, g:colors_name)) % 2 + 2) % 2]
    elseif g:colors_name =~ "Base2Tone_Cave"
        let l:schemes = map(['Dark', 'Light'], '"Base2Tone_Cave".v:val')
        exe 'colors' l:schemes[((a:delta+index(l:schemes, g:colors_name)) % 2 + 2) % 2]
    elseif g:colors_name =~ "Base2Tone_Desert"
        let l:schemes = map(['Dark', 'Light'], '"Base2Tone_Desert".v:val')
        exe 'colors' l:schemes[((a:delta+index(l:schemes, g:colors_name)) % 2 + 2) % 2]
    elseif g:colors_name =~ "Base2Tone_Drawbridge"
        let l:schemes = map(['Dark', 'Light'], '"Base2Tone_Drawbridge".v:val')
        exe 'colors' l:schemes[((a:delta+index(l:schemes, g:colors_name)) % 2 + 2) % 2]
    elseif g:colors_name =~ "Base2Tone_Earth"
        let l:schemes = map(['Dark', 'Light'], '"Base2Tone_Earth".v:val')
        exe 'colors' l:schemes[((a:delta+index(l:schemes, g:colors_name)) % 2 + 2) % 2]
    elseif g:colors_name =~ "Base2Tone_Evening"
        let l:schemes = map(['Dark', 'Light'], '"Base2Tone_Evening".v:val')
        exe 'colors' l:schemes[((a:delta+index(l:schemes, g:colors_name)) % 2 + 2) % 2]
    elseif g:colors_name =~ "Base2Tone_Forest"
        let l:schemes = map(['Dark', 'Light'], '"Base2Tone_Forest".v:val')
        exe 'colors' l:schemes[((a:delta+index(l:schemes, g:colors_name)) % 2 + 2) % 2]
    elseif g:colors_name =~ "Base2Tone_Heath"
        let l:schemes = map(['Dark', 'Light'], '"Base2Tone_Heath".v:val')
        exe 'colors' l:schemes[((a:delta+index(l:schemes, g:colors_name)) % 2 + 2) % 2]
    elseif g:colors_name =~ "Base2Tone_Lake"
        let l:schemes = map(['Dark', 'Light'], '"Base2Tone_Lake".v:val')
        exe 'colors' l:schemes[((a:delta+index(l:schemes, g:colors_name)) % 2 + 2) % 2]
    elseif g:colors_name =~ "Base2Tone_Meadow"
        let l:schemes = map(['Dark', 'Light'], '"Base2Tone_Meadow".v:val')
        exe 'colors' l:schemes[((a:delta+index(l:schemes, g:colors_name)) % 2 + 2) % 2]
    elseif g:colors_name =~ "Base2Tone_Morning"
        let l:schemes = map(['Dark', 'Light'], '"Base2Tone_Morning".v:val')
        exe 'colors' l:schemes[((a:delta+index(l:schemes, g:colors_name)) % 2 + 2) % 2]
    elseif g:colors_name =~ "Base2Tone_Pool"
        let l:schemes = map(['Dark', 'Light'], '"Base2Tone_Pool".v:val')
        exe 'colors' l:schemes[((a:delta+index(l:schemes, g:colors_name)) % 2 + 2) % 2]
    elseif g:colors_name =~ "Base2Tone_Sea"
        let l:schemes = map(['Dark', 'Light'], '"Base2Tone_Sea".v:val')
        exe 'colors' l:schemes[((a:delta+index(l:schemes, g:colors_name)) % 2 + 2) % 2]
    elseif g:colors_name =~ "Base2Tone_Space"
        let l:schemes = map(['Dark', 'Light'], '"Base2Tone_Space".v:val')
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
    elseif g:colors_name =~ "solarized8"
        let l:schemes = map (['', '_low', '_flat', '_high'], '"solarized8".v:val')
        if &background == "light"
            if a:delta+index(l:schemes, g:colors_name) >= 4 || a:delta+index(l:schemes, g:colors_name) < 0
               let &background = "dark"
            endif
        else
            if a:delta+index(l:schemes, g:colors_name) >= 4 || a:delta+index(l:schemes, g:colors_name) < 0
               let &background = "light"
            endif
        endif
        exe 'colors' l:schemes[((a:delta+index(l:schemes, g:colors_name)) % 4 + 4) % 4]
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
    elseif g:colors_name =~ "Base2Tone"
        exec "AirlineTheme " . g:colors_name
    elseif g:colors_name =~ "solarized8"
        exec "Airlinetheme solarized"
    elseif !myfunctions#ColorschemeHasAirlineTheme(g:colors_name)
        exec "AirlineTheme dark"
    endif
endfunction
