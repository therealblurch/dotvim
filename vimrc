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
set runtimepath+=~/.fzf
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

" Miscellaneous autocmds {{{
augroup resCur
    autocmd!
    autocmd BufWinEnter * call myfunctions#ResCur()
augroup END
" }}}

"Colorscheme Options {{{

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

let s:atelier_dict = {}
let s:atelier_dict.name = 'Atelier'
let s:atelier_dict.comparison = 'fuzzy'
let s:atelier_dict.lightlinetheme = 'dropbg'
let s:atelier_dict.runtime = 'true'
let s:atelier_dict.airlinetheme = 'colorscheme'
let s:atelier_dict.variant_type = 'Atelier'
let s:atelier_dict.variants = ['Cave', 'Dune', 'Estuary', 'Forest', 'Heath', 'Lakeside', 'Plateau', 'Savanna', 'Seaside', 'Sulphurpool']

let s:papercolor_dict = {}
let s:papercolor_dict.name = 'PaperColor'
let s:papercolor_dict.lightlinetheme = 'colorscheme'
let s:papercolor_dict.runtime = 'true'
let s:papercolor_dict.airlinetheme = 'colorscheme'
let s:papercolor_dict.variant_type = 'background'

let s:afterglow_dict = {}
let s:afterglow_dict.name = 'afterglow'
let s:afterglow_dict.airlinetheme = 'colorscheme'

let s:apprentice_dict = {}
let s:apprentice_dict.name = 'apprentice'
let s:apprentice_dict.lightlinetheme = 'colorscheme'
let s:apprentice_dict.airlinetheme = 'colorscheme'

let s:atlantis_dict = {}
let s:atlantis_dict.name = 'atlantis'
let s:atlantis_dict.lightlinetheme = 'colorscheme'

let s:ayu_dict = {}
let s:ayu_dict.name = 'ayu'
let s:ayu_dict.lightlinetheme = 'colorscheme'
let s:ayu_dict.runtime = 'true'
let s:ayu_dict.airlinetheme = 'colorscheme'
let s:ayu_dict.variant_type = 'ayu_color'
let s:ayu_dict.variants = ['light', 'dark', 'mirage']

let s:blayu_dict = {}
let s:blayu_dict.name = 'blayu'
let s:blayu_dict.lightlinetheme = 'colorscheme'
let s:blayu_dict.airlinetheme = 'colorscheme'

let s:candid_dict = {}
let s:candid_dict.name = 'candid'
let s:candid_dict.lightlinetheme = 'colorscheme'

let s:corvine_dict = {}
let s:corvine_dict.name = 'corvine'
let s:corvine_dict.comparison = 'fuzzy'
let s:corvine_dict.variant_type = 'colorscheme'
let s:corvine_dict.variant_base = 'corvine'
let s:corvine_dict.variants = ['', '_light']

let s:cosmic_latte_dict = {}
let s:cosmic_latte_dict.name = 'cosmic_latte'
let s:cosmic_latte_dict.lightlinetheme = 'colorscheme_bg'
let s:cosmic_latte_dict.airlinetheme = 'colorscheme_bg'
let s:cosmic_latte_dict.variant_type = 'background'

let s:darcula_dict = {}
let s:darcula_dict.name = 'darcula'
let s:darcula_dict.lightlinetheme = 'darculaOriginal'

let s:dark_purple_dict = {}
let s:dark_purple_dict.name = 'dark_purple'
let s:dark_purple_dict.lightlinetheme = 'colorscheme'

let s:deep_space_dict = {}
let s:deep_space_dict.name = 'deep-space'
let s:deep_space_dict.lightlinetheme = 'deepspace'
let s:deep_space_dict.airlinetheme = 'colorscheme'

let s:desert_night_dict = {}
let s:desert_night_dict.name = 'desert-night'
let s:desert_night_dict.lightlinetheme = 'colorscheme'

