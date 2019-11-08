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
      if g:colors_name == "nord"
               \ || g:colors_name == "one"
               \ || g:colors_name == "dracula"
               \ || g:colors_name == "jellybeans"
               \ || g:colors_name == "apprentice"
               \ || g:colors_name == "tender"
               \ || g:colors_name == "srcery"
               \ || g:colors_name == "iceberg"
               \ || g:colors_name == "snazzy"
               \ || g:colors_name == "candid"
               \ || g:colors_name == "plastic"
               \ || g:colors_name == "darcula"
               \ || g:colors_name == "sacredforest"
               \ || g:colors_name == "atlantis"
               \ || g:colors_name == "sialoquent"
               \ || g:colors_name == "dark_purple"
               \ || g:colors_name =~ "flattened"
         let g:lightline.colorscheme = g:colors_name
      elseif g:colors_name =~ "base16"
               \ || g:colors_name == "desert-night"
               \ || g:colors_name == "forest-night"
         let g:lightline.colorscheme = tr(g:colors_name, '-', '_')
      elseif g:colors_name == "quantum"
         let g:lightline.colorscheme = "quantum"
         runtime autoload/lightline/colorscheme/quantum.vim
      elseif g:colors_name == "edge"
         let g:lightline.colorscheme = "edge"
         runtime autoload/lightline/colorscheme/edge.vim
      elseif g:colors_name =~ "solarized8"
         let g:lightline.colorscheme = "solarized"
         runtime autoload/lightline/colorscheme/solarized.vim
      elseif g:colors_name == "vadelma"
         let g:lightline.colorscheme = "vadelma"
         runtime autoload/lightline/colorscheme/vadelma.vim
      elseif g:colors_name == "ayu"
         let g:lightline.colorscheme = "ayu"
         runtime autoload/lightline/colorscheme/ayu.vim
      elseif g:colors_name =~ "PaperColor"
         let g:lightline.colorscheme = "PaperColor"
         runtime autoload/lightline/colorscheme/PaperColor.vim
      elseif g:colors_name == "darcula"
         let g:lightline.colorscheme = "darculaOriginal"
      elseif g:colors_name == 'typewriter'
         let g:lightline.colorscheme = "typewriter_light"
      elseif g:colors_name == 'typewriter-night'
         let g:lightline.colorscheme = "typewriter_dark"
      elseif g:colors_name == 'stellarized'
         let g:lightline.colorscheme = join ([g:colors_name,&background],"_")
      elseif g:colors_name == 'snow'
         let g:lightline.colorscheme = join ([g:colors_name,&background],"_")
      elseif g:colors_name == 'material'
         let g:lightline.colorscheme = 'material_vim'
         runtime autoload/lightline/colorscheme/material_vim.vim
      elseif g:colors_name == 'gruvbox-material'
         let g:lightline.colorscheme = 'gruvbox_material'
         runtime autoload/lightline/colorscheme/gruvbox_material.vim
      elseif g:colors_name == 'pencil'
         let g:lightline.colorscheme = 'pencil_alter'
      elseif g:colors_name == 'night-owl'
         let g:lightline.colorscheme = 'nightowl'
      elseif g:colors_name =~ 'Base2Tone_Cave'
         let g:lightline.colorscheme = 'Base2Tone_Cave'
         runtime autoload/lightline/colorscheme/Base2Tone_Cave.vim
      elseif g:colors_name =~ 'Base2Tone_Desert'
         let g:lightline.colorscheme = 'Base2Tone_Desert'
         runtime autoload/lightline/colorscheme/Base2Tone_Desert.vim
      elseif g:colors_name =~ 'Base2Tone_Drawbridge'
         let g:lightline.colorscheme = 'Base2Tone_Drawbridge'
         runtime autoload/lightline/colorscheme/Base2Tone_Drawbridge.vim
      elseif g:colors_name =~ 'Base2Tone_Earth'
         let g:lightline.colorscheme = 'Base2Tone_Earth'
         runtime autoload/lightline/colorscheme/Base2Tone_Earth.vim
      elseif g:colors_name =~ 'Base2Tone_Evening'
         let g:lightline.colorscheme = 'Base2Tone_Evening'
         runtime autoload/lightline/colorscheme/Base2Tone_Evening.vim
      elseif g:colors_name =~ 'Base2Tone_Forest'
         let g:lightline.colorscheme = 'Base2Tone_Forest'
         runtime autoload/lightline/colorscheme/Base2Tone_Forest.vim
      elseif g:colors_name =~ 'Base2Tone_Heath'
         let g:lightline.colorscheme = 'Base2Tone_Heath'
         runtime autoload/lightline/colorscheme/Base2Tone_Heath.vim
      elseif g:colors_name =~ 'Base2Tone_Lake'
         let g:lightline.colorscheme = 'Base2Tone_Lake'
         runtime autoload/lightline/colorscheme/Base2Tone_Lake.vim
      elseif g:colors_name =~ 'Base2Tone_Meadow'
         let g:lightline.colorscheme = 'Base2Tone_Meadow'
         runtime autoload/lightline/colorscheme/Base2Tone_Meadow.vim
      elseif g:colors_name =~ 'Base2Tone_Morning'
         let g:lightline.colorscheme = 'Base2Tone_Morning'
         runtime autoload/lightline/colorscheme/Base2Tone_Morning.vim
      elseif g:colors_name =~ 'Base2Tone_Pool'
         let g:lightline.colorscheme = 'Base2Tone_Pool'
         runtime autoload/lightline/colorscheme/Base2Tone_Pool.vim
      elseif g:colors_name =~ 'Base2Tone_Sea'
         let g:lightline.colorscheme = 'Base2Tone_Sea'
         runtime autoload/lightline/colorscheme/Base2Tone_Sea.vim
      elseif g:colors_name =~ 'Base2Tone_Space'
         let g:lightline.colorscheme = 'Base2Tone_Space'
         runtime autoload/lightline/colorscheme/Base2Tone_Space.vim
      elseif g:colors_name == 'cosmic_latte'
         let g:lightline.colorscheme = join ([g:colors_name,&background],"_")
      elseif g:colors_name =~# 'deep-space'
         let g:lightline.colorscheme = 'deepspace'
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

function! lightlinefunctions#PomodoroStatus() abort
   if pomo#remaining_time() ==# '0'
      return "\ue001"
   else
      return "\ue003 ".pomo#remaining_time()"
   endif
endfunction
