let g:packadd_cb = 'myplugins#callback'
let g:autopac_options = {'package': 'general'}
let g:vimball = expand('~/vimfiles/pack/unmanaged/opt/')

augroup myplugins | au! | augroup END

Plugin 'ap/vim-buftabline'
Plugin 'brooth/far.vim'
Plugin 'airblade/vim-gitgutter',                {'type': 'start'}
Plugin 'chrisbra/NrrwRgn'
Plugin 'drmikehenry/vim-fontsize'
Plugin 'idanarye/vim-merginal'
Plugin 'nishigori/increment-activator'
Plugin 'garbas/vim-snipmate',                   {'type': 'start'}
Plugin 'honza/vim-snippets',                    {'type': 'start'}
Plugin 'itchyny/lightline.vim'
Plugin 'jiangmiao/auto-pairs',                  {'type': 'start'}
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/vim-easy-align'
Plugin 'junegunn/vim-peekaboo',                 {'type': 'start'}
Plugin 'kshenoy/vim-signature',                 {'type': 'start'}
Plugin 'lifepillar/vim-mucomplete',             {'type': 'start'}
Plugin 'liuchengxu/vim-which-key',              {'type': 'start'}
Plugin 'luochen1990/rainbow',                   {'type': 'start'}
Plugin 'machakann/vim-highlightedyank',         {'type': 'start'}
Plugin 'MarcWeber/vim-addon-mw-utils',          {'type': 'start'}
Plugin 'markonm/traces.vim',                    {'type': 'start'}
Plugin 'myusuf3/numbers.vim',                   {'type': 'start'}
Plugin 'osyo-manga/vim-anzu',                   {'type': 'start'}
Plugin 'pelodelfuego/vim-swoop'
Plugin 'rbong/vim-flog'
Plugin 'rhysd/committia.vim',                   {'type': 'start'}
Plugin 'rhysd/conflict-marker.vim'
Plugin 'rhysd/git-messenger.vim'
Plugin 'rmolin88/pomodoro.vim'
Plugin 'ryanoasis/vim-devicons',                {'type': 'start'}
Plugin 'sainnhe/lightline_foobar.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'taohexxx/lightline-buffer'
Plugin 'tommcdo/vim-lion'
Plugin 'tomtom/tcomment_vim'
Plugin 'tomtom/tlib_vim',                       {'type': 'start'}
Plugin 'tpope/vim-dispatch',                    {'type': 'start'}
Plugin 'tpope/vim-endwise',                     {'type': 'start'}
Plugin 'tpope/vim-fugitive',                    {'type': 'start'}
Plugin 'tpope/vim-obsession'
Plugin 'tpope/vim-sensible',                    {'type': 'start'}
Plugin 'tpope/vim-sleuth',                      {'type': 'start'}
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tyru/capture.vim'
Plugin 'unblevable/quick-scope',                {'type': 'start'}
Plugin 'vhda/verilog_systemverilog.vim',        {'type': 'start'}
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-scripts/VisIncr'
Plugin 'wellle/visual-split.vim'
Plugin 'xolox/vim-misc',                        {'type': 'start'}
Plugin 'xolox/vim-colorscheme-switcher',        {'type': 'start'}
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'Yggdroot/indentline',                   {'type': 'start'}
Plugin 'zhuzhzh/verilog_emacsauto.vim'

