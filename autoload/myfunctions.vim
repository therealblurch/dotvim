function! myfunctions#GitgutterStatus()
  let l:summary = [0, 0, 0]
  if exists('b:gitgutter.summary')
    let l:summary = b:gitgutter.summary
  endif
  return max(l:summary) > 0 ? ' +'.l:summary[0].' ~'.l:summary[1].' -'.l:summary[2].' ' : ''
endfunction

function! myfunctions#WhichStatus(colorscheme)
  if has_key(g:current_color_dictionary, 'AirlineTheme')
    let l:airlinetheme = g:current_color_dictionary.AirlineTheme()
  else
    let l:airlinetheme = ''
  endif
  if has_key(g:current_color_dictionary, 'LightlineTheme')
    let l:lightlinetheme = g:current_color_dictionary.LightlineTheme()
  else
    let l:lightlinetheme = ''
  endif
  if (empty(l:airlinetheme) && empty(l:lightlinetheme))
    if (g:prefer_airline)
      let l:user_status = "airline"
    else
      let l:user_statue = "lightline"
    endif
  elseif exists('g:loaded_airline')
    let l:user_status = "airline"
  elseif exists('g:loaded_lightline')
    let l:user_status = "lightline"
  elseif g:prefer_airline && !empty(l:airlinetheme)
    let l:user_status = "airline"
  elseif !g:prefer_airline && !empty(l:lightlinetheme)
    let l:user_status = "lightline"
  elseif !empty(l:airlinetheme)
    let l:user_status = "airline"
  elseif !empty(l:lightlinetheme)
    let l:user_status = "lightline"
  endif
  return l:user_status
endfunction

function! myfunctions#ResCur()
  if line("'\"") <= line("$")
    silent! normal! g`"
    return 1
  endif
endfunction

function! myfunctions#MU()
  return get(g:mucomplete#msg#short_methods, get(g:, 'mucomplete_current_method', ''), '')
endfunction
