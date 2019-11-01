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
   if g:colors_name == "ayu"
      let s:color = g:colors_name . '/' . g:ayucolor
   elseif g:colors_name == "material"
      let s:color = g:colors_name . '/' . g:material_theme_style
   elseif g:colors_name == "snow"
            \ || g:colors_name == "vadelma"
            \ || g:colors_name == "space_vim_theme"
      let s:color = g:colors_name . '/' . &background
   else
      let s:color = g:colors_name
   endif
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
      if g:colors_name == "nord"
               \ || g:colors_name == "dracula"
               \ || g:colors_name == "apprentice"
               \ || g:colors_name == "tender"
               \ || g:colors_name == "iceberg"
               \ || g:colors_name == "snazzy"
         let g:lightline.colorscheme = g:colors_name
      elseif g:colors_name == "vadelma"
         if &background == "light"
            let g:lightline.colorscheme = "vadelma_light"
         else
            let g:lightline.colorscheme = "vadelma"
         endif
      elseif g:colors_name == "ayu"
         if g:ayucolor == 'light'
            let g:lightline.colorscheme = "ayu_light"
         elseif g:ayucolor == 'mirage'
            let g:lightline.colorscheme = "ayu_mirage"
         else
            let g:lightline.colorscheme = "ayu"
         endif
      elseif g:colors_name == 'typewriter'
         let g:lightline.colorscheme = "typewriter_light"
      elseif g:colors_name == 'typewriter-night'
         let g:lightline.colorscheme = "typewriter_dark"
      elseif g:colors_name == 'snow'
         let g:lightline.colorscheme = join ([g:colors_name,&background],"_")
      elseif g:colors_name == 'material'
         if g:material_theme_style == 'palenight'
            let g:lightline.colorscheme = 'material_vim_palenight'
         elseif g:material_theme_style == 'ocean'
            let g:lightline.colorscheme = 'material_vim_ocean'
         elseif g:material_theme_style == 'lighter'
            let g:lightline.colorscheme = 'material_vim_lighter'
         elseif g:material_theme_style == 'darker'
            let g:lightline.colorscheme = 'material_vim_darker'
         else
            let g:lightline.colorscheme = 'material_vim'
         endif
      elseif g:colors_name == 'night-owl'
         let g:lightline.colorscheme = 'nightowl'
      elseif g:colors_name =~ 'onehalf'
         let g:lightline.colorscheme = 'onehalfdark'
      elseif g:colors_name =~# 'space_vim_theme'
         if &bg =~# 'dark'
            let g:lightline.colorscheme = 'space_vim_dark'
         endif
         if &bg =~# 'light'
            let g:lightline.colorscheme = 'space_vim_light'
         endif
      else
         let g:lightline.colorscheme = 'powerline'
      endif
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

