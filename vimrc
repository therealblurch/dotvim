" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={{{,}}} foldlevel=0 foldmethod=marker:

scriptencoding utf-8

runtime OPT autopac.vim

set backupskip+=*_layout*.v
set backupskip+=*_gates.v
set belloff+=ctrlg
set completeopt+=menuone,noselect
if has("patch-8.1.0360")
    set diffopt+=internal,algorithm:patience
endif
set directory=~/.vim/cache/swap
set grepprg=ag\ --nogroup\ --nocolor
set hidden
set hlsearch
set ignorecase
set list
if !has('win64') && !has('win32')
    set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨
endif
set modeline
set nojoinspaces
set noshowmode
set nowrap
set path=**
set runtimepath+=~/.vim/plug/onehalf/vim
set sessionoptions=blank,buffers,curdir,folds,tabpages,winsize,globals
set shortmess+=filmnrxoOtTc
set showcmd
set showmatch
set showtabline=2
set smartcase
set tags=$PROJ_USER/rtl/tags
if !has('gui_running')
    set termguicolors
endif
if has('persistent_undo')
   set undofile
   set undolevels=1000
   set undoreload=10000
endif
set undodir=~/.vim/cache/undo
set updatetime=250
set viewoptions=folds,options,cursor,unix,slash
set viminfo='100,<50,s10,h,n~/.vim/cache/viminfo
set virtualedit=onemore
set wildignore=*.swp,*.bak
set wildignore+=*/.git/**/*
set wildignore+=tags
set wildignore+=*.tar.*
set wildmode=longest:full,full

let mapleader = ' '

" General maps to make life easier {{{

" Fix shift typos
command! -bang -nargs=* -complete=file E e<bang> <args>
command! -bang -nargs=* -complete=file W w<bang> <args>
command! -bang -nargs=* -complete=file Wq wq<bang> <args>
command! -bang -nargs=* -complete=file WQ wq<bang> <args>
command! -bang Wa wa<bang>
command! -bang WA wa<bang>
command! -bang Q q<bang>
command! -bang QA qa<bang>
command! -bang Qa qa<bang>

" Visual Shifting
vnoremap < <gv
vnoremap > >gv

command! MakeTags !ctags -R --extras=+q --fields=+i -n .

" Make Y work like C and D
nnoremap Y y$

" Helpers to edit mode
" http://vimcasts.org/e/14
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

inoremap jj <Esc>

let g:rootdir = getcwd()
nnoremap cd :lcd %:p:h<bar>pwd<cr> " Switch to current file's directory
nnoremap cu :lcd ..<bar>pwd<cr> " Go up one directory
nnoremap cr :execute 'cd ' . rootdir<bar>pwd<cr> " Go to directory vim was opened at
nnoremap cp :pwd<cr> " Print current working directory

" Edit/source .vimrc
noremap <leader>evi :tabedit ~/.vim/vimrc<CR>
noremap <leader>sv :source ~/.vim/vimrc<CR>

" Timestamps
nnoremap <F6> "=strftime("%c")
inoremap <F6> <C-R>=strftime("%c")<CR>

nmap <silent> <leader>ls :PackAdd vim-surround<CR>
nmap <silent> <leader>ll :PackAdd vim-lion<CR>
nmap <silent> <leader>lto :PackAdd vim-textobj-entire<CR>
" }}}

" Colorscheme Options {{{

"ayu Possible Values: light| dark | mirage
let ayucolor="light"
let g:ayucolor=ayucolor

"material Possible Values: default | palenight | ocean | lighter | darker
let g:material_theme_style="palenight"

"Initial setting for g:gruvbox_material_background
let g:gruvbox_material_background = 'hard'

"Initial setting for materialbox
let g:materialbox_contrast_dark = 'hard'
let g:materialbox_contrast_light = 'hard'

