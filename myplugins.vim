let g:packadd_cb = 'myplugins#callback'
let g:autopac_options = {'package': 'general'}
let g:vimball = expand('~/vimfiles/pack/unmanaged/opt/')

augroup myplugins | au! | augroup END

Plugin 'tpope/vim-fugitive', {'type': 'start'}
Plugin 'tpope/vim-sensible', {'type': 'start'}
Plugin 'tpope/vim-surround', {'type': 'start'}

Plugin 'arcticicestudio/nord-vim', {'package': 'colors', 'type': 'start'}

function! myplugins#callback(plugname, before)

   if !a:before | return | endif

endfunction