Plugin 'adriaanzon/vim-textobj-matchit',        {'type': 'start'}
Plugin 'deathlyfrantic/vim-textobj-blanklines', {'type': 'start'}
Plugin 'fvictorio/vim-textobj-backticks',       {'type': 'start'}
Plugin 'gilligan/textobj-gitgutter',            {'type': 'start'}
Plugin 'glts/vim-textobj-comment',              {'type': 'start'}
Plugin 'glts/vim-textobj-indblock',             {'type': 'start'}
Plugin 'Julian/vim-textobj-brace',              {'type': 'start'}
Plugin 'kana/vim-textobj-datetime',             {'type': 'start'}
Plugin 'kana/vim-textobj-diff',                 {'type': 'start'}
Plugin 'kana/vim-textobj-entire',               {'type': 'start'}
Plugin 'kana/vim-textobj-fold',                 {'type': 'start'}
Plugin 'kana/vim-textobj-function',             {'type': 'start'}
Plugin 'kana/vim-textobj-indent',               {'type': 'start'}
Plugin 'kana/vim-textobj-user',                 {'type': 'start'}
Plugin 'paulhybryant/vim-textobj-path',         {'type': 'start'}
Plugin 'rhysd/vim-textobj-continuous-line',     {'type': 'start'}
Plugin 'saaguero/vim-textobj-pastedtext',       {'type': 'start'}
Plugin 'sgur/vim-textobj-parameter',            {'type': 'start'}
Plugin 'thinca/vim-textobj-between',            {'type': 'start'}
Plugin 'vimtaku/vim-textobj-keyvalue',          {'type': 'start'}

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
Plugin 'habamax/vim-colors-defminus',            {'package': 'colors', 'type': 'start'}
Plugin 'habamax/vim-colors-defnoche',            {'package': 'colors', 'type': 'start'}
Plugin 'habamax/vim-colors-lessthan',            {'package': 'colors', 'type': 'start'}
Plugin 'hachy/eva01.vim',                        {'package': 'colors', 'type': 'start'}
Plugin 'haishanh/night-owl.vim',                 {'package': 'colors', 'type': 'start'}
Plugin 'HenryNewcomer/vim-theme-papaya',         {'package': 'colors', 'type': 'start'}
Plugin 'gosukiwi/vim-atom-dark',                 {'package': 'colors', 'type': 'start'}
Plugin 'jacoborus/tender.vim',                   {'package': 'colors', 'type': 'start'}
Plugin 'jdsimcoe/panic.vim',                     {'package': 'colors', 'type': 'start'}
Plugin 'jnurmine/Zenburn',                       {'package': 'colors', 'type': 'start'}
Plugin 'kaicataldo/material.vim',                {'package': 'colors', 'type': 'start', 'name': 'material'}
Plugin 'KKPMW/oldbook-vim',                      {'package': 'colors', 'type': 'start'}
Plugin 'KKPMW/sacredforest-vim',                 {'package': 'colors', 'type': 'start'}
Plugin 'kjssad/quantum.vim',                     {'package': 'colors', 'type': 'start'}
Plugin 'koirand/tokyo-metro.vim',                {'package': 'colors', 'type': 'start'}
Plugin 'kristijanhusak/vim-hybrid-material',     {'package': 'colors', 'type': 'start'}
Plugin 'letorbi/vim-colors-modern-borland',      {'package': 'colors', 'type': 'start'}
Plugin 'levelone/tequila-sunrise.vim',           {'package': 'colors', 'type': 'start'}
Plugin 'lifepillar/vim-solarized8',              {'package': 'colors', 'type': 'start'}
Plugin 'liuchengxu/space-vim-theme',             {'package': 'colors', 'type': 'start'}
Plugin 'logico-dev/typewriter',                  {'package': 'colors', 'type': 'start'}
Plugin 'ludokng/vim-odyssey',                    {'package': 'colors', 'type': 'start'}
Plugin 'mkarmona/materialbox',                   {'package': 'colors', 'type': 'start'}
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
Plugin 'relastle/bluewery.vim',                  {'package': 'colors', 'type': 'start'}
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
Plugin 'Siphalor/vim-atomified',                 {'package': 'colors', 'type': 'start'}
Plugin 'sliminality/wild-cherry-vim',            {'package': 'colors', 'type': 'start'}
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

function! myplugins#callback(plugname, before)

   if !a:before
      if a:plugname == "vim-airline"
         let g:airline_section_x = airline#section#create_right(['%-20{myfunctions#CurrentColorscheme()}', 'bookmark', 'tagbar', 'vista', 'gutentags', 'grepper', 'filetype'])
         let g:airline_section_c = airline#section#create(['%<', 'file', g:airline_symbols.space, 'readonly', '%{myfunctions#MU()}'])
      endif
   endif

   if a:plugname == "vim-airline"
      PackAdd! vim-airline-themes
   elseif a:plugname == "lightline.vim"
      PackAdd! lightline-buffer
      PackAdd! lightline_foobar.vim
      PackAdd! pomodoro.vim
   elseif a:plugname == "nerdtree"
      PackAdd! nerdtree-git-plugin
   endif

endfunction
