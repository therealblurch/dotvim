let g:packadd_cb = 'myplugins#callback'
let g:autopac_options = {'package': 'general'}
let g:vimball = expand('~/vimfiles/pack/unmanaged/opt/')

augroup myplugins | au! | augroup END

Plugin 'brooth/far.vim'
Plugin 'airblade/vim-gitgutter',                 {'type': 'start'}
Plugin 'chrisbra/NrrwRgn'
Plugin 'drmikehenry/vim-fontsize'
Plugin 'idanarye/vim-merginal',                  {'type': 'start'}
Plugin 'joereynolds/vim-minisnip'
Plugin 'kana/vim-smartinput',                    {'type': 'start'}
Plugin 'kshenoy/vim-signature',                  {'type': 'start'}
Plugin 'lifepillar/vim-mucomplete',              {'type': 'start'}
Plugin 'markonm/traces.vim',                     {'type': 'start'}
Plugin 'myusuf3/numbers.vim',                    {'type': 'start'}
Plugin 'rbong/vim-flog',                         {'type': 'start'}
Plugin 'rhysd/committia.vim',                    {'type': 'start'}
Plugin 'rhysd/conflict-marker.vim',              {'type': 'start'}
Plugin 'rhysd/git-messenger.vim',                {'type': 'start'}
Plugin 'ryanoasis/vim-devicons',                 {'type': 'start'}
Plugin 'tomtom/tcomment_vim'
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

Plugin 'adriaanzon/vim-textobj-matchit',         {'type': 'start'}
Plugin 'deathlyfrantic/vim-textobj-blanklines',  {'type': 'start'}
Plugin 'fvictorio/vim-textobj-backticks',        {'type': 'start'}
Plugin 'gilligan/textobj-gitgutter',             {'type': 'start'}
Plugin 'glts/vim-textobj-comment',               {'type': 'start'}
Plugin 'glts/vim-textobj-indblock',              {'type': 'start'}
Plugin 'Julian/vim-textobj-brace',               {'type': 'start'}
Plugin 'kana/vim-textobj-datetime',              {'type': 'start'}
Plugin 'kana/vim-textobj-diff',                  {'type': 'start'}
Plugin 'kana/vim-textobj-entire',                {'type': 'start'}
Plugin 'kana/vim-textobj-fold',                  {'type': 'start'}
Plugin 'kana/vim-textobj-function',              {'type': 'start'}
Plugin 'kana/vim-textobj-indent',                {'type': 'start'}
Plugin 'kana/vim-textobj-user',                  {'type': 'start'}
Plugin 'paulhybryant/vim-textobj-path',          {'type': 'start'}
Plugin 'rhysd/vim-textobj-continuous-line',      {'type': 'start'}
Plugin 'saaguero/vim-textobj-pastedtext',        {'type': 'start'}
Plugin 'sgur/vim-textobj-parameter',             {'type': 'start'}
Plugin 'thinca/vim-textobj-between',             {'type': 'start'}
Plugin 'vimtaku/vim-textobj-keyvalue',           {'type': 'start'}

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