let s:desertink_dict = {}
let s:desertink_dict.name = 'desertink'
let s:desertink_dict.airlinetheme = 'colorscheme'

let s:dracula_dict = {}
let s:dracula_dict.name = 'dracula'
let s:dracula_dict.lightlinetheme = 'colorscheme'
let s:dracula_dict.airlinetheme = 'colorscheme'

let s:edge_dict = {}
let s:edge_dict.name = 'edge'
let s:edge_dict.lightlinetheme = 'colorscheme'
let s:edge_dict.runtime = 'true'
let s:edge_dict.variant_type = 'background'

let s:flattened_dict = {}
let s:flattened_dict.name = 'flattened'
let s:flattened_dict.comparison = 'fuzzy'
let s:flattened_dict.lightlinetheme = 'colorscheme'
let s:flattened_dict.airlinetheme = 'colorscheme'
let s:flattened_dict.variant_type = 'colorscheme'
let s:flattened_dict.variant_base = 'drop'
let s:flattened_dict.variants = ['_light', '_dark']

let s:focuspoint_dict = {}
let s:focuspoint_dict.name = 'focuspoint'
let s:focuspoint_dict.airlinetheme = 'colorscheme'

let s:foo_dict = {}
let s:foo_dict.name = 'foo'
let s:foo_dict.comparison = 'fuzzy'
let s:foo_dict.airlinetheme = 'distinguished'

let s:forest_night_dict = {}
let s:forest_night_dict.name = 'forest-night'
let s:forest_night_dict.lightlinetheme = 'colorscheme'
let s:forest_night_dict.airlinetheme = 'colorscheme'

let s:garbage_oracle_dict = {}
let s:garbage_oracle_dict.name = 'garbage-oracle'
let s:garbage_oracle_dict.lightlinetheme = 'GarbageOracle'
let s:garbage_oracle_dict.runtime = 'true'
let s:garbage_oracle_dict.variant_type = 'background'

let s:github_dict = {}
let s:github_dict.name = 'github'
let s:github_dict.airlinetheme = 'colorscheme'

let s:greygull_dict = {}
let s:greygull_dict.name = 'greygull'
let s:greygull_dict.airlinetheme = 'colorscheme'

let s:gruvbox_material_dict = {}
let s:gruvbox_material_dict.name = 'gruvbox-material'
let s:gruvbox_material_dict.lightlinetheme = 'colorscheme'
let s:gruvbox_material_dict.runtime = 'true'
let s:gruvbox_material_dict.airlinetheme = 'colorscheme'
let s:gruvbox_material_dict.variant_type = 'gruvbox_material_background'
let s:gruvbox_material_dict.variants = ['soft', 'medium', 'hard']

let s:horizon_dict = {}
let s:horizon_dict.name = 'horizon'
let s:horizon_dict.lightlinetheme = 'colorscheme'

let s:hybrid_dict = {}
let s:hybrid_dict.name = 'hybrid'
let s:hybrid_dict.airlinetheme = 'colorscheme'

let s:hybrid_material_dict = {}
let s:hybrid_material_dict.name = 'hybrid_material'
let s:hybrid_material_dict.airlinetheme = 'colorscheme'
let s:hybrid_material_dict.variant_type = 'background'

let s:hybrid_reverse_dict = {}
let s:hybrid_reverse_dict.name = 'hybrid_reverse'
let s:hybrid_reverse_dict.airlinetheme = 'colorscheme'
let s:hybrid_reverse_dict.variant_type = 'background'

let s:iceberg_dict = {}
let s:iceberg_dict.name = 'iceberg'
let s:iceberg_dict.lightlinetheme = 'colorscheme'
let s:iceberg_dict.airlinetheme = 'colorscheme'

let s:jellybeans_dict = {}
let s:jellybeans_dict.name = 'jellybeans'
let s:jellybeans_dict.lightlinetheme = 'colorscheme'
let s:jellybeans_dict.airlinetheme = 'colorscheme'

