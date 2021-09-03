 " vim: set sw=2 ts=2 sts=2 et tw=78 foldmarker={{{,}}} foldlevel=0 foldmethod=marker:

 let s:is_win = has('win32') || has('win64')
 let $v = $HOME.(s:is_win ? '\vimfiles' : '/.vim')

scriptencoding utf-8

set backupskip+=*_layout*.v
set backupskip+=*_gates.v
set backupskip+=*.stil
set belloff+=ctrlg
set clipboard=unnamedplus
set completeopt+=menuone,noselect
if has("patch-8.1.0360")
  set diffopt+=internal,algorithm:histogram,iwhiteall
endif
set directory=$v/cache/swap//
set grepprg=ag\ --nogroup\ --nocolor
set hidden
set hlsearch
set ignorecase
set list
set noeb vb t_vb=

" show tab and trailing spaces
" Ctrl+v, u, unicode hex code
" "
" " tab chars
" " 21E2 ⇢
" " 21E5 ⇥
" " 21E8 ⇨
" " 2192 → (rightwards arrow, &rarr;)
" " 21D2 ⇒ (rightwards double arrow, &rArr;)
" " 25B8 ▸ (TextMate style)
" "
" " trail chars
" " 25CF ●
" " 2639 ☹ (frowning face)
" " 267A ♺ (recycling symbol)
" " 261F ☟ (hand pointing down)
" " F8FF  (apple logo)
" "
" " eol chars
" " 21B2 ↲
" " 21B5 ↵ (carriage return, &crarr;)
" " 21A9 ↩
" " 23CE ⏎ (return symbol)
" " 00AC ¬ (TextMate style)

if !s:is_win
  set listchars=tab:▸\ ,eol:¬,nbsp:␣,trail:•,extends:⟩,precedes:⟨
endif
set modeline
set nojoinspaces
set noshowmode
set nowrap
set path=**
set runtimepath+=~/.fzf
set scrolloff=10
set sessionoptions=blank,buffers,curdir,folds,tabpages,winsize,globals
set shortmess+=filmnrxoOtTc
set showcmd
set showmatch
set showtabline=2
set smartcase
set splitbelow
set splitright
set tags=$PROJ_USER/rtl/tags
if !has('gui_running')
  set termguicolors
endif
if has('persistent_undo')
 set undofile
 set undolevels=1000
 set undoreload=10000
