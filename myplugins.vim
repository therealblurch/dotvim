let g:packadd_cb = 'myplugins#callback'
let g:autopac_options = {'package': 'general'}
let g:vimball = expand('~/vimfiles/pack/unmanaged/opt/')

augroup myplugins | au! | augroup END

Plugin 'brooth/far.vim',                        {'type': 'start'}
Plugin 'airblade/vim-gitgutter',                {'type': 'start'}
Plugin 'chrisbra/NrrwRgn',                      {'type': 'start'}
Plugin 'cohama/agit.vim',                       {'type': 'start'}
Plugin 'drmikehenry/vim-fontsize',              {'type': 'start'}
Plugin 'easymotion/vim-easymotion',             {'type': 'start'}
Plugin 'idanarye/vim-merginal',                 {'type': 'start'}
Plugin 'nishigori/increment-activator',         {'type': 'start'}
Plugin 'garbas/vim-snipmate',                   {'type': 'start'}
Plugin 'haya14busa/is.vim',                     {'type': 'start'}
Plugin 'haya14busa/vim-asterisk',               {'type': 'start'}
Plugin 'honza/vim-snippets',                    {'type': 'start'}
Plugin 'itchyny/lightline.vim'
Plugin 'jreybert/vimagit',                      {'type': 'start'}
Plugin 'junegunn/vim-easy-align',               {'type': 'start'}
Plugin 'junegunn/vim-peekaboo',                 {'type': 'start'}
Plugin 'justinmk/vim-sneak',                    {'type': 'start'}
Plugin 'kshenoy/vim-signature',                 {'type': 'start'}
Plugin 'lifepillar/vim-mucomplete',             {'type': 'start'}
Plugin 'liuchengxu/vim-which-key',              {'type': 'start'}
Plugin 'luochen1990/rainbow',                   {'type': 'start'}
Plugin 'machakann/vim-highlightedyank',         {'type': 'start'}
Plugin 'MarcWeber/vim-addon-mw-utils',          {'type': 'start'}
Plugin 'MattesGroeger/vim-bookmarks',           {'type': 'start'}
Plugin 'markonm/traces.vim',                    {'type': 'start'}
Plugin 'mhinz/vim-grepper',                     {'type': 'start'}
Plugin 'mox-mox/vim-localsearch',               {'type': 'start'}
Plugin 'myusuf3/numbers.vim',                   {'type': 'start'}
Plugin 'Olical/vim-enmasse',                    {'type': 'start'}
Plugin 'osyo-manga/vim-anzu',                   {'type': 'start'}
Plugin 'pelodelfuego/vim-swoop',                {'type': 'start'}
Plugin 'Raimondi/delimitMate',                  {'type': 'start'}
Plugin 'rbong/vim-flog',                        {'type': 'start'}
Plugin 'rhysd/committia.vim',                   {'type': 'start'}
Plugin 'rhysd/conflict-marker.vim',             {'type': 'start'}
Plugin 'rhysd/git-messenger.vim',               {'type': 'start'}
Plugin 'ryanoasis/vim-devicons',                {'type': 'start'}
Plugin 'sainnhe/lightline_foobar.vim'
Plugin 'scrooloose/nerdtree',                   {'type': 'start'}
Plugin 'taohexxx/lightline-buffer'
Plugin 'tommcdo/vim-lion',                      {'type': 'start'}
Plugin 'tomtom/tcomment_vim',                   {'type': 'start'}
Plugin 'tomtom/tinykeymap_vim',                 {'type': 'start'}
Plugin 'tomtom/tlib_vim',                       {'type': 'start'}
Plugin 'tpope/vim-capslock',                    {'type': 'start'}
Plugin 'tpope/vim-dispatch',                    {'type': 'start'}
Plugin 'tpope/vim-endwise',                     {'type': 'start'}
Plugin 'tpope/vim-fugitive',                    {'type': 'start'}
Plugin 'tpope/vim-obsession',                   {'type': 'start'}
Plugin 'tpope/vim-sensible',                    {'type': 'start'}
Plugin 'tpope/vim-sleuth',                      {'type': 'start'}
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-surround',                    {'type': 'start'}
Plugin 'tpope/vim-unimpaired',                  {'type': 'start'}
Plugin 'tyru/capture.vim',                      {'type': 'start'}
Plugin 'unblevable/quick-scope',                {'type': 'start'}
Plugin 'vhda/verilog_systemverilog.vim',        {'type': 'start'}
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-scripts/VisIncr',                   {'type': 'start'}
Plugin 'wellle/targets.vim',                    {'type': 'start'}
Plugin 'wellle/visual-split.vim'
Plugin 'xolox/vim-misc',                        {'type': 'start'}
Plugin 'xolox/vim-colorscheme-switcher',        {'type': 'start'}
Plugin 'Xuyuanp/nerdtree-git-plugin',           {'type': 'start'}
Plugin 'Yggdroot/indentline',                   {'type': 'start'}
Plugin 'zhuzhzh/verilog_emacsauto.vim'
Plugin 'AndrewRadev/switch.vim',                {'type': 'start'}

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