let s:kuroi_dict = {}
let s:kuroi_dict.name = 'kuroi'
let s:kuroi_dict.variant_type = 'background'

let s:material_dict = {}
let s:material_dict.name = 'material'
let s:material_dict.lightlinetheme = 'material_vim'
let s:material_dict.runtime = 'true'
let s:material_dict.variant_type = 'material_theme_style'
let s:material_dict.variants = ['default', 'palenight', 'ocean', 'lighter', 'darker']

let s:materialbox_dict = {}
let s:materialbox_dict.name = 'materialbox'
let s:materialbox_dict.airlinetheme = 'colorscheme'
let s:materialbox_dict.variant_type = 'materialbox_contrast'
let s:materialbox_dict.variants = ['soft', 'medium', 'hard']

let s:minimalist_dict = {}
let s:minimalist_dict.name = 'minimalist'
let s:minimalist_dict.airlinetheme = 'colorscheme'

let s:molokai_dict = {}
let s:molokai_dict.name = 'molokai'
let s:molokai_dict.airlinetheme = 'colorscheme'

let s:monokai_dict = {}
let s:monokai_dict.name = 'monokai'
let s:monokai_dict.airlinetheme = 'colorscheme'

let s:night_owl_dict = {}
let s:night_owl_dict.name = 'night-owl'
let s:night_owl_dict.lightlinetheme = 'nightowl'
let s:night_owl_dict.airlinetheme = 'colorscheme'

let s:nord_dict = {}
let s:nord_dict.name = 'nord'
let s:nord_dict.lightlinetheme = 'colorscheme'
let s:nord_dict.airlinetheme = 'colorscheme'

let s:one_dict = {}
let s:one_dict.name = 'one'
let s:one_dict.lightlinetheme = 'colorscheme'
let s:one_dict.runtime = 'true'
let s:one_dict.airlinetheme = 'colorscheme'
let s:one_dict.variant_type = 'background'

let s:onehalf_dict = {}
let s:onehalf_dict.name = 'onehalf'
let s:onehalf_dict.comparison = 'fuzzy'
let s:onehalf_dict.lightlinetheme = 'onehalfdark'
let s:onehalf_dict.variant_type = 'colorscheme'
let s:onehalf_dict.variant_base = 'drop'
let s:onehalf_dict.variants = ['light', 'dark']

let s:pencil_dict = {}
let s:pencil_dict.name = 'pencil'
let s:pencil_dict.lightlinetheme = 'pencil_alter'
let s:pencil_dict.airlinetheme = 'colorscheme'
let s:pencil_dict.variant_type = 'background'

let s:petrel_dict = {}
let s:petrel_dict.name = 'petrel'
let s:petrel_dict.airlinetheme = 'colorscheme'

let s:plastic_dict = {}
let s:plastic_dict.name = 'plastic'
let s:plastic_dict.lightlinetheme = 'colorscheme'

let s:quantum_dict = {}
let s:quantum_dict.name = 'quantum'
let s:quantum_dict.lightlinetheme = 'colorscheme'
let s:quantum_dict.variant_type = 'background'

let s:sacredforest_dict = {}
let s:sacredforest_dict.name = 'sacredforest'
let s:sacredforest_dict.lightlinetheme = 'colorscheme'

let s:seagull_dict = {}
let s:seagull_dict.name = 'seagull'
let s:seagull_dict.airlinetheme = 'colorscheme'

let s:sialoquent_dict = {}
let s:sialoquent_dict.name = 'sialoquent'
let s:sialoquent_dict.lightlinetheme = 'colorscheme'

let s:snazzy_dict = {}
let s:snazzy_dict.name = 'snazzy'
let s:snazzy_dict.lightlinetheme = 'colorscheme'

let s:snow_dict = {}
let s:snow_dict.name = 'snow'
let s:snow_dict.lightlinetheme = 'colorscheme_bg'
let s:snow_dict.airlinetheme = 'colorscheme_bg'
let s:snow_dict.variant_type = 'background'