"g:colorscheme_map is a list of dictionaries that specify options for
"colorschemes.  The dictionary keys are as follows:
" name : the name of the colorscheme
" comparison : If this is set to 'fuzzy' don't require an exact name match
" lightlinetheme : Specifies lightline theme to load:
"   'colorscheme': Theme name is the same as the colorscheme name
"   'colorscheme_bg' : Theme name is the same as the colorscheme name _<bg>
"      appended.
"   'dropbg' : The color scheme has Dark/Light variants that need to be
"      dropped to create the lightline theme name.
"   'substitutebg' : Part of the colorscheme name has to be substituted with
"      the bg value to create the lightline theme name.
"   The script assumes that any other value is the actual name of the
"      lightline theme to be loaded.  If no lightline theme is specified then
"      the powerline theme will be selected.
" runtime : A value of 'true' will cause the lightline theme to be sourced
"      again.  The theme values need to be recalculated because of a change in
"      the colorscheme variant.
" airlinetheme : Specifies the name of the airline theme.
"      colorscheme : the airline theme name is the sames as the colorscheme
"      name.
"      The script assumes that any other value is the name of the theme to be
"      loaded.  If no value is specified then the dark airline theme is
"      selected.
" variant_type: Specifies how to switch between different colorscheme variants
"      background: Toggle light/dark backgrounds
"      colorscheme: Use variant_base to choose different versions of the
"         colorscheme
"      colorscheme_bg: Use variant base to choose different versions of the
"         colorscheme.  The background can also be toggled to select a light
"         and dark version of each variant.
"      ayu_color: ayu colorscheme.  Change the value of ayucolor variable.
"      material_theme_style: material colorscheme.  Change the value of
"         g:material_theme_style.
"      gruvbox_material_background: gruvbox_material colorscheme.  Change the
"         value of g:gruvbox_material_background.  The background will also
"         toggle to select a light and dark version of each variant.
"      materialbox_contrast: materialbox colorscheme.  Change the value of
"          g:materialbox_contrast_dark or g:materialbox_contrast_light based on
"          the current bg setting.  The background will also toggle to select
"          a light and dark version of each variant.
" variants : a list of possible variants
" variant_base: The common part of the name for all colorscheme variants
"     drop: Indicates that the variant must be removed from the colorscheme
"     before the new colorscheme is created.
"
let g:colorscheme_map = [
         \ {'name': 'Base2Tone',        'comparison': 'fuzzy',                'lightlinetheme': 'dropbg',             'runtime': 'true',                      'airlinetheme': 'colorscheme',                 'variant_type': 'colorscheme',    'variant_base': 'drop',       'variants': ['Light', 'Dark']},
         \ {'name': 'PaperColor',       'lightlinetheme': 'colorscheme',      'runtime': 'true',                      'airlinetheme': 'colorscheme',          'variant_type': 'background'},
         \ {'name': 'afterglow',        'airlinetheme': 'colorscheme'},
         \ {'name': 'apprentice',       'lightlinetheme': 'colorscheme',      'airlinetheme': 'colorscheme'},
         \ {'name': 'atlantis',         'lightlinetheme': 'colorscheme'},
         \ {'name': 'ayu',              'lightlinetheme': 'colorscheme',      'runtime': 'true',                      'airlinetheme': 'colorscheme',          'variant_type': 'ayu_color',                   'variants': ['light', 'dark', 'mirage']},
         \ {'name': 'base16',           'comparison': 'fuzzy',                'lightlinetheme': 'colorscheme',        'airlinetheme': 'colorscheme'},
         \ {'name': 'blayu',            'lightlinetheme': 'colorscheme',      'airlinetheme': 'colorscheme'},
         \ {'name': 'candid',           'lightlinetheme': 'colorscheme'},
         \ {'name': 'corvine',          'comparison': 'fuzzy',                'variant_type': 'colorscheme',          'variant_base': 'corvine',              'variants': ['', '_light']},
         \ {'name': 'cosmic_latte',     'lightlinetheme': 'colorscheme_bg',   'airlinetheme': 'colorscheme_bg',       'variant_type': 'background'},
         \ {'name': 'darcula',          'lightlinetheme': 'darculaOriginal'},
         \ {'name': 'dark_purple',      'lightlinetheme': 'colorscheme'},
         \ {'name': 'deep-space',       'lightlinetheme': 'deepspace',        'airlinetheme': 'colorscheme'},
         \ {'name': 'desert-night',     'lightlinetheme': 'colorscheme'},
         \ {'name': 'desertink',        'airlinetheme': 'colorscheme'},
         \ {'name': 'dracula',          'lightlinetheme': 'colorscheme',      'airlinetheme': 'colorscheme'},
         \ {'name': 'edge',             'lightlinetheme': 'colorscheme',      'runtime': 'true',                      'variant_type': 'background'},
         \ {'name': 'flattened',        'comparison': 'fuzzy',                'lightlinetheme': 'colorscheme',        'airlinetheme': 'colorscheme',          'variant_type': 'colorscheme',                 'variant_base': 'drop',           'variants': ['_light', '_dark']},
         \ {'name': 'focuspoint',       'airlinetheme': 'colorscheme'},
         \ {'name': 'foo',              'comparison': 'fuzzy',                'airlinetheme': 'distinguished'},
         \ {'name': 'forest-night',     'lightlinetheme': 'colorscheme',      'airlinetheme': 'colorscheme'},
         \ {'name': 'garbage-oracle',   'lightlinetheme': 'GarbageOracle',    'runtime': 'true',                      'variant_type': 'background'},
         \ {'name': 'github',           'airlinetheme': 'colorscheme'},
         \ {'name': 'greygull',         'airlinetheme': 'colorscheme'},
         \ {'name': 'gruvbox-material', 'lightlinetheme': 'colorscheme',      'runtime': 'true',                      'airlinetheme': 'colorscheme',          'variant_type': 'gruvbox_material_background', 'variants': ['soft', 'medium', 'hard']},
         \ {'name': 'horizon',          'lightlinetheme': 'colorscheme'},
         \ {'name': 'hybrid',           'airlinetheme': 'colorscheme'},
         \ {'name': 'hybrid_material',  'airlinetheme': 'colorscheme',        'variant_type': 'background'},
         \ {'name': 'hybrid_reverse',   'airlinetheme': 'colorscheme',        'variant_type': 'background'},
         \ {'name': 'iceberg',          'lightlinetheme': 'colorscheme',      'airlinetheme': 'colorscheme'},
         \ {'name': 'jellybeans',       'lightlinetheme': 'colorscheme',      'airlinetheme': 'colorscheme'},
         \ {'name': 'kuroi',            'variant_type': 'background'},
         \ {'name': 'material',         'lightlinetheme': 'material_vim',     'runtime': 'true',                      'variant_type': 'material_theme_style', 'variants': ['default', 'palenight', 'ocean', 'lighter', 'darker']},
         \ {'name': 'materialbox',      'airlinetheme': 'colorscheme',        'variant_type': 'materialbox_contrast', 'variants': ['soft', 'medium', 'hard']},
         \ {'name': 'minimalist',       'airlinetheme': 'colorscheme'},
         \ {'name': 'molokai',          'airlinetheme': 'colorscheme'},
         \ {'name': 'monokai',          'airlinetheme': 'colorscheme'},
         \ {'name': 'night-owl',        'lightlinetheme': 'nightowl',         'airlinetheme': 'colorscheme'},
         \ {'name': 'nord',             'lightlinetheme': 'colorscheme',      'airlinetheme': 'colorscheme'},
         \ {'name': 'one',              'lightlinetheme': 'colorscheme',      'runtime': 'true',                      'airlinetheme': 'colorscheme',          'variant_type': 'background'},
         \ {'name': 'onehalf',          'comparison': 'fuzzy',                'lightlinetheme': 'onehalfdark',        'variant_type': 'colorscheme',          'variant_base': 'drop',                        'variants': ['light', 'dark']},
         \ {'name': 'pencil',           'lightlinetheme': 'pencil_alter',     'airlinetheme': 'colorscheme',          'variant_type': 'background'},
         \ {'name': 'petrel',           'airlinetheme': 'colorscheme'},
         \ {'name': 'plastic',          'lightlinetheme': 'colorscheme'},
         \ {'name': 'quantum',          'lightlinetheme': 'colorscheme',      'variant_type': 'background'},
         \ {'name': 'sacredforest',     'lightlinetheme': 'colorscheme'},
         \ {'name': 'seagul',           'airlinetheme': 'colorscheme'},
         \ {'name': 'sialoquent',       'lightlinetheme': 'colorscheme'},
         \ {'name': 'snazzy',           'lightlinetheme': 'colorscheme'},
         \ {'name': 'snow',             'lightlinetheme': 'colorscheme_bg',   'airlinetheme': 'colorscheme_bg',       'variant_type': 'background'},
         \ {'name': 'solarized8',       'comparison': 'fuzzy',                'lightlinetheme': 'solarized',          'runtime': 'true',                      'airlinetheme': 'colorscheme',                 'variant_type': 'colorscheme_bg', 'variant_base': 'solarized8', 'variants': ['', '_low', '_flat', '_high']},
         \ {'name': 'space_vim_theme',  'lightlinetheme': 'substitutebg',     'subpat': 'theme',                      'variant_type': 'background'},
         \ {'name': 'spring-night',     'airlinetheme': 'colorscheme'},
         \ {'name': 'srcery',           'lightlinetheme': 'colorscheme',      'airlinetheme': 'colorscheme'},
         \ {'name': 'stellarized',      'lightlinetheme': 'colorscheme_bg',   'airlinetheme': 'colorscheme_bg',       'variant_type': 'background'},
         \ {'name': 'stormpetrel',      'airlinetheme': 'colorscheme'},
         \ {'name': 'tender',           'lightlinetheme': 'colorscheme',      'airlinetheme': 'colorscheme'},
         \ {'name': 'typewriter',       'lightlinetheme': 'typewriter_light', 'airlinetheme': 'colorscheme',          'variant_type': 'colorscheme',          'variant_base': 'typewriter',                  'variants': ['', '-night']},
         \ {'name': 'typewriter-night', 'lightlinetheme': 'typewriter_dark',  'airlinetheme': 'colorscheme',          'variant_type': 'colorscheme',          'variant_base': 'typewriter',                  'variants': ['', '-night']},
         \ {'name': 'undead',           'airlinetheme': 'colorscheme',        'variant_type': 'background'},
         \ {'name': 'vadelma',          'lightlinetheme': 'colorscheme',      'runtime': 'true',                      'variant_type': 'background'},
         \ {'name': 'zenburn',          'airlinetheme': 'colorscheme'},
         \ ]


