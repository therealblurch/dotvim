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
set nowrap
set path=**
set runtimepath+=~/.vim/plug/onehalf/vim
set sessionoptions=blank,buffers,curdir,folds,tabpages,winsize,globals
set shortmess+=filmnrxoOtTc
set showmatch
if !exists(':AirlineTheme') && !exists('lightline#update')
    set showmode
endif
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

let mapleader = ','

" General maps to make life easier {{{
" Visual Shifting
vnoremap < <gv
vnoremap > >gv
" }}}

" Colorscheme Options {{{

"ayu Possible Values: light| dark | mirage
let ayucolor="light"
let g:ayucolor=ayucolor

nmap <leader>- :<c-u>call colorschemefunctions#SchemeVariant(-v:count1)<cr>
nmap <leader>+ :<c-u>call colorschemefunctions#SchemeVariant(+v:count1)<cr>
" }}}

" Airline {{{
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

augroup AirlineTheme
    autocmd!
    autocmd ColorScheme * if exists(":AirlineTheme") | call colorschemefunctions#AirlineTheme(g:colors_name) | endif
augroup END

autocmd Colorscheme afterglow         if !exists('g:loaded_lightline') | PackAdd vim-airline | endif
autocmd Colorscheme apprentice        if !has('gui_running') && !exists('g:loaded_lightline') | PackAdd vim-airline | endif
autocmd Colorscheme ayu               if !has('gui_running') && !exists('g:loaded_lightline') | PackAdd vim-airline | endif
autocmd Colorscheme cosmic_latte      if !exists('g:loaded_lightline') | PackAdd vim-airline | endif
autocmd Colorscheme dracula           if !has('gui_running') && !exists('g:loaded_lightline') | PackAdd vim-airline | endif
autocmd Colorscheme greygull          if !exists('g:loaded_lightline') | PackAdd vim-airline | AirlineTheme seagull | endif
autocmd Colorscheme gruvbox-material  if !has('gui_running') && !exists('g:loaded_lightline') | PackAdd vim-airline | endif
autocmd Colorscheme iceberg           if !has('gui_running') && !exists('g:loaded_lightline') | PackAdd vim-airline | endif
autocmd Colorscheme jellybeans        if !has('gui_running') && !exists('g:loaded_lightline') | PackAdd vim-airline | endif
autocmd Colorscheme materialbox       if !exists('g:loaded_lightline') | PackAdd vim-airline | endif
autocmd Colorscheme nord              if !has('gui_running') && !exists('g:loaded_lightline') | PackAdd vim-airline | endif
autocmd Colorscheme one               if !has('gui_running') && !exists('g:loaded_lightline') | PackAdd vim-airline | endif
autocmd Colorscheme onehalfdark       if !has('gui_running') && !exists('g:loaded_lightline') | PackAdd vim-airline | endif
autocmd Colorscheme onehalflight      if !has('gui_running') && !exists('g:loaded_lightline') | PackAdd vim-airline | endif
autocmd Colorscheme petrel            if !exists('g:loaded_lightline') | PackAdd vim-airline | AirlineTheme seagull | endif
autocmd Colorscheme seagull           if !exists('g:loaded_lightline') | PackAdd vim-airline | endif
autocmd Colorscheme snow              if !has('gui_running') && !exists('g:loaded_lightline') | PackAdd vim-airline | endif
autocmd Colorscheme tender            if !has('gui_running') && !exists('g:loaded_lightline') | PackAdd vim-airline | endif
autocmd Colorscheme stormpetrel       if !exists('g:loaded_lightline') | PackAdd vim-airline | AirlineTheme seagull | endif
autocmd Colorscheme typewriter        if !has('gui_running') && !exists('g:loaded_lightline') | PackAdd vim-airline | endif
autocmd Colorscheme typewriter-night  if !has('gui_running') && !exists('g:loaded_lightline') | PackAdd vim-airline | endif
" }}}

"Color Scheme Switcher {{{
let g:colorscheme_switcher_exclude_builtins = 1
" let g:colorscheme_switcher_keep_background = 1

let g:colorscheme_manager_global_last = 1
let g:colorscheme_manager_file = '~/.vim/.colorscheme'
let g:colorscheme_manager_remember_background = 1
let g:colorscheme_manager_start_random = 0
" }}}

" flagship {{{
autocmd User Flags call Hoist("global", "myfunctions#CurrentColorscheme")
autocmd User Flags call Hoist("buffer", "myfunctions#GitgutterStatus")
autocmd User Flags call Hoist("global", "ObsessionStatus")
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
                            \          ['percent', 'winform'],
                            \          ['fileformat', 'fileencoding', 'filetype', 'colorscheme']]
                            \ }
   if has('win32') || has('win64')
        let g:lightline.component = {
                                       \ 'charvaluehex': '0x%B',
                                       \ 'lineinfo': '%3l[%L]:%-2v',
                                       \ 'separator': ''
                                       \ }
    else
        let g:lightline.component = {
                                       \ 'charvaluehex': '0x%B',
                                       \ 'lineinfo': ' %3l[%L]:%-2v',
                                       \ 'separator': ''
                                       \ }
   endif
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
                                        \ 'obsession': 'ObsessionStatus'
                                        \ }
   if !has('win32') && !has('win64')
        let g:lightline.separator = {
                                    \ 'left': '',
                                    \ 'right': ''
                                    \ }
        let g:lightline.subseparator = {
                                       \ 'left': '',
                                       \ 'right': ''
                                       \ }
   endif
   let g:lightline.tabline = {
                             \ 'left': [ [ 'bufferinfo' ],
                             \           [ 'separator' ],
                             \           [ 'bufferbefore', 'buffercurrent', 'bufferafter' ] ],
                             \ 'right': [ [ 'close' ] ]
                             \ }
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