endif
set undodir=$v/cache/undo//
set updatetime=250
set viewoptions=folds,options,cursor,unix,slash
set viminfo='100,<50,s10,h,n$v/cache/viminfo
set virtualedit=onemore
set wildignore=*.swp,*.bak
set wildignore+=*/.git/**
set wildignore+=tags
set wildignore+=*.tar.*
set wildmode=list:longest

let mapleader = '\'

" Packager {{{
command! PackagerInstall call packager_init#PackagerInit() | call packager#install()
command! -bang PackagerUpdate call packager_init#PackagerInit() | call packager#update({'force_hooks': '<bang>'})
command! PackagerClean call packager_init#PackagerInit() | call packager#clean()
command! PackagerStatus call packager_init#PackagerInit() | call packager#status()
" }}}

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
noremap <leader>evi :tabedit $v/vimrc<CR>
noremap <leader>sv  :source $v/vimrc<CR>

" Timestamps
nnoremap <F6> "=strftime("%c")
inoremap <F6> <C-R>=strftime("%c")<CR>
" }}}

" Miscellaneous autocmds {{{
augroup resCur
  autocmd!
  autocmd BufWinEnter * call b_lib#ResCur()
augroup END

autocmd! FileType gitcommit setlocal spell
" }}}

autocmd! BufWinEnter *.stil set noundofile

" theme manager {{{

let g:colorscheme_file = $v . '/colorscheme'
let g:mgr_randomize_group = 1

autocmd! User InitializeMgr call mgr_init#InitializeMgrGroups()
                        \ | call mgr_init#InitializeMgr()
                        \ | doautocmd User MgrInitialized

if has('patch-8.0.1777')
  autocmd ColorschemePre Atelier*Dark set background=dark
  autocmd ColorschemePre Atelier*Light set background=light
  autocmd ColorschemePre vimspectr*dark set background=dark
  autocmd ColorschemePre vimspectr*light set background=light
else
  autocmd User ColorschemePre Atelier*Dark set background=dark
  autocmd User ColorschemePre Atelier*Light set background=light
  autocmd User ColorschemePre vimspectr*dark set background=dark
  autocmd User ColorschemePre vimspectr*light set background=light
endif
" }}}

" Airline {{{
if !s:is_win
  let g:airline_powerline_fonts                   = 1
  let g:airline#extensions#grepper#enabled        = 1
  let g:airline#extensions#tabline#enabled        = 1
  let g:airline#extensions#tabline#show_buffers   = 1
  let g:airline#extensions#tabline#show_tabs      = 1
  let g:airline#extensions#tabline#show_tab_nr    = 1
  let g:airline#extensions#tabline#tab_nr_type    = 2
  let g:airline#extensions#tabline#show_tab_count = 1
  let g:airline#extensions#tabline#show_tab_type  = 1
  let g:airline#extensions#tabline#alt_sep        = 1
  let g:airline#extensions#tabline#buffer_nr_show = 1
  let g:airline#extensions#tabline#fnamemod       = ':t'
  let g:airline#extensions#tabline#formatter      = 'unique_tail'
  let g:airline#extensions#tabline#left_sep       = ''
  let g:airline#extensions#tabline#left_alt_sep   = ''
  let g:airline#extensions#tabline#right_sep      = ''
  let g:airline#extensions#tabline#right_alt_sep  = ''
  let g:airline_left_sep                          = ''
  let g:airline_right_sep                         = ''
endif
" }}}

" buftabline {{{
let g:buftabline_numbers = 1
let g:buftabline_indicators = 1
let g:buftabline_separators = 1
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

" endwise for verilog_systemverilog {{{
autocmd! FileType verilog_systemverilog
  \ let b:endwise_addition  = '\="end" . submatch(0)' |
  \ let b:endwise_words     = 'begin,module,case,function,primitive,specify,task' |
  \ let b:endwise_pattern   = '\<\%(\zs\zebegin\|module\|case\|function\|primitive\|specify\|task\)\>.*$' |
  \ let b:endwise_syngroups = 'verilogConditional,verilogLabel,verilogStatement'
"}}}

" gitgutter {{{
let g:gitgutter_highlight_lines = 1
if has('gui_running') && !has('win64') && !has('win32')
  " Use fontawesome icons as signs
  let g:gitgutter_sign_added              = ''
  let g:gitgutter_sign_modified           = ''
  let g:gitgutter_sign_removed            = ''
  let g:gitgutter_sign_removed_first_line = ''
  let g:gitgutter_sign_modified_removed   = ''
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
let g:lightline = {
                  \ 'active' :               {
                  \                            'left' : [['mode', 'paste'],
                  \                                     ['gitgutter', 'fugitive', 'readonly', 'filename']],
                  \                            'right': [['obsession', 'lineinfo'],
                  \                                     ['percent', 'winform', 'pomodoro'],
                  \                                     ['fileformat', 'fileencoding', 'filetype', 'colorscheme']]
                  \                          },
                  \ 'component' :            {
                  \                            'charvaluehex': '0x%B',
                  \                            'lineinfo'    : ' %3l[%L]:%-2v',
                  \                            'separator'   : ''
                  \                          },
                  \ 'component_function' :   {
                  \                            'readonly'    : 'lightlinefunctions#LightlineReadonly',
                  \                            'fugitive'    : 'lightlinefunctions#LightlineFugitive',
                  \                            'gitbranch'   : 'fugitive#head',
                  \                            'modified'    : 'lightlinefunctions#LightlineModified',
                  \                            'filename'    : 'lightlinefunctions#LightlineFilename',
                  \                            'filepath'    : 'lightlinefunctions#LightlineFilepath',
                  \                            'fileformat'  : 'lightlinefunctions#LightlineFileformat',
                  \                            'filetype'    : 'lightlinefunctions#LightlineFiletype',
                  \                            'fileencoding': 'lightlinefunctions#LightlineFileencoding',
                  \                            'mode'        : 'lightlinefunctions#LightlineMode',
                  \                            'winform'     : 'lightlinefunctions#LightlineWinform',
                  \                            'colorscheme' : 'lightlinefunctions#LightlineColorscheme',
                  \                            'bufferinfo'  : 'lightline#buffer#bufferinfo',
                  \                            'gitgutter'   : 'lightlinefunctions#LightlineGitgutter',
                  \                            'pomodoro'    : 'lightlinefunctions#PomodoroStatus',
                  \                            'obsession'   : 'ObsessionStatus',
                  \                            'mucomplete'  : 'b_lib#MU'
                  \                          },
                  \ 'tabline' :              {
                  \                            'left':  [ [ 'bufferinfo' ],
                  \                                       [ 'separator' ],
                  \                                       [ 'bufferbefore', 'buffercurrent', 'bufferafter' ] ],
                  \                            'right': [ [ 'close' ] ]
                  \                          },
                  \ 'tab' :                  {
                  \                            'active'  : [ 'tabnum', 'filename', 'modified' ],
                  \                            'inactive': [ 'tabnum', 'filename', 'modified' ]
                  \                          },
                  \ 'component_expand' :     {
                  \                            'buffercurrent': 'lightline#buffer#buffercurrent',
                  \                            'bufferbefore' : 'lightline#buffer#bufferbefore',
                  \                            'bufferafter'  : 'lightline#buffer#bufferafter'
                  \                          },
                  \ 'component_type' :       {
                  \                            'buffercurrent': 'tabsel',
                  \                            'bufferbefore' : 'raw',
                  \                            'bufferafter'  : 'raw'
                  \                          },
                  \ }

if s:is_win
  let g:lightline['separator']            = { 'left': '>', 'right': '<' }
  let g:lightline['subseparator']         = { 'left': '>', 'right': '<' }
  let g:lightline['tabline_separator']    = { 'left': '>', 'right': '<' }
  let g:lightline['tabline_subseparator'] = { 'left': '>', 'right': '<' }
else
  let g:lightline['separator']            = { 'left': '', 'right': '' }
  let g:lightline['subseparator']         = { 'left': '', 'right': '' }
  let g:lightline['tabline_separator']    = { 'left': '', 'right': '' }
  let g:lightline['tabline_subseparator'] = { 'left': '', 'right': '' }
endif

let g:lightline#bufferline#min_buffer_count  = 2
let g:lightline#bufferline#enable_devicons   = 1
let g:lightline#bufferline#show_number       = 1
let g:lightline#bufferline#filename_modifier = ':t'

" lightline-buffer ui settings
" replace these symbols with ascii characters if your environment does not support unicode

let g:lightline_buffer_logo                     = ' '
let g:lightline_buffer_readonly_icon            = ''
let g:lightline_buffer_modified_icon            = '✭'
let g:lightline_buffer_expand_left_icon         = '◀ '
let g:lightline_buffer_expand_right_icon        = ' ▶'
let g:lightline_buffer_separator_icon           = '  '
let g:lightline_buffer_git_icon                 = ' '
let g:lightline_buffer_ellipsis_icon            = '..'
let g:lightline_buffer_active_buffer_left_icon  = ''
let g:lightline_buffer_active_buffer_right_icon = ''
let g:lightline_buffer_enable_devicons          = 1
let g:lightline_buffer_show_bufnr               = 1
let g:lightline_buffer_fname_mod                = ':t'
let g:lightline_buffer_maxflen                  = 30
let g:lightline_buffer_maxfextlen               = 3
let g:lightline_buffer_minflen                  = 16
let g:lightline_buffer_minfextlen               = 3
let g:lightline_buffer_reservelen               = 20

command! -nargs=1 -complete=custom,lightlinefunctions#LightlineColorschemes LightlineColorscheme
   \ call lightlinefunctions#SetLightlineColorscheme(<q-args>)
" }}}

" mucomplete {{{
let g:mucomplete#enable_auto_at_startup=1

imap <expr> <right> mucomplete#extend_fwd("\<right>")
imap <expr> <left> mucomplete#extend_bwd("\<left>")

let g:mucomplete#chains = {
                        \ 'default'              : ['snip', 'path', 'omni', 'keyn', 'dict', 'uspl'],
                        \ 'verilog_systemverilog': ['snip', 'tags', 'path', 'omni', 'keyn'],
                        \ 'vim'                  : ['snip', 'path', 'cmd', 'keyn'],
                        \ }
" }}}

" nerdtree {{{
let g:NERDTreeGitStatusIndicatorMapCustom = {
                                 \ "Modified"  : "✹",
                                 \ "Staged"    : "✚",
                                 \ "Untracked" : "✭",
                                 \ "Renamed"   : "➜",
                                 \ "Unmerged"  : "",
                                 \ "Deleted"   : "✖",
                                 \ "Dirty"     : "✗",
                                 \ "Clean"     : "✔︎",
                                 \ 'Ignored'   : '☒',
                                 \ "Unknown"   : "?"
                                 \ }
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
let g:snipMate['snippet_version'] = 1
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
nnoremap <silent> <leader> :WhichKey '\'<CR>
" }}}

"localsearch {{{
nmap <leader>/ <Plug>localsearch_toggle
" }}}

"vimwiki {{{
  let g:vimwiki_list = [{'path': '~/OneDrive/Documents/zettelkasten', 'ext':'.md', 'syntax':'markdown'}]
" }}}

" vim-zettel {{{
  let g:zettel_format = "%y%m%d-%H%M-%title"
" }}}

call matchadd('ColorColumn', '\%81v', 100)
