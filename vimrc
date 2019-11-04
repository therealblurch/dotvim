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
noremap <leader>ev :tabedit ~/.vim/vimrc<CR>
noremap <leader>sv :source ~/.vim/vimrc<CR>

" Timestamps
nnoremap <F6> "=strftime("%c")
inoremap <F6> <C-R>=strftime("%c")<CR>
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

nmap <leader>- :<c-u>call colorschemefunctions#SchemeVariant(-v:count1)<cr>
nmap <leader>+ :<c-u>call colorschemefunctions#SchemeVariant(+v:count1)<cr>
" }}}

" Airline {{{
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

let g:default_status_is_airline = 1

function! LoadAirlineEnabled()
    let s:load_airline = 0
    if g:default_status_is_airline
        if exists('g:loaded_lightline') "Lightline is already loaded
            let s:load_airline = 0
        else
            let s:load_airline = 1
        endif
    else
        if hase('gui_running') && !exists(g:loaded_airline)
            let s:load_airline = 0
        else
            let s:load_airline = 1
        endif
    endif
    return s:load_airline
endfunction

augroup AirlineTheme
    autocmd!
    autocmd ColorScheme * if exists('g:loaded_airline') | call colorschemefunctions#AirlineTheme(g:colors_name) | endif
augroup END

autocmd Colorscheme afterglow         if !exists('g:loaded_lightline') | PackAdd vim-airline | endif
autocmd Colorscheme apprentice        if LoadAirlineEnabled() | PackAdd vim-airline | endif
autocmd Colorscheme ayu               if LoadAirlineEnabled() | PackAdd vim-airline | endif
autocmd Colorscheme cosmic_latte      if LoadAirlineEnabled() | PackAdd vim-airline | endif
autocmd Colorscheme deep-space        if LoadAirlineEnabled() | PackAdd vim-airline | endif
autocmd Colorscheme desertink         if !exists('g:loaded_lightline') | PackAdd vim-airline | endif
autocmd Colorscheme dracula           if LoadAirlineEnabled() | PackAdd vim-airline | endif
autocmd Colorscheme greygull          if !exists('g:loaded_lightline') | PackAdd vim-airline | AirlineTheme seagull | endif
autocmd Colorscheme gruvbox-material  if LoadAirlineEnabled() | PackAdd vim-airline | endif
autocmd Colorscheme iceberg           if LoadAirlineEnabled() | PackAdd vim-airline | endif
autocmd Colorscheme jellybeans        if LoadAirlineEnabled() | PackAdd vim-airline | endif
autocmd Colorscheme materialbox       if !exists('g:loaded_lightline') | PackAdd vim-airline | endif
autocmd Colorscheme nord              if LoadAirlineEnabled() | PackAdd vim-airline | endif
autocmd Colorscheme one               if LoadAirlineEnabled() | PackAdd vim-airline | endif
autocmd Colorscheme onehalfdark       if LoadAirlineEnabled() | PackAdd vim-airline | endif
autocmd Colorscheme onehalflight      if LoadAirlineEnabled() | PackAdd vim-airline | endif
autocmd Colorscheme pencil            if LoadAirlineEnabled() | PackAdd vim-airline | endif
autocmd Colorscheme petrel            if !exists('g:loaded_lightline') | PackAdd vim-airline | AirlineTheme seagull | endif
autocmd Colorscheme seagull           if !exists('g:loaded_lightline') | PackAdd vim-airline | endif
autocmd Colorscheme snow              if LoadAirlineEnabled() | PackAdd vim-airline | endif
autocmd Colorscheme srcery            if LoadAirlineEnabled() | PackAdd vim-airline | endif
autocmd Colorscheme stellarized       if LoadAirlineEnabled() | PackAdd vim-airline | endif
autocmd Colorscheme tender            if LoadAirlineEnabled() | PackAdd vim-airline | endif
autocmd Colorscheme stormpetrel       if !exists('g:loaded_lightline') | PackAdd vim-airline | AirlineTheme seagull | endif
autocmd Colorscheme typewriter        if LoadAirlineEnabled() | PackAdd vim-airline | endif
autocmd Colorscheme typewriter-night  if LoadAirlineEnabled() | PackAdd vim-airline | endif
" }}}

"Color Scheme Switcher {{{
let g:colorscheme_switcher_exclude_builtins = 1
" let g:colorscheme_switcher_keep_background = 1

