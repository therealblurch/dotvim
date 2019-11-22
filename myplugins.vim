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
Plugin 'jiangmiao/auto-pairs'
Plugin 'joereynolds/vim-minisnip'
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/vim-easy-align'
Plugin 'kshenoy/vim-signature'
Plugin 'lifepillar/vim-mucomplete'
Plugin 'luochen1990/rainbow'
Plugin 'machakann/vim-highlightedyank'
Plugin 'markonm/traces.vim'
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
Plugin 'vhda/verilog_systemverilog.vim', {'type': 'start'}
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-scripts/VisIncr'
Plugin 'wellle/visual-split.vim'
Plugin 'xolox/vim-misc', {'type': 'start'}
Plugin 'xolox/vim-colorscheme-switcher', {'type': 'start'}
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

Plugin 'alexanderjeurissen/lumiere.vim',         {'package': 'colors', 'type': 'start'}
Plugin 'Alvarocz/vim-northpole',                 {'package': 'colors', 'type': 'start'}
Plugin 'archseer/colibri.vim',                   {'package': 'colors', 'type': 'start'}
Plugin 'arcticicestudio/nord-vim',               {'package': 'colors', 'type': 'start', 'branch': 'develop'}
Plugin 'arzyu/vim-colors-celadonite',            {'package': 'colors', 'type': 'start'}
Plugin 'adlawson/vim-sorcerer',                  {'package': 'colors', 'type': 'start'}
Plugin 'agreco/vim-citylights',                  {'package': 'colors', 'type': 'start'}
Plugin 'agude/vim-eldar',                        {'package': 'colors', 'type': 'start'}
Plugin 'ajmwagar/vim-deus',                      {'package': 'colors', 'type': 'start'}
Plugin 'aonemd/kuroi.vim',                       {'package': 'colors', 'type': 'start'}
Plugin 'arzg/vim-corvine',                       {'package': 'colors', 'type': 'start'}
Plugin 'arzg/vim-substrata',                     {'package': 'colors', 'type': 'start'}
Plugin 'atelierbram/vim-colors_atelier-schemes', {'package': 'colors', 'type': 'start'}
Plugin 'axvr/photon.vim',                        {'package': 'colors', 'type': 'start'}
Plugin 'ayu-theme/ayu-vim',                      {'package': 'colors', 'type': 'start'}
Plugin 'beikome/cosme.vim',                      {'package': 'colors', 'type': 'start'}
Plugin 'chase/vim-airline-focuspoint',           {'package': 'colors', 'type': 'start'}
Plugin 'chase/focuspoint-vim',                   {'package': 'colors', 'type': 'start'}
Plugin 'chrisduerr/vim-undead',                  {'package': 'colors', 'type': 'start'}
Plugin 'cocopon/iceberg.vim',                    {'package': 'colors', 'type': 'start'}
Plugin 'connorholyday/vim-snazzy',               {'package': 'colors', 'type': 'start'}
Plugin 'croaker/mustang-vim',                    {'package': 'colors', 'type': 'start'}
Plugin 'cseelus/vim-colors-tone',                {'package': 'colors', 'type': 'start'}
Plugin 'danilo-augusto/vim-afterglow',           {'package': 'colors', 'type': 'start'}
Plugin 'davidklsn/vim-sialoquent',               {'package': 'colors', 'type': 'start'}
Plugin 'dgraham/xcode-low-key-vim',              {'package': 'colors', 'type': 'start'}
Plugin 'dikiaap/minimalist',                     {'package': 'colors', 'type': 'start'}
Plugin 'doums/darcula',                          {'package': 'colors', 'type': 'start'}
Plugin 'dracula/vim',                            {'package': 'colors', 'type': 'start', 'name': 'dracula'}
Plugin 'emhaye/ceudah.vim',                      {'package': 'colors', 'type': 'start'}
Plugin 'endel/vim-github-colorscheme',           {'package': 'colors', 'type': 'start'}
Plugin 'flrnd/candid.vim',                       {'package': 'colors', 'type': 'start'}
Plugin 'flrnd/plastic.vim',                      {'package': 'colors', 'type': 'start'}
Plugin 'hachy/eva01.vim',                        {'package': 'colors', 'type': 'start'}
Plugin 'haishanh/night-owl.vim',                 {'package': 'colors', 'type': 'start'}
Plugin 'HenryNewcomer/vim-theme-papaya',         {'package': 'colors', 'type': 'start'}
Plugin 'jacoborus/tender.vim',                   {'package': 'colors', 'type': 'start'}
Plugin 'jdsimcoe/panic.vim',                     {'package': 'colors', 'type': 'start'}
Plugin 'jnurmine/Zenburn',                       {'package': 'colors', 'type': 'start'}
Plugin 'kaicataldo/material.vim',                {'package': 'colors', 'type': 'start', 'name': 'material'}
Plugin 'KKPMW/oldbook-vim',                      {'package': 'colors', 'type': 'start'}
Plugin 'KKPMW/sacredforest-vim',                 {'package': 'colors', 'type': 'start'}
Plugin 'kjssad/quantum.vim',                     {'package': 'colors', 'type': 'start'}
Plugin 'koirand/tokyo-metro.vim',                {'package': 'colors', 'type': 'start'}
Plugin 'kristijanhusak/vim-hybrid-material',     {'package': 'colors', 'type': 'start'}
Plugin 'levelone/tequila-sunrise.vim',           {'package': 'colors', 'type': 'start'}
Plugin 'lifepillar/vim-solarized8',              {'package': 'colors', 'type': 'start'}
Plugin 'liuchengxu/space-vim-theme',             {'package': 'colors', 'type': 'start'}
Plugin 'logico-dev/typewriter',                  {'package': 'colors', 'type': 'start'}
Plugin 'ludokng/vim-odyssey',                    {'package': 'colors', 'type': 'start'}
Plugin 'mkarmona/materialbox',                   {'package': 'colors', 'type': 'start'}
Plugin 'mswift42/vim-themes',                    {'package': 'colors', 'type': 'start'}
Plugin 'nanotech/jellybeans.vim',                {'package': 'colors', 'type': 'start', 'name': 'jellybeans'}
Plugin 'neutaaaaan/iosvkem',                     {'package': 'colors', 'type': 'start'}
Plugin 'nightsense/cosmic_latte',                {'package': 'colors', 'type': 'start'}
Plugin 'nightsense/seabird',                     {'package': 'colors', 'type': 'start'}
Plugin 'nightsense/snow',                        {'package': 'colors', 'type': 'start'}
Plugin 'nightsense/stellarized',                 {'package': 'colors', 'type': 'start'}
Plugin 'nightsense/vimspectr',                   {'package': 'colors', 'type': 'start'}
Plugin 'NLKNguyen/papercolor-theme',             {'package': 'colors', 'type': 'start'}
Plugin 'ntk148v/vim-horizon',                    {'package': 'colors', 'type': 'start'}
Plugin 'rakr/vim-one',                           {'package': 'colors', 'type': 'start'}
Plugin 'reedes/vim-colors-pencil',               {'package': 'colors', 'type': 'start'}
Plugin 'rhysd/vim-color-spring-night',           {'package': 'colors', 'type': 'start'}
Plugin 'rhysd/wallaby.vim',                      {'package': 'colors', 'type': 'start'}
Plugin 'romainl/Apprentice',                     {'package': 'colors', 'type': 'start'}
Plugin 'romainl/flattened',                      {'package': 'colors', 'type': 'start'}
Plugin 'sainnhe/vim-color-atlantis',             {'package': 'colors', 'type': 'start'}
Plugin 'sainnhe/vim-color-desert-night',         {'package': 'colors', 'type': 'start'}
Plugin 'sainnhe/edge',                           {'package': 'colors', 'type': 'start'}
Plugin 'sainnhe/gruvbox-material',               {'package': 'colors', 'type': 'start'}
Plugin 'sainnhe/vim-color-forest-night',         {'package': 'colors', 'type': 'start'}
Plugin 'sansbrina/vim-garbage-oracle',           {'package': 'colors', 'type': 'start'}
Plugin 'severij/vadelma',                        {'package': 'colors', 'type': 'start'}
Plugin 'sfi0zy/atlantic-dark.vim',               {'package': 'colors', 'type': 'start'}
Plugin 'sickill/vim-monokai',                    {'package': 'colors', 'type': 'start'}
Plugin 'shapeoflambda/dark-purple.vim',          {'package': 'colors', 'type': 'start'}
Plugin 'srcery-colors/srcery-vim',               {'package': 'colors', 'type': 'start'}
Plugin 'tjammer/blayu.vim',                      {'package': 'colors', 'type': 'start'}
Plugin 'tomasr/molokai',                         {'package': 'colors', 'type': 'start'}
Plugin 'toupeira/vim-desertink',                 {'package': 'colors', 'type': 'start'}
Plugin 'tpope/vim-vividchalk',                   {'package': 'colors', 'type': 'start'}
Plugin 'trevordmiller/nova-vim',                 {'package': 'colors', 'type': 'start'}
Plugin 'tyrannicaltoucan/vim-deep-space',        {'package': 'colors', 'type': 'start'}
Plugin 'victorze/foo',                           {'package': 'colors', 'type': 'start'}
Plugin 'vim-scripts/vibrantink',                 {'package': 'colors', 'type': 'start'}
Plugin 'w0ng/vim-hybrid',                        {'package': 'colors', 'type': 'start'}
Plugin 'wdhg/dragon-energy',                     {'package': 'colors', 'type': 'start'}
Plugin 'wmvanvliet/vim-blackboard',              {'package': 'colors', 'type': 'start'}
Plugin 'xero/sourcerer.vim',                     {'package': 'colors', 'type': 'start'}
Plugin 'yous/vim-open-color',                    {'package': 'colors', 'type': 'start'}

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
PackAdd! auto-pairs
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
