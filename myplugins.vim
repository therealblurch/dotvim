let g:packadd_cb = 'myplugins#callback'
let g:autopac_options = {'package': 'general'}
let g:vimball = expand('~/vimfiles/pack/unmanaged/opt/')

augroup myplugins | au! | augroup END

Plugin 'ap/vim-buftabline'
Plugin 'brooth/far.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'chrisbra/NrrwRgn'
Plugin 'drmikehenry/vim-fontsize'
Plugin 'idanarye/vim-merginal'
Plugin 'nishigori/increment-activator'
Plugin 'itchyny/lightline.vim'
Plugin 'joereynolds/vim-minisnip'
Plugin 'junegunn/vim-easy-align'
Plugin 'kana/vim-smartinput'
Plugin 'kshenoy/vim-signature'
Plugin 'lifepillar/vim-mucomplete'
Plugin 'luochen1990/rainbow'
Plugin 'machakann/vim-highlightedyank'
Plugin 'markonm/traces.vim'
Plugin 'mike-hearn/base16-vim-lightline'
Plugin 'myusuf3/numbers.vim'
Plugin 'rbong/vim-flog'
Plugin 'rhysd/committia.vim',                    {'type': 'start'}
Plugin 'rhysd/conflict-marker.vim'
Plugin 'rhysd/git-messenger.vim'
Plugin 'rmolin88/pomodoro.vim'
Plugin 'ryanoasis/vim-devicons'
Plugin 'sainnhe/lightline_foobar.vim'
Plugin 'taohexxx/lightline-buffer'
Plugin 'tommcdo/vim-lion'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-obsession'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tyru/capture.vim'
Plugin 'vhda/verilog_systemverilog.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-scripts/VisIncr'
Plugin 'wellle/visual-split.vim'
Plugin 'Yggdroot/indentline'
Plugin 'zhuzhzh/verilog_emacsauto.vim'

Plugin 'adriaanzon/vim-textobj-matchit'
Plugin 'deathlyfrantic/vim-textobj-blanklines'
Plugin 'fvictorio/vim-textobj-backticks'
Plugin 'gilligan/textobj-gitgutter'
Plugin 'glts/vim-textobj-comment'
Plugin 'glts/vim-textobj-indblock'
Plugin 'Julian/vim-textobj-brace'
Plugin 'kana/vim-textobj-datetime'
Plugin 'kana/vim-textobj-diff'
Plugin 'kana/vim-textobj-entire'
Plugin 'kana/vim-textobj-fold'
Plugin 'kana/vim-textobj-function'
Plugin 'kana/vim-textobj-indent'
Plugin 'kana/vim-textobj-user'
Plugin 'paulhybryant/vim-textobj-path'
Plugin 'rhysd/vim-textobj-continuous-line'
Plugin 'saaguero/vim-textobj-pastedtext'
Plugin 'sgur/vim-textobj-parameter'
Plugin 'thinca/vim-textobj-between'
Plugin 'vimtaku/vim-textobj-keyvalue'