let s:solarized8_dict = {}
let s:solarized8_dict.name = 'solarized8'
let s:solarized8_dict.comparison = 'fuzzy'
let s:solarized8_dict.lightlinetheme = 'solarized'
let s:solarized8_dict.runtime = 'true'
let s:solarized8_dict.airlinetheme = 'colorscheme'
let s:solarized8_dict.variant_type = 'colorscheme_bg'
let s:solarized8_dict.variant_base = 'solarized8'
let s:solarized8_dict.variants = ['', '_low', '_flat', '_high']

let s:space_vim_theme_dict = {}
let s:space_vim_theme_dict.name = 'space_vim_theme'
let s:space_vim_theme_dict.lightlinetheme = 'substitutebg'
let s:space_vim_theme_dict.subpat = 'theme'
let s:space_vim_theme_dict.variant_type = 'background'

let s:spring_night_dict = {}
let s:spring_night_dict.name = 'spring-night'
let s:spring_night_dict.airlinetheme = 'colorscheme'

let s:srcery_dict = {}
let s:srcery_dict.name = 'srcery'
let s:srcery_dict.lightlinetheme = 'colorscheme'
let s:srcery_dict.airlinetheme = 'colorscheme'

let s:stellarized_dict = {}
let s:stellarized_dict.name = 'stellarized'
let s:stellarized_dict.lightlinetheme = 'colorscheme_bg'
let s:stellarized_dict.airlinetheme = 'colorscheme_bg'
let s:stellarized_dict.variant_type = 'background'

let s:stormpetrel_dict = {}
let s:stormpetrel_dict.name = 'stormpetrel'
let s:stormpetrel_dict.airlinetheme = 'colorscheme'

let s:tender_dict = {}
let s:tender_dict.name = 'tender'
let s:tender_dict.lightlinetheme = 'colorscheme'
let s:tender_dict.airlinetheme = 'colorscheme'

let s:tokyo_metro_dict = {}
let s:tokyo_metro_dict.name = 'tokyo-metro'
let s:tokyo_metro_dict.lightlinetheme = 'tokyometro'
let s:tokyo_metro_dict.airlinetheme = 'tokyometro'

let s:typewriter_dict = {}
let s:typewriter_dict.name = 'typewriter'
let s:typewriter_dict.lightlinetheme = 'typewriter_light'
let s:typewriter_dict.airlinetheme = 'colorscheme'
let s:typewriter_dict.variant_type = 'colorscheme'
let s:typewriter_dict.variant_base = 'typewriter'
let s:typewriter_dict.variants = ['', '-night']

let s:typewriter_night_dict = {}
let s:typewriter_night_dict.name = 'typewriter-night'
let s:typewriter_night_dict.lightlinetheme = 'typewriter_dark'
let s:typewriter_night_dict.airlinetheme = 'colorscheme'
let s:typewriter_night_dict.variant_type = 'colorscheme'
let s:typewriter_night_dict.variant_base = 'typewriter'
let s:typewriter_night_dict.variants = ['', '-night']

let s:undead_dict = {}
let s:undead_dict.name = 'undead'
let s:undead_dict.airlinetheme = 'colorscheme'
let s:undead_dict.variant_type = 'background'

let s:vimspectr_dict = {}
let s:vimspectr_dict.name = 'vimspectr'
let s:vimspectr_dict.comparison = 'fuzzy'
let s:vimspectr_dict.lightlinetheme = 'colorscheme'
let s:vimspectr_dict.variant_type = 'vimspectr'
let s:vimspectr_dict.variants = ['grey', '0', '30', '60', '90', '120', '150', '180', '210', '240', '270', '300', '330']

let s:vadelma_dict = {}
let s:vadelma_dict.name = 'vadelma'
let s:vadelma_dict.lightlinetheme = 'colorscheme'
let s:vadelma_dict.runtime = 'true'
let s:vadelma_dict.variant_type = 'background'

