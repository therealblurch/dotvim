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

let mapleader = ','

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