Plugin 'arcticicestudio/nord-vim',               {'package': 'colors', 'type': 'start', 'branch': 'develop'}
Plugin 'atelierbram/vim-colors_atelier-schemes', {'package': 'colors', 'type': 'start'}
Plugin 'ayu-theme/ayu-vim',                      {'package': 'colors', 'type': 'start'}
Plugin 'cocopon/iceberg.vim',                    {'package': 'colors', 'type': 'start'}
Plugin 'dracula/vim',                            {'package': 'colors', 'type': 'start', 'name': 'dracula'}
Plugin 'drewtempelmeyer/palenight.vim',          {'package': 'colors', 'type': 'start'}
Plugin 'kaicataldo/material.vim',                {'package': 'colors', 'type': 'start', 'name': 'material'}
Plugin 'liuchengxu/space-vim-theme',             {'package': 'colors', 'type': 'start'}
Plugin 'logico-dev/typewriter',                  {'package': 'colors', 'type': 'start'}
Plugin 'mkarmona/materialbox',                   {'package': 'colors', 'type': 'start'}
Plugin 'nanotech/jellybeans.vim',                {'package': 'colors', 'type': 'start', 'name': 'jellybeans'}
Plugin 'nightsense/cosmic_latte',                {'package': 'colors', 'type': 'start'}
Plugin 'nightsense/seabird',                     {'package': 'colors', 'type': 'start'}
Plugin 'nightsense/snow',                        {'package': 'colors', 'type': 'start'}
Plugin 'nightsense/stellarized',                 {'package': 'colors', 'type': 'start'}
Plugin 'nightsense/vimspectr',                   {'package': 'colors', 'type': 'start'}
Plugin 'NLKNguyen/papercolor-theme',             {'package': 'colors', 'type': 'start'}
Plugin 'rakr/vim-one',                           {'package': 'colors', 'type': 'start'}
Plugin 'reedes/vim-colors-pencil',               {'package': 'colors', 'type': 'start'}
Plugin 'romainl/Apprentice',                     {'package': 'colors', 'type': 'start'}
Plugin 'romainl/flattened',                      {'package': 'colors', 'type': 'start'}
Plugin 'sainnhe/edge',                           {'package': 'colors', 'type': 'start'}
Plugin 'sainnhe/gruvbox-material',               {'package': 'colors', 'type': 'start'}
Plugin 'severij/vadelma',                        {'package': 'colors', 'type': 'start'}
Plugin 'srcery-colors/srcery-vim',               {'package': 'colors', 'type': 'start'}
Plugin 'toupeira/vim-desertink',                 {'package': 'colors', 'type': 'start'}
Plugin 'tyrannicaltoucan/vim-deep-space',        {'package': 'colors', 'type': 'start'}

Plugin 'dhruvasagar/vim-table-mode',             {'package': 'write'}
Plugin 'godlygeek/tabular',                      {'package': 'write'}
Plugin 'hsitz/VimOrganizer',                     {'package': 'write'}
Plugin 'jceb/vim-orgmode',                       {'package': 'write'}
Plugin 'junegunn/vim-journal',                   {'package': 'write'}
Plugin 'mattn/calendar-vim',                     {'package': 'write'}
Plugin 'vimoutliner/vimoutliner',                {'package': 'write'}
Plugin 'vim-voom/VOoM',                          {'package': 'write'}
Plugin 'vimwiki/vimwiki',                        {'package': 'write'}
Plugin 'xolox/vim-notes',                        {'package': 'write'}
Plugin 'dhruvasagar/vim-dotoo',                  {'package': 'write'}

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
      let g:airline_section_x = airline#section#create_right(['%-20{colorschemefunctions#CurrentColorscheme()}', 'bookmark', 'tagbar', 'vista', 'gutentags', 'grepper', 'filetype'])
      let g:airline_section_c = airline#section#create(['%<', 'file', g:airline_symbols.space, 'readonly', '%{myfunctions#MU()}'])
    endif
  endif

  if a:plugname == "vim-airline"
    PackAdd! vim-airline-themes
  elseif a:plugname == "lightline.vim"
    PackAdd! lightline-buffer
    PackAdd! lightline_foobar.vim
    PackAdd! pomodoro.vim
  endif

endfunction
