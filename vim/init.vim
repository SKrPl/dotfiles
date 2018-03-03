"================================================

" Specifies plugin directory
call plug#begin('~/.config/nvim/bundle')

" File tree explorer
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Ctrl-P: Fuzzy file search
Plug 'kien/ctrlp.vim'

" Asynchronous completion framework
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Python auto-complete
Plug 'zchee/deoplete-jedi'

" Clang auto-complete
Plug 'zchee/deoplete-clang'

" Java auto-complete
Plug 'artur-shaik/vim-javacomplete2'

" Light and configurable statusline and tabline
Plug 'itchyny/lightline.vim'

" Git branch in lightline
Plug 'itchyny/vim-gitbranch'

" Initialize plugin system
call plug#end()

"================================================

" Use deoplete
let g:deoplete#enable_at_startup = 1

" Python auto-complete
let g:python3_host_prog = '/usr/bin/python3'
let g:python_host_prog = '/usr/bin/python2.7'

" Clang auto-complete
let g:deoplete#sources#clang#libclang_path = '/usr/lib64/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/lib64/clang/5.0.1/'

" Java auto-complete
autocmd FileType java setlocal omnifunc=javacomplete#Complete

"================================================

" Lightline showing git branch name
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }

"================================================

" Syntax highlighting
syntax on

filetype plugin indent on

" Line number
set number

" Matching brackets
set showmatch

" Incremental search
set incsearch

" Shows matching commands in command mode when TAB is pressed
set wildmenu

