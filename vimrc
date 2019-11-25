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

let mapleader = ','

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

source ~/.vim/colorscheme_variables.vim

nmap <silent> <leader>- :<c-u>call colorschemefunctions#SchemeVariant(-v:count1)<cr>
nmap <silent> <leader>+ :<c-u>call colorschemefunctions#SchemeVariant(+v:count1)<cr>
nmap <silent> <leader>b :<c-u>call colorschemefunctions#ToggleBackground()<cr>
nmap <silent> <leader>A :<c-u>call xolox#colorscheme_switcher#switch_to('Atelier_SeasideLight')<cr>
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
            \ 'foo*'                     : 'distinquished',
            \ 'greygull'                 : 'seagull',
            \ 'hybrid*'                  : 'hybrid',
            \ 'petrel'                   : 'seagull',
            \ 'solarized8*'              : 'solarized',
            \ 'stormpetrel'              : 'seagull',
            \ 'tokyo-metro'              : 'tokyometro',
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

" autopairs {{{
" Map space so that autopairs works with mucomplete
let g:AutoPairsMapSpace = 0
imap <silent> <expr> <space> pumvisible()
            \ ? "<space>"
            \ : "<c-r>=AutoPairsSpace()<cr>"
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
                            \         ['gitgutter', 'fugitive', 'readonly', 'filename', 'mucomplete']],
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
                                        \ 'obsession': 'ObsessionStatus',
                                        \ 'mucomplete': 'myfunctions#MU'
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
    autocmd Colorscheme borland hi! Cursor guifg=#003078 guibg=#a85700
augroup END

autocmd VimEnter * call colorschemefunctions#SetLastColorscheme()

command! -nargs=1 -complete=color Colorscheme call xolox#colorscheme_switcher#switch_to(<q-args>)
" }}}

" mucomplete {{{
if has('patch-8.0.0283')
else
    let g:AutoPairsMapCR = 0
    imap <Plug>MyCR <Plug>(MUcompleteCR)<Plug>AutoPairsReturn
    imap <cr> <Plug>MyCR
endif
let g:mucomplete#enable_auto_at_startup=1

imap <expr> <right> mucomplete#extend_fwd("\<right>")
imap <expr> <left> mucomplete#extend_bwd("\<left>") 

let g:mucomplete#chains = {
            \ 'default': ['snip', 'path', 'omni', 'keyn', 'dict', 'uspl'],
            \ 'verilog_systemverilog': ['snip', 'tags', 'path', 'omni', 'keyn', 'dict', 'uspl'],
            \ 'vim': ['snip', 'path', 'cmd', 'keyn'],
            \ }

inoremap <plug>MyEnter <cr>
imap <silent> <expr> <plug>MyCR (pumvisible()
            \ ? "\<c-y>\<plug>snipMateTrigger"
            \ : "\<plug>MyEnter<plug>AutoPairsReturn")
imap <cr> <plug>MyCR

" }}}

" peekaboo {{{
let g:peekaboo_ins_prefix = '<c-x>'
" }}}

" Rainbow {{{
let g:rainbow_active = 1
" }}}

" Snipmate {{{
imap <leader>s <Plug>snipMateNextOrTrigger
smap <leader>s <Plug>snipMateNextOrTrigger

let g:snipMate = {}
let g:snipMate['no_match_completion_feedkeys_chars'] = ''
" }}}

" System Verilog {{{
nnoremap <leader>i :VerilogFollowInstance<CR>
nnoremap <leader>I :VerilogFollowPort<CR>
nnoremap <leader>u :VerilogGotoInstanceStart<CR>
" }}}

"VerParse {{{
let g:VPPreCommand = "source /home/data/smtd_design/bin/ss brent"
" }}}

" which-key {{{
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
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
set statusline+=%{myfunctions#MU()}\ 
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
