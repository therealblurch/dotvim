function! packager_init#PackagerInit() abort
  packadd vim-packager
  call packager#init({'package': 'general'})

  " packager plugin
  call packager#add('https://therealblurch@github.com/therealblurch/vim-packager',      {'package': 'packager', 'type': 'opt'})
  call packager#add('https://therealblurch@github.com/therealblurch/vim_theme_manager', {'package': 'colors'})

  " git plugins
  call packager#add('airblade/vim-gitgutter',                 {'package': 'git'})
  call packager#add('rhysd/committia.vim',                    {'package': 'git'})
  call packager#add('rbong/vim-flog',                         {'package': 'git'})
  call packager#add('rhysd/conflict-marker.vim',              {'package': 'git'})
  call packager#add('rhysd/git-messenger.vim',                {'package': 'git'})
  call packager#add('tpope/vim-fugitive',                     {'package': 'git'})

  " statusbar plugins
  call packager#add('itchyny/lightline.vim',                  {'package': 'status', 'type': 'opt'})
  call packager#add('sainnhe/lightline_foobar.vim',           {'package': 'status', 'type': 'opt'})
  call packager#add('taohexxx/lightline-buffer',              {'package': 'status', 'type': 'opt'})
  call packager#add('vim-airline/vim-airline',                {'package': 'status', 'type': 'opt'})
  call packager#add('vim-airline/vim-airline-themes',         {'package': 'status', 'type': 'opt'})

  " general plugins
  call packager#add('b4winckler/vim-angry')
  call packager#add('bkad/CamelCaseMotion')
  call packager#add('bounceme/poppy.vim')
  call packager#add('chrisbra/NrrwRgn')
  call packager#add('drmikehenry/vim-fontsize')
  call packager#add('itchyny/vim-cursorword')
  call packager#add('jiangmiao/auto-pairs')
  call packager#add('junegunn/vim-peekaboo')
  call packager#add('kshenoy/vim-signature')
  call packager#add('lifepillar/vim-mucomplete')
  call packager#add('liuchengxu/vim-which-key')
  call packager#add('machakann/vim-highlightedyank')
  call packager#add('markonm/traces.vim')
  call packager#add('mg979/vim-visual-multi')
  call packager#add('myusuf3/numbers.vim')
  call packager#add('nishigori/increment-activator')
  call packager#add('rhysd/clever-f.vim')
  call packager#add('ryanoasis/vim-devicons')
  call packager#add('tommcdo/vim-lion')
  call packager#add('tomtom/tcomment_vim',                  {'requires': 'tomtom/tlib_vim'})
  call packager#add('tpope/vim-dispatch')
  call packager#add('tpope/vim-endwise')
  call packager#add('tpope/vim-repeat')
  call packager#add('tpope/vim-rhubarb')
  call packager#add('tpope/vim-sensible')
  call packager#add('tpope/vim-sleuth')
  call packager#add('tpope/vim-speeddating')
  call packager#add('tpope/vim-surround')
  call packager#add('tpope/vim-unimpaired')
  call packager#add('tpope/vim-vinegar')
  call packager#add('vhda/verilog_systemverilog.vim')
  call packager#add('vim-scripts/VisIncr')
  call packager#add('wellle/context.vim')
  call packager#add('wellle/targets.vim')
  call packager#add('Yggdroot/indentline')
  call packager#add('zhuzhzh/verilog_emacsauto.vim')

  "text objects
  " call packager#add('adriaanzon/vim-textobj-matchit',         {'package': 'textobj'})
  " call packager#add('deathlyfrantic/vim-textobj-blanklines',  {'package': 'textobj'})
  " call packager#add('fvictorio/vim-textobj-backticks',        {'package': 'textobj'})
  " call packager#add('gilligan/textobj-gitgutter',             {'package': 'textobj'})
  " call packager#add('glts/vim-textobj-comment',               {'package': 'textobj'})
  " call packager#add('glts/vim-textobj-indblock',              {'package': 'textobj'})
  " call packager#add('kana/vim-textobj-datetime',              {'package': 'textobj'})
  " call packager#add('kana/vim-textobj-diff',                  {'package': 'textobj'})
  " call packager#add('kana/vim-textobj-entire',                {'package': 'textobj'})
  " call packager#add('kana/vim-textobj-fold',                  {'package': 'textobj'})
  " call packager#add('kana/vim-textobj-indent',                {'package': 'textobj'})
  " call packager#add('kana/vim-textobj-lastpat',               {'package': 'textobj'})
  " call packager#add('kana/vim-textobj-line',                  {'package': 'textobj'})
  " call packager#add('kana/vim-textobj-user',                  {'package': 'textobj'})
  " call packager#add('paulhybryant/vim-textobj-path',          {'package': 'textobj'})
  " call packager#add('rhysd/vim-textobj-continuous-line',      {'package': 'textobj'})
  " call packager#add('saaguero/vim-textobj-pastedtext',        {'package': 'textobj'})
  " call packager#add('thinca/vim-textobj-between',             {'package': 'textobj'})
  " call packager#add('vimtaku/vim-textobj-keyvalue',           {'package': 'textobj'})

  " colorschemes
  call packager#add('ajh17/Spacegray.vim',                    {'package': 'colors'})
  call packager#add('arcticicestudio/nord-vim',               {'package': 'colors', 'branch': 'develop'})
  call packager#add('ashfinal/vim-colors-paper',              {'package': 'colors'})
  call packager#add('ayu-theme/ayu-vim',                      {'package': 'colors'})
  call packager#add('bluz71/vim-nightfly-guicolors',          {'package': 'colors'})
  call packager#add('cocopon/iceberg.vim',                    {'package': 'colors'})
  call packager#add('cormacrelf/vim-colors-github',           {'package': 'colors'})
  call packager#add('dfxyz/CandyPaper.vim',                   {'package': 'colors'})
  call packager#add('dracula/vim',                            {'package': 'colors', 'name': 'dracula'})
  call packager#add('flrnd/candid.vim',                       {'package': 'colors'})
  call packager#add('haishanh/night-owl.vim',                 {'package': 'colors'})
  call packager#add('haystackandroid/cosmic_latte',           {'package': 'colors'})
  call packager#add('haystackandroid/seabird',                {'package': 'colors'})
  call packager#add('haystackandroid/snow',                   {'package': 'colors'})
  call packager#add('haystackandroid/stellarized',            {'package': 'colors'})
  call packager#add('haystackandroid/vimspectr',              {'package': 'colors'})
  call packager#add('jnurmine/Zenburn',                       {'package': 'colors'})
  call packager#add('kaicataldo/material.vim',                {'package': 'colors', 'name': 'material'})
  call packager#add('koirand/tokyo-metro.vim',                {'package': 'colors'})
  call packager#add('michaelmalick/vim-colors-bluedrake',     {'package': 'colors'})
  call packager#add('mkarmona/materialbox',                   {'package': 'colors'})
  call packager#add('nanotech/jellybeans.vim',                {'package': 'colors', 'name': 'jellybeans'})
  call packager#add('rakr/vim-one',                           {'package': 'colors'})
  call packager#add('reedes/vim-colors-pencil',               {'package': 'colors'})
  call packager#add('Rigellute/shades-of-purple.vim',         {'package': 'colors'})
  call packager#add('romainl/Apprentice',                     {'package': 'colors'})
  call packager#add('sainnhe/everforest',                     {'package': 'colors'})
  call packager#add('sainnhe/gruvbox-material',               {'package': 'colors'})
  call packager#add('sainnhe/sonokai',                        {'package': 'colors'})
  call packager#add('severij/vadelma',                        {'package': 'colors'})
  call packager#add('srcery-colors/srcery-vim',               {'package': 'colors'})
  call packager#add('toupeira/vim-desertink',                 {'package': 'colors'})
  call packager#add('tpope/vim-vividchalk',                   {'package': 'colors'})
  call packager#add('tyrannicaltoucan/vim-deep-space',        {'package': 'colors'})
  call packager#add('wadackel/vim-dogrun',                    {'package': 'colors'})

  " writing plugins
  call packager#add('dhruvasagar/vim-table-mode',             {'package': 'write'})
  call packager#add('godlygeek/tabular',                      {'package': 'write'})
  call packager#add('vimwiki/vimwiki',                        {'package': 'write'})
  call packager#add('junegunn/fzf',                           {'package': 'write'})
  call packager#add('junegunn/fzf.vim',                       {'package': 'write'})
  call packager#add('alok/notational-fzf-vim',                {'package': 'write'})
  call packager#add('michal-h21/vim-zettel',                  {'package': 'write'})

endfunction