let s:zenburn_dict = {}
let s:zenburn_dict.name = 'zenburn'
let s:zenburn_dict.airlinetheme = 'colorscheme'

let g:colorscheme_map = [
         \ s:atelier_dict,
         \ s:papercolor_dict,
         \ s:afterglow_dict,
         \ s:apprentice_dict,
         \ s:atlantis_dict,
         \ s:ayu_dict,
         \ s:blayu_dict,
         \ s:candid_dict,
         \ s:corvine_dict,
         \ s:cosmic_latte_dict,
         \ s:darcula_dict,
         \ s:dark_purple_dict,
         \ s:deep_space_dict,
         \ s:desert_night_dict,
         \ s:desertink_dict,
         \ s:dracula_dict,
         \ s:edge_dict,
         \ s:flattened_dict,
         \ s:focuspoint_dict,
         \ s:foo_dict,
         \ s:forest_night_dict,
         \ s:garbage_oracle_dict,
         \ s:github_dict,
         \ s:greygull_dict,
         \ s:gruvbox_material_dict,
         \ s:horizon_dict,
         \ s:hybrid_dict,
         \ s:hybrid_material_dict,
         \ s:hybrid_reverse_dict,
         \ s:iceberg_dict,
         \ s:jellybeans_dict,
         \ s:kuroi_dict,
         \ s:material_dict,
         \ s:materialbox_dict,
         \ s:minimalist_dict,
         \ s:molokai_dict,
         \ s:monokai_dict,
         \ s:night_owl_dict,
         \ s:nord_dict,
         \ s:one_dict,
         \ s:onehalf_dict,
         \ s:pencil_dict,
         \ s:petrel_dict,
         \ s:plastic_dict,
         \ s:quantum_dict,
         \ s:sacredforest_dict,
         \ s:seagull_dict,
         \ s:sialoquent_dict,
         \ s:snazzy_dict,
         \ s:snow_dict,
         \ s:solarized8_dict,
         \ s:space_vim_theme_dict,
         \ s:spring_night_dict,
         \ s:srcery_dict,
         \ s:stellarized_dict,
         \ s:stormpetrel_dict,
         \ s:tender_dict,
         \ s:tokyo_metro_dict,
         \ s:typewriter_dict,
         \ s:typewriter_night_dict,
         \ s:undead_dict,
         \ s:vimspectr_dict,
         \ s:vadelma_dict,
         \ s:zenburn_dict
         \ ]

nmap <silent> <leader>- :<c-u>call colorschemefunctions#SchemeVariant(-v:count1)<cr>
nmap <silent> <leader>+ :<c-u>call colorschemefunctions#SchemeVariant(+v:count1)<cr>
nmap <silent> <leader>b :<c-u>call colorschemefunctions#ToggleBackground()<cr>

let g:vimspectr_light_themes = [
            \ 'vimspectr0-light'  , 'vimspectr30-light' , 'vimspectr60-light' ,
            \ 'vimspectr90-light' , 'vimspectr120-light', 'vimspectr150-light',
            \ 'vimspectr180-light', 'vimspectr210-light', 'vimspectr240-light',
            \ 'vimspectr270-light', 'vimspectr300-light', 'vimspectr330-light',
            \ 'vimspectrgrey-light'
            \ ]

let g:atelier_light_themes = [
            \ 'Atelier_CaveLight',
            \ 'Atelier_DuneLight',
            \ 'Atelier_EstuaryLight',
            \ 'Atelier_ForestLight',
            \ 'Atelier_HeathLight',
            \ 'Atelier_LakesideLight',
            \ 'Atelier_PlateauLight',
            \ 'Atelier_SavannaLight',
            \ 'Atelier_SeasideLight',
            \ 'Atelier_SulphurpoolLight',
            \ ]