nmap <silent> <leader>- :<c-u>call colorschemefunctions#SchemeVariant(-v:count1)<cr>
nmap <silent> <leader>+ :<c-u>call colorschemefunctions#SchemeVariant(+v:count1)<cr>
" }}}

" Airline {{{
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#left_sep = "\ue0bc"
let g:airline#extensions#tabline#left_alt_sep = "\ue0bb"
let g:airline#extensions#tabline#right_sep = "\ue0ba"
let g:airline#extensions#tabline#right_alt_sep = "\ue0bb"
let g:airline_left_sep = "\ue0b8"
let g:airline_right_sep = "\ue0be"
let g:airline_theme_map = {
            \ 'Base2Tone_CaveDark'       : 'Base2Tone_CaveDark',
            \ 'Base2Tone_CaveLight'      : 'Base2Tone_CaveLight',
            \ 'Base2Tone_DesertDark'     : 'Base2Tone_DesertDark',
            \ 'Base2Tone_DesertLight'    : 'Base2Tone_DesertLight',
            \ 'Base2Tone_DrawbridgeDark' : 'Base2Tone_DrawbridgeDark',
            \ 'Base2Tone_DrawbridgeLight': 'Base2Tone_DrawbridgeLight',
            \ 'Base2Tone_EarthDark'      : 'Base2Tone_EarthDark',
            \ 'Base2Tone_EarthLight'     : 'Base2Tone_EarthLight',
            \ 'Base2Tone_EveningDark'    : 'Base2Tone_EveningDark',
            \ 'Base2Tone_EveningLight'   : 'Base2Tone_EveningLight',
            \ 'Base2Tone_ForestDark'     : 'Base2Tone_ForestDark',
            \ 'Base2Tone_ForestLight'    : 'Base2Tone_ForestLight',
            \ 'Base2Tone_HeathDark'      : 'Base2Tone_HeathDark',
            \ 'Base2Tone_HeathLight'     : 'Base2Tone_HeathLight',
            \ 'Base2Tone_LakeDark'       : 'Base2Tone_LakeDark',
            \ 'Base2Tone_LakeLight'      : 'Base2Tone_LakeLight',
            \ 'Base2Tone_MeadowDark'     : 'Base2Tone_MeadowDark',
            \ 'Base2Tone_MeadowLight'    : 'Base2Tone_MeadowLight',
            \ 'Base2Tone_MorningDark'    : 'Base2Tone_MorningDark',
            \ 'Base2Tone_MorningLight'   : 'Base2Tone_MorningLight',
            \ 'Base2Tone_PoolDark'       : 'Base2Tone_PoolDark',
            \ 'Base2Tone_PoolLight'      : 'Base2Tone_PoolLight',
            \ 'Base2Tone_SeaDark'        : 'Base2Tone_SeaDark',
            \ 'Base2Tone_SeaLight'       : 'Base2Tone_SeaLight',
            \ 'Base2Tone_SpaceDark'      : 'Base2Tone_SpaceDark',
            \ 'Base2Tone_SpaceLight'     : 'Base2Tone_SpaceLight',
            \ 'greygull'                 : 'seagul',
            \ 'hybrid*'                  : 'hybrid',
            \ 'petrel'                   : 'seagull',
            \ 'solarized8*'              : 'solarized',
            \ 'stormpetrel'              : 'seagull',
            \ }

