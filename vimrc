" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={{{,}}} foldlevel=0 foldmethod=marker:

runtime OPT autopac.vim

set hlsearch
set ignorecase
set smartcase
if has('persistent_undo')
   set undofile
   set undolevels=1000
   set undoreload=10000
endif
set wildmode=longest:full
set directory=~/.vim/cache/swap
set undodir=~/.vim/cache/undo
set list
if !has('win64') && !has('win32')
    set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨
endif
if !has('gui_running')
    set termguicolors
endif
set completeopt+=menuone,noselect

let mapleader = ','

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

" flagship {{{
autocmd User Flags call Hoist("global", "myfunctions#CurrentColorscheme")
autocmd User Flags call Hoist("buffer", "myfunctions#GitgutterStatus")
" }}}

" System Verilog {{{
nnoremap <leader>i :VerilogFollowInstance<CR>
nnoremap <leader>I :VerilogFollowPort<CR>
nnoremap <leader>u :VerilogGotoInstanceStart<CR>
" }}}

" mucomplete {{{
if has('patch-8.0.0283')
else
    imap <Plug>MyCR <Plug>(MUcompleteCR)
    imap <cr> <Plug>MyCR
endif
" }}}

" Airline {{{
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

autocmd Colorscheme nord              PackAdd vim-airline
" }}}

"Color Scheme Switcher {{{
let g:colorscheme_switcher_exclude_builtins = 1
" let g:colorscheme_switcher_keep_background = 1

let g:colorscheme_manager_global_last = 1
let g:colorscheme_manager_file = '~/.vim/.colorscheme'
let g:colorscheme_manager_remember_background = 1
let g:colorscheme_manager_start_random = 0
" }}}