let g:vimspectr_dark_themes = [
            \ 'vimspectr0-dark'  , 'vimspectr30-dark' , 'vimspectr60-dark' ,
            \ 'vimspectr90-dark' , 'vimspectr120-dark', 'vimspectr150-dark',
            \ 'vimspectr180-dark', 'vimspectr210-dark', 'vimspectr240-dark',
            \ 'vimspectr270-dark', 'vimspectr300-dark', 'vimspectr330-dark',
            \ 'vimspectrgrey-dark'
            \ ]

let g:atelier_dark_themes = [
            \ 'Atelier_CaveDark',
            \ 'Atelier_DuneDark',
            \ 'Atelier_EstuaryDark',
            \ 'Atelier_ForestDark',
            \ 'Atelier_HeathDark',
            \ 'Atelier_LakesideDark',
            \ 'Atelier_PlateauDark',
            \ 'Atelier_SavannaDark',
            \ 'Atelier_SeasideDark',
            \ 'Atelier_SulphurpoolDark',
            \ ]

let g:colorscheme_groups = {}
let g:colorscheme_groups.group1 = g:vimspectr_light_themes
let g:colorscheme_groups.group2 = g:vimspectr_dark_themes
let g:colorscheme_groups.group3 = g:atelier_light_themes
let g:colorscheme_groups.group4 = g:atelier_dark_themes
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
            \ 'greygull'                 : 'seagul',
            \ 'hybrid*'                  : 'hybrid',
            \ 'petrel'                   : 'seagull',
            \ 'solarized8*'              : 'solarized',
            \ 'stormpetrel'              : 'seagull',
            \ 'Atelier_CaveDark'         : 'Atelier_CaveDark',
            \ 'Atelier_CaveLight'        : 'Atelier_CaveLight',
            \ 'Atelier_DuneDark'         : 'Atelier_DuneDark',
            \ 'Atelier_DuneLight'        : 'Atelier_DuneLight',
            \ 'Atelier_EstuaryDark'      : 'Atelier_EstuaryDark',
            \ 'Atelier_EstuaryLight'     : 'Atelier_EstuaryLight',
            \ 'Atelier_ForestDark'       : 'Atelier_ForestDark',
            \ 'Atelier_ForestLight'      : 'Atelier_ForestLight',
            \ 'Atelier_HeathDark'        : 'Atelier_HeathDark',
            \ 'Atelier_HeathLight'       : 'Atelier_HeathLight',
            \ 'Atelier_LakesideDark'     : 'Atelier_LakesideDark',
            \ 'Atelier_LakesideLight'    : 'Atelier_LakesideLight',
            \ 'Atelier_PlateauDark'      : 'Atelier_PlateauDark',
            \ 'Atelier_PlateauLight'     : 'Atelier_PlateauLight',
            \ 'Atelier_SavannaDark'      : 'Atelier_SavannaDark',
            \ 'Atelier_SavannaLight'     : 'Atelier_SavannaLight',
            \ 'Atelier_SeasideDark'      : 'Atelier_SeasideDark',
            \ 'Atelier_SeasideLight'     : 'Atelier_SeasideLight',
            \ 'Atelier_SulphurpoolDark'  : 'Atelier_SulphurpoolDark',
            \ 'Atelier_SulphurpoolLight' : 'Atelier_SulphurpoolLight',
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

" FZF {{{
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.vim/cache/fzf-history'

autocmd! FileType fzf
autocmd FileType fzf set laststatus=0 noshowmode noruler
\ | autocmd BufLeave <buffer> set laststatus=2 showmode ruler
" }}}

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
let g:prefer_airline = 1
let g:colorscheme_file = '~/.vim/.colorscheme'

augroup StatusBarTheme
    autocmd!
    if has('patch-8.0.1777')
        autocmd ColorschemePre Atelier*Dark set background=dark
        autocmd ColorschemePre Atelier*Light set background=light
    endif
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