" }}}

" buftabline {{{
let g:buftabline_numbers = 1
let g:buftabline_indicators = 1
let g:buftabline_separators = 1
" }}}

"Color Scheme Switcher {{{
let g:colorscheme_switcher_exclude_builtins = 1
" let g:colorscheme_switcher_keep_background = 1
" }}}

" Easy Align {{{
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
" }}}

" Fugitive {{{
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>
nnoremap <silent> <leader>gr :Gremove<CR>
autocmd BufReadPost fugitive://* set bufhidden=delete
"}}}

" gitgutter {{{
let g:gitgutter_highlight_lines = 1
if has('gui_running') && !has('win64') && !has('win32')
    " Use fontawesome icons as signs
    let g:gitgutter_sign_added = ''
    let g:gitgutter_sign_modified = ''
    let g:gitgutter_sign_removed = ''
    let g:gitgutter_sign_removed_first_line = ''
    let g:gitgutter_sign_modified_removed = ''
endif
" }}}

" grep keymaps {{{
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap <Space>/ :Ag<SPACE>
" }}}

" Indentline {{{
if !has('win64') && !has('win32')
    let g:indentLine_char_list = ['|', '¦', '┆', '┊']
endif
" }}}

" Lightline {{{
   let g:lightline = {}
   let g:lightline.active = {
                            \ 'left': [['mode', 'paste'],
                            \         ['gitgutter', 'fugitive', 'readonly', 'filename']],
                            \ 'right': [['obsession', 'lineinfo'],
                            \          ['percent', 'winform', 'pomodoro'],
                            \          ['fileformat', 'fileencoding', 'filetype', 'colorscheme']]
                            \ }
    let g:lightline.component = {
                                   \ 'charvaluehex': '0x%B',
                                   \ 'lineinfo': ' %3l[%L]:%-2v',
                                   \ 'separator': ''
                                   \ }
    let g:lightline.component_function = {
                                        \ 'readonly': 'lightlinefunctions#LightlineReadonly',
                                        \ 'fugitive': 'lightlinefunctions#LightlineFugitive',
                                        \ 'gitbranch': 'fugitive#head',
                                        \ 'modified': 'lightlinefunctions#LightlineModified',
                                        \ 'filename': 'lightlinefunctions#LightlineFilename',
                                        \ 'filepath': 'lightlinefunctions#LightlineFilepath',
                                        \ 'fileformat': 'lightlinefunctions#LightlineFileformat',
                                        \ 'filetype': 'lightlinefunctions#LightlineFiletype',
                                        \ 'fileencoding': 'lightlinefunctions#LightlineFileencoding',
                                        \ 'mode': 'lightlinefunctions#LightlineMode',
                                        \ 'winform': 'lightlinefunctions#LightlineWinform',
                                        \ 'colorscheme': 'lightlinefunctions#LightlineColorscheme',
                                        \ 'bufferinfo': 'lightline#buffer#bufferinfo',
                                        \ 'gitgutter': 'lightlinefunctions#LightlineGitgutter',
                                        \ 'pomodoro': 'lightlinefunctions#PomodoroStatus',
                                        \ 'obsession': 'ObsessionStatus'
                                        \ }
    let g:lightline.tabline = {
                             \ 'left': [ [ 'bufferinfo' ],
                             \           [ 'separator' ],
                             \           [ 'bufferbefore', 'buffercurrent', 'bufferafter' ] ],
                             \ 'right': [ [ 'close' ] ]
                             \ }
    let g:lightline.separator = { 'left': "\ue0b8", 'right': "\ue0be" }
    let g:lightline.subseparator = { 'left': "\ue0b9", 'right': "\ue0b9" }
    let g:lightline.tabline_separator = { 'left': "\ue0bc", 'right': "\ue0ba" }
    let g:lightline.tabline_subseparator = { 'left': "\ue0bb", 'right': "\ue0bb" }
    let g:lightline.tab = {
                         \ 'active': [ 'tabnum', 'filename', 'modified' ],
                         \ 'inactive': [ 'tabnum', 'filename', 'modified' ]
                         \ }
    let g:lightline.component_expand = {
                                       \ 'buffercurrent': 'lightline#buffer#buffercurrent',
                                       \ 'bufferbefore': 'lightline#buffer#bufferbefore',
                                       \ 'bufferafter': 'lightline#buffer#bufferafter'
                                       \ }
    let g:lightline.component_type = {
                                     \ 'buffercurrent': 'tabsel',
                                     \ 'bufferbefore': 'raw',
                                     \ 'bufferafter': 'raw'
                                     \ }

