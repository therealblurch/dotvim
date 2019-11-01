function! myfunctions#GitgutterStatus()
   let s:summary = [0, 0, 0]
   if exists('b:gitgutter.summary')
      let s:summary = b:gitgutter.summary
   endif
   return max(s:summary) > 0 ? ' +'.s:summary[0].' ~'.s:summary[1].' -'.s:summary[2].' ' : ''
endfunction

function! myfunctions#CurrentColorscheme()
   if g:colors_name == "ayu"
      let s:color = g:colors_name . '/' . g:ayucolor
   else
      let s:color = g:colors_name
   endif
   return s:color
endfunction
