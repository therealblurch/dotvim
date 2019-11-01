function! colorschemefunctions#SchemeVariant(delta)
    if g:colors_name == "ayu"
        let l:schemes = ['light', 'dark', 'mirage']
        let g:ayucolor = l:schemes[((a:delta+index(l:schemes, g:ayucolor)) % 3 + 3) % 3]
        let ayucolor = g:ayucolor
        exe 'colors ayu'
    elseif g:colors_name =~ "onehalf"
        let l:schemes = map(['light', 'dark'], '"onehalf".v:val')
        exe 'colors' l:schemes[((a:delta+index(l:schemes, g:colors_name)) % 2 + 2) %2]
    endif
endfunction