let g:lightline#bufferline#min_buffer_count = 2
let g:lightline#bufferline#enable_devicons = 1
let g:lightline#bufferline#show_number = 1
let g:lightline#bufferline#filename_modifier = ':t'

" lightline-buffer ui settings
" replace these symbols with ascii characters if your environment does not support unicode

let g:lightline_buffer_logo = ' '
let g:lightline_buffer_readonly_icon = ''
let g:lightline_buffer_modified_icon = '✭'
let g:lightline_buffer_expand_left_icon = '◀ '
let g:lightline_buffer_expand_right_icon = ' ▶'
let g:lightline_buffer_separator_icon = '  '
let g:lightline_buffer_git_icon = ' '
let g:lightline_buffer_ellipsis_icon = '..'
let g:lightline_buffer_active_buffer_left_icon = ''
let g:lightline_buffer_active_buffer_right_icon = ''
let g:lightline_buffer_enable_devicons = 1
let g:lightline_buffer_show_bufnr = 1
let g:lightline_buffer_fname_mod = ':t'
let g:lightline_buffer_maxflen = 30
let g:lightline_buffer_maxfextlen = 3
let g:lightline_buffer_minflen = 16
let g:lightline_buffer_minfextlen = 3
let g:lightline_buffer_reservelen = 20