if !has('win64') && !has('win32')
    let g:lightline_buffer_logo = ' '
    let g:lightline_buffer_readonly_icon = ''
    let g:lightline_buffer_modified_icon = '✭'
    let g:lightline_buffer_expand_left_icon = '◀ '
    let g:lightline_buffer_expand_right_icon = ' ▶'
    let g:lightline_buffer_separator_icon = '  '
    let g:lightline_buffer_git_icon = ' '
else
    let g:lightline_buffer_logo = ''
    let g:lightline_buffer_readonly_icon = ''
    let g:lightline_buffer_modified_icon = '*'
    let g:lightline_buffer_expand_left_icon = ''
    let g:lightline_buffer_expand_right_icon = ''
    let g:lightline_buffer_separator_icon = '|'
    let g:lightline_buffer_git_icon = ''
endif
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

augroup LightlineColorscheme
   autocmd!
autocmd Colorscheme material          if has('gui_running') && !exists(":AirlineTheme") | PackAdd lightline.vim | call lightlinefunctions#LightlineUpdate() | endif
   autocmd ColorScheme * call lightlinefunctions#LightlineUpdate()
augroup END

" Commands to automatically load airline or lightline on colorscheme change.
autocmd Colorscheme apprentice        if has('gui_running') && !exists(":AirlineTheme") | PackAdd lightline.vim | call lightlinefunctions#LightlineUpdate() | endif
autocmd Colorscheme ayu               if has('gui_running') && !exists(":AirlineTheme") | PackAdd lightline.vim | call lightlinefunctions#LightlineUpdate() | endif
autocmd Colorscheme cosmic_latte      if has('gui_running') && !exists(":AirlineTheme") | PackAdd lightline.vim | call lightlinefunctions#LightlineUpdate() | endif
autocmd Colorscheme dracula           if has('gui_running') && !exists(":AirlineTheme") | PackAdd lightline.vim | call lightlinefunctions#LightlineUpdate() | endif
autocmd Colorscheme gruvbox-material  if has('gui_running') && !exists(":AirlineTheme") | PackAdd lightline.vim | call lightlinefunctions#LightlineUpdate() | endif
autocmd Colorscheme iceberg           if has('gui_running') && !exists(":AirlineTheme") | PackAdd lightline.vim | call lightlinefunctions#LightlineUpdate() | endif
autocmd Colorscheme jellybeans        if has('gui_running') && !exists(":AirlineTheme") | PackAdd lightline.vim | call lightlinefunctions#LightlineUpdate() | endif
autocmd Colorscheme material          if has('gui_running') && !exists(":AirlineTheme") | PackAdd lightline.vim | call lightlinefunctions#LightlineUpdate() | endif
autocmd Colorscheme night-owl         if has('gui_running') && !exists(":AirlineTheme") | PackAdd lightline.vim | call lightlinefunctions#LightlineUpdate() | endif
autocmd Colorscheme nord              if has('gui_running') && !exists(":AirlineTheme") | PackAdd lightline.vim | call lightlinefunctions#LightlineUpdate() | endif
autocmd Colorscheme onehalfdark       if has('gui_running') && !exists(":AirlineTheme") | PackAdd lightline.vim | call lightlinefunctions#LightlineUpdate() | endif
autocmd Colorscheme onehalflight      if has('gui_running') && !exists(":AirlineTheme") | PackAdd lightline.vim | call lightlinefunctions#LightlineUpdate() | endif
autocmd Colorscheme one               if has('gui_running') && !exists(":AirlineTheme") | PackAdd lightline.vim | call lightlinefunctions#LightlineUpdate() | endif
autocmd Colorscheme snazzy            if has('gui_running') && !exists(":AirlineTheme") | PackAdd lightline.vim | call lightlinefunctions#LightlineUpdate() | endif
autocmd Colorscheme snow              if has('gui_running') && !exists(":AirlineTheme") | PackAdd lightline.vim | call lightlinefunctions#LightlineUpdate() | endif
autocmd Colorscheme space_vim_theme   if has('gui_running') && !exists(":AirlineTheme") | PackAdd lightline.vim | call lightlinefunctions#LightlineUpdate() | endif
autocmd Colorscheme tender            if has('gui_running') && !exists(":AirlineTheme") | PackAdd lightline.vim | call lightlinefunctions#LightlineUpdate() | endif
autocmd Colorscheme typewriter        if has('gui_running') && !exists(":AirlineTheme") | PackAdd lightline.vim | call lightlinefunctions#LightlineUpdate() | endif
autocmd Colorscheme typewriter-night  if has('gui_running') && !exists(":AirlineTheme") | PackAdd lightline.vim | call lightlinefunctions#LightlineUpdate() | endif
autocmd Colorscheme vadelma           if has('gui_running') && !exists(":AirlineTheme") | PackAdd lightline.vim | call lightlinefunctions#LightlineUpdate() | endif

command! -nargs=1 -complete=custom,lightlinefunctions#LightlineColorschemes LightlineColorscheme
   \ call lightlinefunctions#SetLightlineColorscheme(<q-args>)
" }}}

" mucomplete {{{
if has('patch-8.0.0283')
else
    imap <Plug>MyCR <Plug>(MUcompleteCR)
    imap <cr> <Plug>MyCR
endif
let g:mucomplete#enable_auto_at_startup=1
" }}}

" Rainbow {{{
au VimEnter *.sv RainbowToggleOn
au VimEnter *.v RainbowToggleOn
" }}}

" System Verilog {{{
nnoremap <leader>i :VerilogFollowInstance<CR>
nnoremap <leader>I :VerilogFollowPort<CR>
nnoremap <leader>u :VerilogGotoInstanceStart<CR>
" }}}
