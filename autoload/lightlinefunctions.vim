function! lightlinefunctions#LightlineReadonly()
   return &ft !~? 'help\|vimfiler\|gundo' && &readonly && !has('win64') && !has('win32') ? '' : ''
endfunction

function! lightlinefunctions#LightlineFugitive()
   try
      if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*fugitive#head')
         let mark = ''
         let branch = fugitive#head()
         return branch !=# '' ? mark.branch : ''
      endif
      " if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head') && winwidth(0) > 55
      "    let branch = fugitive#head()
      "    return branch !=# '' ? ''.branch : ''
      " endif
   catch
   endtry
   return ''
endfunction

function! lightlinefunctions#LightlineGitgutter()
   let s:summary = [0, 0, 0]
   if exists('b:gitgutter.summary')
      let s:summary = b:gitgutter.summary
   endif
   return max(s:summary) > 0 ? ' +'.s:summary[0].' ~'.s:summary[1].' -'.s:summary[2].' ' : ''
endfunction

function! lightlinefunctions#LightlineWinform()
   return winwidth(0) > 50 ? 'w' . winwidth(0) . ':' . winheight(0) : ''
endfunction

function! lightlinefunctions#LightlineModified()
   return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! lightlinefunctions#LightlineFilename()
   let fname = expand('%:t')
   return fname == 'ControlP' && has_key(g:lightline, 'ctrlp_item') ? g:lightline.ctrlp_item :
      \ fname == '__Tagbar__' ? g:lightline.fname :
      \ fname =~ '__Gundo\|NERD_tree' ? '' :
      \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
      \ &ft == 'unite' ? unite#get_status_string() :
      \ &ft == 'vimshell' ? vimshell#get_status_string() :
      \ ('' != lightlinefunctions#LightlineReadonly() ? lightlinefunctions#LightlineReadonly() . ' ' : '') .
      \ ('' != fname ? fname : '[No Name]') .
      \ ('' != lightlinefunctions#LightlineModified() ? ' ' . lightlinefunctions#LightlineModified() : '')
endfunction

function! lightlinefunctions#LightlineFileformat()
   return winwidth(0) > 80 ? &fileformat : ''
endfunction

function! lightlinefunctions#LightlineColorscheme()
   let s:color = myfunctions#CurrentColorscheme()
   return winwidth(0) > 80 ? s:color : ''
endfunction

function! lightlinefunctions#LightlineFiletype()
   return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! lightlinefunctions#LightlineFileencoding()
   return winwidth(0) > 60 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! lightlinefunctions#LightlineMode()
   let fname = expand('%:t')
   return fname == '__Tagbar__' ? 'Tagbar' :
      \ fname == 'ControlP' ? 'CtrlP' :
      \ fname == '__Gundo__' ? 'Gundo' :
      \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
      \ fname =~ 'NERD_tree' ? 'NERDTree' :
      \ &ft == 'unite' ? 'Unite' :
      \ &ft == 'vimfiler' ? 'VimFiler' :
      \ &ft == 'vimshell' ? 'VimShell' :
      \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

let g:tagbar_status_func = 'TagbarStatusFunc'

function! lightlinefunctions#TagbarStatusFunc(current, sort, fname, ...) abort
   let g:lightline.fname = a:fname
   return lightline#statusline(0)
endfunction

function! lightlinefunctions#LightlineFilepath()
   return winwidth(0) <= 120 ? expand('%:h') : ''
endfunction

function! lightlinefunctions#LightlineUpdate()
   if !exists('g:loaded_lightline')
      return
   endif
   try
      for color in g:colorscheme_map
         if has_key (color, 'name') && g:colors_name =~ color.name
            if has_key (color, 'lightlinetheme')
               if color.lightlinetheme == 'colorscheme'
                  let g:lightline.colorscheme = tr(g:colors_name, '-', '_')
               elseif color.lightlinetheme == 'colorscheme_bg'
                  let g:lightline.colorscheme = join(tr(g:colors_name, '-', '_'), &background)
               elseif color.lightlinetheme == 'dropbg'
                  if match(g:colors_name, "Dark") != -1
                     let s:lightline_names = split (g:colors_name, "Dark")
                     let g:lightline.colorscheme = s:lightline_names[0]
                  elseif match(g:colors_name, "Light") != -1
                     let s:lightline_names = split (g:colors_name, "Light")
                     let g:lightline.colorscheme = s:lightline_names[0]
                  endif
               elseif color.lightlinetheme == 'substitutebg'
                  let g:lightline.colorscheme = substitute (g:colors_name, color.subpat, &background, "")
               else
                  let g:lightline.colorscheme = color.lightlinetheme
               endif
            else
               let g:lightline.colorscheme = 'powerline'
            endif
            if has_key(color, 'runtime') && color.runtime == 'true'
               exe 'runtime autoload/lightline/colorscheme/' . g:lightline.colorscheme . '.vim'
            endif
         endif
      endfor
      call lightline#init()
      call lightline#colorscheme()
      call lightline#update()
   endtry
endfunction

function! lightlinefunctions#SetLightlineColorscheme(name) abort
   let g:lightline.colorscheme = a:name
   call lightline#init()
   call lightline#colorscheme()
   call lightline#update()
endfunction

function! lightlinefunctions#LightlineColorschemes(...) abort
   return join(map(
         \ globpath(&rtp,"autoload/lightline/colorscheme/*.vim",1,1),
         \ "fnamemodify(v:val,':t:r')"),
         \ "\n")
endfunction

function! lightlinefunctions#PomodoroStatus() abort
   if pomo#remaining_time() ==# '0'
      return "\ue001"
   else
      return "\ue003 ".pomo#remaining_time()"
   endif
endfunction