command! -nargs=1 -complete=custom,lightlinefunctions#LightlineColorschemes LightlineColorscheme
   \ call lightlinefunctions#SetLightlineColorscheme(<q-args>)
 " }}}

" Statusbar Plugin selection {{{
let g:prefer_airline = 0
let g:colorscheme_file = '~/.vim/.colorscheme'

augroup StatusBarTheme
    autocmd!
    autocmd ColorScheme * if myfunctions#WhichStatus(g:colors_name) == "airline"   | PackAdd vim-airline | call colorschemefunctions#AirlineTheme(g:colors_name) | endif
    autocmd Colorscheme * if myfunctions#WhichStatus(g:colors_name) == "lightline" | PackAdd lightline.vim | call lightlinefunctions#LightlineUpdate() | endif
    autocmd Colorscheme * if myfunctions#WhichStatus(g:colors_name) == "none" && exists('g:loaded_lightline') | call lightlinefunctions#LightlineUpdate() | endif
    autocmd Colorscheme * if myfunctions#WhichStatus(g:colors_name) == "none" && exists('g:loaded_airline') | call colorschemefunctions#AirlineTheme(g:colors_name) | endif
    autocmd Colorscheme * if myfunctions#WhichStatus(g:colors_name) == "none" && !exists('g:loaded_lightline') && !exists('g:loaded_airline') | PackAdd vim-buftabline | endif
    autocmd Colorscheme * call writefile([&background, g:colors_name], expand(g:colorscheme_file))
