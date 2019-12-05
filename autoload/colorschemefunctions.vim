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
        return map(l:variants, 'l:variant_base.v:val')
    elseif a:colordict.variant_type == 'colorscheme_bg'
        let l:variant_base = a:colordict.variant_base
        return map(l:variants, 'l:variant_base.v:val')
    elseif a:colordict.variant_type == 'vimspectr'
        return map(l:variants, function('s:VimspectrMap'))
    elseif a:colordict.variant_type == 'Atelier'
        return map(l:variants, function('s:AtelierMap'))
    else
        return a:colordict.variants
    endif
endfunction

function! s:GetCurrentColorschemeVariant (colordict)
    if a:colordict.variant_type == 'ayu_color'
        return g:ayucolor
    elseif a:colordict.variant_type == 'material_theme_style'
        return g:material_theme_style
    elseif a:colordict.variant_type == 'gruvbox_material_background'
        return g:gruvbox_material_background
    elseif a:colordict.variant_type == 'materialbox_contrast'
        if &background == 'light'
            return g:materialbox_contrast_light
        else
            return g:materialbox_contrast_dark
        endif
    else
        return g:colors_name
    endif
endfunction

function s:GetNextColorscheme (colordict, next_scheme)
    if a:colordict.variant_type == 'ayu_color'
        let g:ayucolor = a:next_scheme
        let ayucolor = g:ayucolor
        return 'ayu'
    elseif a:colordict.variant_type == 'material_theme_style'
        let g:material_theme_style = a:next_scheme
        return 'material'
    elseif a:colordict.variant_type == 'gruvbox_material_background'
        let g:gruvbox_material_background = a:next_scheme
        return 'gruvbox-material'
    elseif a:colordict.variant_type == 'materialbox_contrast'
        if &background == 'light'
            let g:materialbox_contrast_light = a:next_scheme
        else
            let g:materialbox_contrast_dark = a:next_scheme
        endif
        return 'materialbox'
    else
        return a:next_scheme
    endif
endfunction

function! s:PossiblyToggleBackground (delta, colordict, variants, current_variant)
    let l:num_variants = len(a:variants)
    if a:colordict.variant_type == 'colorscheme_bg' || a:colordict.variant_type == 'gruvbox_material_background' || a:colordict.variant_type == 'materialbox_contrast'
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
    let l:variant_type = myfunctions#GetColorAttribute(g:colors_name, 'variant_type')
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
    let l:color = myfunctions#GetColorDictionary(g:colors_name)
    let l:variant_type = myfunctions#GetColorAttribute(l:colors, 'variant_type')
    if l:variant_type == 'background'
        call s:ToggleBG()
    else
        
        let l:schemes = s:GetColorschemeVariantList (l:color)
        let l:current_scheme = s:GetCurrentColorschemeVariant (l:color)
        let l:next_scheme = s:GetNextScheme(a:delta, l:schemes, l:current_scheme)
        call xolox#colorscheme_switcher#switch_to(s:GetNextColorscheme(l:color, l:next_scheme))
        call s:PossiblyToggleBackground (a:delta, l:color, l:schemes, l:current_scheme)
    endif
endfunction

function! colorschemefunctions#AirlineTheme(colorscheme)
    let l:airlinetheme = myfunctions#GetColorAttribute(g:colors_name, 'airlinetheme')
    if empty(l:airlinetheme)
        exec "AirlineTheme solarized_flood"
    elseif l:airlinetheme == 'colorscheme_bg'
        exec "AirlineTheme " . a:colorscheme . "_" . &background
    endif
endfunction

function! s:SetLastBackground (color, background)
    let l:variant_type = myfunctions#GetColorAttribute(a:color, 'variant_type')
    if l:variant_type == 'background' || l:variant_type == 'gruvbox_material_background' || l:variant_type == 'materialbox_contrast' || l:variant_type == 'colorscheme_bg' || l:variant_type == 'Atelier'
        exec 'set background='.a:background
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
    call s:SetLastBackground (l:last_colorscheme[1],l:last_colorscheme[0])
    call xolox#colorscheme_switcher#switch_to(s:ChooseNextColorscheme(l:last_colorscheme[1]))
endfunction
