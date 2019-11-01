function! colorschemefunctions#SchemeVariant(delta)
    if g:colors_name =~ "typewriter"
        let l:schemes = map(['', '-night'], '"typewriter".v:val')
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
                \ || g:colors_name == "space_vim_theme"
                \ || g:colors_name == "vadelma"
        let l:schemes = ['dark', 'light']
        let &background = l:schemes[((a:delta+index(l:schemes, &background)) %2 + 2) % 2]
    elseif g:colors_name == "gruvbox-material"
        let l:schemes = ['soft', 'medium', 'hard']
        if a:delta+index(l:schemes, g:gruvbox_material_background) >= 3 || a:delta+index(l:schemes, g:gruvbox_material_background) < 0
           let &background = (&background == "dark") ? "light" : "dark"
        endif
        let g:gruvbox_material_background = l:schemes[((a:delta+index(l:schemes, g:gruvbox_material_background)) % 3 + 3) % 3]
        exe 'colors gruvbox-material'
    elseif g:colors_name =~ "onehalf"
        let l:schemes = map(['light', 'dark'], '"onehalf".v:val')
        exe 'colors' l:schemes[((a:delta+index(l:schemes, g:colors_name)) % 2 + 2) %2]
    endif
endfunction

function! colorschemefunctions#AirlineTheme(colorscheme)
    if a:colorscheme == "cosmic_latte"
                \ || a:colorscheme == "snow"
        exec "AirlineTheme " . a:colorscheme . "_" . &background
    endif
endfunction
