let g:packadd_cb = 'myplugins#callback'
let g:autopac_options = {'package': 'general'}
let g:vimball = expand('~/vimfiles/pack/unmanaged/opt/')

augroup myplugins | au! | augroup END

Plugin 'airblade/vim-gitgutter',                 {'type': 'start'}
Plugin 'kana/vim-smartinput',                    {'type': 'start'}
Plugin 'lifepillar/vim-mucomplete',              {'type': 'start'}
Plugin 'markonm/traces.vim',                     {'type': 'start'}
Plugin 'tpope/vim-endwise',                      {'type': 'start'}
Plugin 'tpope/vim-flagship',                     {'type': 'start'}
Plugin 'tpope/vim-fugitive',                     {'type': 'start'}
Plugin 'tpope/vim-obsession',                    {'type': 'start'}
Plugin 'tpope/vim-sensible',                     {'type': 'start'}
Plugin 'tpope/vim-surround',                     {'type': 'start'}
Plugin 'vhda/verilog_systemverilog.vim',         {'type': 'start'}
Plugin 'zhuzhzh/verilog_emacsauto.vim',          {'name': 'verilog_emacsauto'}
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'xolox/vim-colorscheme-switcher',         {'type': 'start'}
Plugin 'xolox/vim-misc',                         {'type': 'start'}

Plugin 'arcticicestudio/nord-vim',               {'package': 'colors', 'type': 'start', 'brach': 'develop'}

function! myplugins#callback(plugname, before)

   if !a:before
      if a:plugname == "vim-airline"
         let g:airline_section_x = airline#section#create_right(['%-20{myfunctions#CurrentColorscheme()}', 'bookmark', 'tagbar', 'vista', 'gutentags', 'grepper', 'filetype'])
      endif
   endif

   if a:plugname == "vim-airline"
      PackAdd vim-airline-themes
   endif

endfunction
