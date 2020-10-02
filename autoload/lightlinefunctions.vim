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
  let l:summary = [0, 0, 0]
  if exists('b:gitgutter.summary')
    let l:summary = b:gitgutter.summary
  endif
  return max(l:summary) > 0 ? ' +'.l:summary[0].' ~'.l:summary[1].' -'.l:summary[2].' ' : ''
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
  let l:color = g:current_color_dictionary.status()
  return winwidth(0) > 80 ? l:color : ''
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

function! lightlinefunctions#LightlineColorschemes(...) abort
  return join(map(
    \ globpath(&rtp,"autoload/lightline/colorscheme/*.vim",1,1),
    \ "fnamemodify(v:val,':t:r')"),
    \ "\n")
endfunction