let g:colorscheme_manager_global_last = 1
let g:colorscheme_manager_file = '~/.vim/.colorscheme'
let g:colorscheme_manager_remember_background = 1
let g:colorscheme_manager_start_random = 0
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
   autocmd ColorScheme * if exists('g:loaded_airline') | call lightlinefunctions#LightlineUpdate() | endif
augroup END

" Commands to automatically load airline or lightline on colorscheme change.
autocmd Colorscheme apprentice        if !LoadAirlineEnabled() | PackAdd lightline.vim | call lightlinefunctions#LightlineUpdate() | endif
autocmd Colorscheme ayu               if !LoadAirlineEnabled() | PackAdd lightline.vim | call lightlinefunctions#LightlineUpdate() | endif
autocmd Colorscheme cosmic_latte      if !LoadAirlineEnabled() | PackAdd lightline.vim | call lightlinefunctions#LightlineUpdate() | endif
autocmd Colorscheme deep-space        if !LoadAirlineEnabled() | PackAdd lightline.vim | call lightlinefunctions#LightlineUpdate() | endif
autocmd Colorscheme darcula           if has('gui_running') && !exists('g:loaded_airline') | PackAdd lightline.vim | call lightlinefunctions#LightlineUpdate() | endif
autocmd Colorscheme dracula           if !LoadAirlineEnabled() | PackAdd lightline.vim | call lightlinefunctions#LightlineUpdate() | endif
autocmd Colorscheme gruvbox-material  if !LoadAirlineEnabled() | PackAdd lightline.vim | call lightlinefunctions#LightlineUpdate() | endif
autocmd Colorscheme iceberg           if !LoadAirlineEnabled() | PackAdd lightline.vim | call lightlinefunctions#LightlineUpdate() | endif
autocmd Colorscheme jellybeans        if !LoadAirlineEnabled() | PackAdd lightline.vim | call lightlinefunctions#LightlineUpdate() | endif
autocmd Colorscheme material          if has('gui_running') && !exists('g:loaded_airline') | PackAdd lightline.vim | call lightlinefunctions#LightlineUpdate() | endif
autocmd Colorscheme night-owl         if has('gui_running') && !exists('g:loaded_airline') | PackAdd lightline.vim | call lightlinefunctions#LightlineUpdate() | endif
autocmd Colorscheme nord              if !LoadAirlineEnabled() | PackAdd lightline.vim | call lightlinefunctions#LightlineUpdate() | endif
autocmd Colorscheme onehalfdark       if !LoadAirlineEnabled() | PackAdd lightline.vim | call lightlinefunctions#LightlineUpdate() | endif
autocmd Colorscheme onehalflight      if !LoadAirlineEnabled() | PackAdd lightline.vim | call lightlinefunctions#LightlineUpdate() | endif
autocmd Colorscheme one               if !LoadAirlineEnabled() | PackAdd lightline.vim | call lightlinefunctions#LightlineUpdate() | endif
autocmd Colorscheme pencil            if !LoadAirlineEnabled() | PackAdd lightline.vim | call lightlinefunctions#LightlineUpdate() | endif
autocmd Colorscheme snazzy            if has('gui_running') && !exists('g:loaded_airline') | PackAdd lightline.vim | call lightlinefunctions#LightlineUpdate() | endif
autocmd Colorscheme snow              if !LoadAirlineEnabled() | PackAdd lightline.vim | call lightlinefunctions#LightlineUpdate() | endif
autocmd Colorscheme space_vim_theme   if has('gui_running') && !exists('g:loaded_airline') | PackAdd lightline.vim | call lightlinefunctions#LightlineUpdate() | endif
autocmd Colorscheme srcery            if !LoadAirlineEnabled() | PackAdd lightline.vim | call lightlinefunctions#LightlineUpdate() | endif
autocmd Colorscheme stellarized       if !LoadAirlineEnabled() | PackAdd lightline.vim | call lightlinefunctions#LightlineUpdate() | endif
autocmd Colorscheme tender            if !LoadAirlineEnabled() | PackAdd lightline.vim | call lightlinefunctions#LightlineUpdate() | endif
autocmd Colorscheme typewriter        if !LoadAirlineEnabled() | PackAdd lightline.vim | call lightlinefunctions#LightlineUpdate() | endif
autocmd Colorscheme typewriter-night  if !LoadAirlineEnabled() | PackAdd lightline.vim | call lightlinefunctions#LightlineUpdate() | endif
autocmd Colorscheme vadelma           if has('gui_running') && !exists('g:loaded_airline') | PackAdd lightline.vim | call lightlinefunctions#LightlineUpdate() | endif

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
set statusline+=%{lightlinefunctions#LightlineGitgutter()}
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
