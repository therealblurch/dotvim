function! colorschemefunctions#SchemeVariant(delta)
    if g:colors_name == "ayu"
        let l:schemes = ['light', 'dark', 'mirage']
        let g:ayucolor = l:schemes[((a:delta+index(l:schemes, g:ayucolor)) % 3 + 3) % 3]
        let ayucolor = g:ayucolor
        exe 'colors ayu'
    endif
endfunction
