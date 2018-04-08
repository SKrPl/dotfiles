"================================================

" Specifies plugin directory
call plug#begin('~/.config/nvim/bundle')

" File tree explorer
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" Ctrl-P: Fuzzy file search
Plug 'kien/ctrlp.vim'

" Asynchronous completion framework
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Python auto-complete
Plug 'zchee/deoplete-jedi'

" Clang auto-complete
Plug 'zchee/deoplete-clang'

" Java auto-complete
Plug 'artur-shaik/vim-javacomplete2', { 'for': 'java' }

" Asynchronous lint engine
Plug 'w0rp/ale'

" Code folding
Plug 'pseewald/vim-anyfold'

" Gruvbox theme
Plug 'morhetz/gruvbox'

" Light and configurable statusline and tabline
Plug 'itchyny/lightline.vim'
" Git branch in lightline
Plug 'itchyny/vim-gitbranch'
" ALE errors, warnings in lightline
" Plug 'maximbaz/lightline-ale'

" Initialize plugin system
call plug#end()

"================================================

" Ctrl-P
" Ignore custom files
let g:ctrlp_custom_ignore = 'git'

"================================================

" Use deoplete
let g:deoplete#enable_at_startup = 1

" Python auto-complete
let g:python3_host_prog = '/usr/bin/python3'
let g:python_host_prog = '/usr/bin/python2.7'
let g:deoplete#sources#jedi#show_docstring = 1

" Clang auto-complete
let g:deoplete#sources#clang#libclang_path = '/usr/lib64/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/lib64/clang/5.0.1/'

" Java auto-complete
autocmd FileType java setlocal omnifunc=javacomplete#Complete

"================================================

" ALE : Asynchronous Lint Engine

" Lint only after saving file
" let g:ale_lint_on_text_changed = 'never'

" Don't lint when the file is opened
" let g:ale_lint_on_enter = 0

" Display message format
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" Navigating through errors
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

"================================================

" Anyfold : Folding settings
let anyfold_activate = 1
set foldlevel=10
set foldnestmax=10

"================================================

" Gruvbox theme

" Truecolors
set termguicolors

let g:gruvbox_italic = 1
set background=dark
colorscheme gruvbox

"================================================

" Lightline showing git branch name
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
      \             [ 'percent' ],
      \             [ 'fileformat', 'fileencoding', 'filetype'] ],
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }

"================================================
filetype plugin indent on

" Line number
set number

" Matching brackets
set showmatch

" Incremental search
set incsearch

" Shows matching commands in command mode when TAB is pressed
set wildmenu

" VIM modes are only shown in lightline
set noshowmode

" Disable modeline
set nomodeline

" auto reloading of file as soon as it changes in disk
set autoread

" Enable local configuration
set exrc
set secure

" Generate tags file for ctags
map <F5> :!ctags -R $pwd<CR><CR>

" Indentation for html, css and js
autocmd FileType html,css,js setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2