augroup END

autocmd VimEnter * call colorschemefunctions#SetLastColorscheme()

command! -nargs=1 -complete=color Colorscheme call xolox#colorscheme_switcher#switch_to(<q-args>)
" }}}

" minisnip {{{
let g:minisnip_trigger = '<leader>s'
"}}}

" mucomplete {{{
if has('patch-8.0.0283')
else
    imap <Plug>MyCR <Plug>(MUcompleteCR)
    imap <cr> <Plug>MyCR
endif
let g:mucomplete#enable_auto_at_startup=1
" }}}

" Rainbow {{{
let g:rainbow_active = 1
" }}}

" System Verilog {{{
nnoremap <leader>i :VerilogFollowInstance<CR>
nnoremap <leader>I :VerilogFollowPort<CR>
nnoremap <leader>u :VerilogGotoInstanceStart<CR>
" }}}

"VerParse {{{
let g:VPPreCommand = "source /home/data/smtd_design/bin/ss brent"
" }}}

call matchadd('ColorColumn', '\%81v', 100)

" Status line {{{
function! StatuslineGit()
    let l:branchname = fugitive#head()
    if strlen(l:branchname) > 0
        return ' '.l:branchname.' '
    else
        return ' clean '
    endif
endfunction

set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{(mode()=='n')?'\ \ NORMAL\ ':''}
set statusline+=%{(mode()=='i')?'\ \ INSERT\ ':''}
set statusline+=%{(mode()=='v')?'\ \ VISUAL\ ':''}
set statusline+=%{(mode()=='r')?'\ \ REPLACE\ ':''}
set statusline+=%#LineNr#
set statusline+=\ 
set statusline+=%{myfunctions#GitgutterStatus()}
set statusline+=
set statusline+=%{StatuslineGit()}
set statusline+=\ %f
set statusline+=%m\ 
set statusline+=%=
set statusline+=%{myfunctions#CurrentColorscheme()}\ 
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\ 
" }}}