Plugin 'arcticicestudio/nord-vim',               {'package': 'colors', 'branch': 'develop'}
Plugin 'adlawson/vim-sorcerer',                  {'package': 'colors'}
Plugin 'aonemd/kuroi.vim',                       {'package': 'colors'}
Plugin 'arzg/vim-corvine',                       {'package': 'colors'}
Plugin 'arzg/vim-substrata',                     {'package': 'colors'}
Plugin 'atelierbram/Base2Tone-vim',              {'package': 'colors'}
Plugin 'axvr/photon.vim',                        {'package': 'colors'}
Plugin 'ayu-theme/ayu-vim',                      {'package': 'colors'}
Plugin 'chase/vim-airline-focuspoint',           {'package': 'colors'}
Plugin 'chase/focuspoint-vim',                   {'package': 'colors'}
Plugin 'chrisduerr/vim-undead',                  {'package': 'colors'}
Plugin 'chriskempson/base16-vim',                {'package': 'colors'}
Plugin 'cocopon/iceberg.vim',                    {'package': 'colors'}
Plugin 'connorholyday/vim-snazzy',               {'package': 'colors'}
Plugin 'croaker/mustang-vim',                    {'package': 'colors'}
Plugin 'cseelus/vim-colors-tone',                {'package': 'colors'}
Plugin 'danilo-augusto/vim-afterglow',           {'package': 'colors'}
Plugin 'davidklsn/vim-sialoquent',               {'package': 'colors'}
Plugin 'dikiaap/minimalist',                     {'package': 'colors'}
Plugin 'doums/darcula',                          {'package': 'colors'}
Plugin 'dracula/vim',                            {'package': 'colors', 'type': 'start', 'name': 'dracula'}
Plugin 'endel/vim-github-colorscheme',           {'package': 'colors'}
Plugin 'flrnd/candid.vim',                       {'package': 'colors'}
Plugin 'flrnd/plastic.vim',                      {'package': 'colors'}
Plugin 'haishanh/night-owl.vim',                 {'package': 'colors'}
Plugin 'jacoborus/tender.vim',                   {'package': 'colors'}
Plugin 'jnurmine/Zenburn',                       {'package': 'colors'}
Plugin 'kaicataldo/material.vim',                {'package': 'colors', 'name': 'material'}
Plugin 'KKPMW/oldbook-vim',                      {'package': 'colors'}
Plugin 'KKPMW/sacredforest-vim',                 {'package': 'colors'}
Plugin 'kjssad/quantum.vim',                     {'package': 'colors'}
Plugin 'kristijanhusak/vim-hybrid-material',     {'package': 'colors'}
Plugin 'levelone/tequila-sunrise.vim',           {'package': 'colors'}
Plugin 'lifepillar/vim-solarized8',              {'package': 'colors'}
Plugin 'liuchengxu/space-vim-theme',             {'package': 'colors'}
Plugin 'logico-dev/typewriter',                  {'package': 'colors'}
Plugin 'ludokng/vim-odyssey',                    {'package': 'colors'}
Plugin 'mkarmona/materialbox',                   {'package': 'colors'}
Plugin 'nanotech/jellybeans.vim',                {'package': 'colors', 'name': 'jellybeans'}
Plugin 'nightsense/cosmic_latte',                {'package': 'colors'}
Plugin 'nightsense/seabird',                     {'package': 'colors'}
Plugin 'nightsense/snow',                        {'package': 'colors'}
Plugin 'nightsense/stellarized',                 {'package': 'colors'}
Plugin 'NLKNguyen/papercolor-theme',             {'package': 'colors'}
Plugin 'ntk148v/vim-horizon',                    {'package': 'colors'}
Plugin 'rakr/vim-one',                           {'package': 'colors'}
Plugin 'reedes/vim-colors-pencil',               {'package': 'colors'}
Plugin 'rhysd/vim-color-spring-night',           {'package': 'colors'}
Plugin 'rhysd/wallaby.vim',                      {'package': 'colors'}
Plugin 'romainl/Apprentice',                     {'package': 'colors'}
Plugin 'romainl/flattened',                      {'package': 'colors'}
Plugin 'sainnhe/vim-color-atlantis',             {'package': 'colors'}
Plugin 'sainnhe/vim-color-desert-night',         {'package': 'colors'}
Plugin 'sainnhe/edge',                           {'package': 'colors'}
Plugin 'sainnhe/gruvbox-material',               {'package': 'colors'}
Plugin 'sainnhe/vim-color-forest-night',         {'package': 'colors'}
Plugin 'sansbrina/vim-garbage-oracle',           {'package': 'colors'}
Plugin 'severij/vadelma',                        {'package': 'colors'}
Plugin 'sickill/vim-monokai',                    {'package': 'colors'}
Plugin 'shapeoflambda/dark-purple.vim',          {'package': 'colors'}
Plugin 'srcery-colors/srcery-vim',               {'package': 'colors'}
Plugin 'tomasr/molokai',                         {'package': 'colors'}
Plugin 'toupeira/vim-desertink',                 {'package': 'colors'}
Plugin 'tpope/vim-vividchalk',                   {'package': 'colors'}
Plugin 'tyrannicaltoucan/vim-deep-space',        {'package': 'colors'}
Plugin 'victorze/foo',                           {'package': 'colors'}
Plugin 'vim-scripts/vibrantink',                 {'package': 'colors'}
Plugin 'w0ng/vim-hybrid',                        {'package': 'colors'}
Plugin 'wdhg/dragon-energy',                     {'package': 'colors'}
Plugin 'wmvanvliet/vim-blackboard',              {'package': 'colors'}
Plugin 'xero/sourcerer.vim',                     {'package': 'colors'}

" This repositories contain a vim directory which is the only directory that I want
" in the pack.  Because of this they are git submodules and added to the runtimepath
" in vimrc.
" Plugin 'sonph/onehalf',                    {'package': 'colors', 'type': 'start'}

command! -nargs=1 -complete=custom,PackList
   \ PackOpenDir packadd autopac | runtime OPT autopac.vim | call term_start(&shell,
   \    {'cwd': autopac#impl#pluginfo(<q-args>).dir,
   \    'term_finish': 'close'})

command! -nargs=1 -complete=custom,PackList
   \ PackOpenUrl packadd autopac | runtime OPT autopac.vim | call openbrowser#open(
   \ autopac#impl#pluginfo(<q-args>).url)

PackAdd! vim-sensible
PackAdd! vim-sleuth
PackAdd! vim-mucomplete
PackAdd! vim-fugitive
PackAdd! vim-signature
PackAdd! vim-gitgutter
PackAdd! traces.vim
PackAdd! numbers.vim
PackAdd! indentline
PackAdd! vim-devicons
PackAdd! vim-highlightedyank
PackAdd! vim-smartinput
PackAdd! vim-endwise

function! myplugins#callback(plugname, before)

   if !a:before
      if a:plugname == "vim-airline"
         let g:airline_section_x = airline#section#create_right(['%-20{myfunctions#CurrentColorscheme()}', 'bookmark', 'tagbar', 'vista', 'gutentags', 'grepper', 'filetype'])
      endif
   endif

   if a:plugname == "vim-airline"
      PackAdd! vim-airline-themes
   elseif a:plugname == "lightline.vim"
      PackAdd! lightline-buffer
      PackAdd! lightline_foobar.vim
      PackAdd! base16-vim-lightline
      PackAdd! pomodoro.vim
   elseif a:plugname == "vim-textobj-matchit"
            \ || a:plugname == "vim-textobj-blanklines"
            \ || a:plugname == "vim-textobj-backticks"
            \ || a:plugname == "textobj-gitgutter"
            \ || a:plugname == "vim-textobj-comment"
            \ || a:plugname == "vim-textobj-indblock"
            \ || a:plugname == "vim-textobj-brace"
            \ || a:plugname == "vim-textobj-datetime"
            \ || a:plugname == "vim-textobj-diff"
            \ || a:plugname == "vim-textobj-entire"
            \ || a:plugname == "vim-textobj-fold"
            \ || a:plugname == "vim-textobj-function"
            \ || a:plugname == "vim-textobj-indent"
            \ || a:plugname == "vim-textobj-path"
            \ || a:plugname == "vim-textobj-continuous-line"
            \ || a:plugname == "vim-textobj-pastedtext"
            \ || a:plugname == "vim-textobj-parameter"
            \ || a:plugname == "vim-textobj-between"
            \ || a:plugname == "vim-textobj-keyvalue"
      PackAdd! vim-textobj-user
   endif

endfunction
