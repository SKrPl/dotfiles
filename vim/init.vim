"================================================

" Specifies plugin directory
call plug#begin('~/.config/nvim/bundle')

" File tree explorer
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" Easy commenting
Plug 'scrooloose/nerdcommenter'

" fzf: Fuzzy file search
Plug 'junegunn/fzf.vim'

" File structure: functions, methods, classes
Plug 'majutsushi/tagbar'

" Language client neovim
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" Asynchronous completion framework
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins', 'tag': '5.1' }

" Python autocomplete
Plug 'deoplete-plugins/deoplete-jedi'

" Clang autocomplete
Plug 'zchee/deoplete-clang'

" Java autocomplete
Plug 'artur-shaik/vim-javacomplete2'

" JS autocomplete
Plug 'carlitux/deoplete-ternjs'

" Indentaion levels
Plug 'Yggdroot/indentLine'

" Git gutter
Plug 'airblade/vim-gitgutter'

" Asynchronous lint engine
Plug 'dense-analysis/ale'

" Manages 'tags' file
Plug 'ludovicchabant/vim-gutentags'

" Fast motions in vim
Plug 'easymotion/vim-easymotion'

" Markdown viewer
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

" Git wrapper for vim
Plug 'tpope/vim-fugitive'

" Gruvbox theme
Plug 'morhetz/gruvbox'

" Ayu theme
Plug 'ayu-theme/ayu-vim'

" Light and configurable statusline and tabline
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale' " ALE errors, warnings in lightline

" Initialize plugin system
call plug#end()

"================================================

" NERDCommenter configuration

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

"================================================

" fzf 

let g:fzf_colors = {
      \ 'fg':      ['fg', 'Normal'],
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
      \ 'header':  ['fg', 'Comment']
      \ }

nnoremap <C-p> :Files<CR>

"================================================

" Neovim language client
let g:LanguageClient_autoStart = 1

" TODO: Add LSP Server configs

"================================================

" Use deoplete
let g:deoplete#enable_at_startup = 1

" deoplete omni functions
let g:deoplete#omni#functions= {}
let g:deoplete#omni#functions.java = 'javacomplete#Complete' " Java autocomplete

" Python autocomplete
let g:python3_host_prog = '/usr/bin/python3'
let g:python_host_prog = '/usr/bin/python2'
let g:deoplete#sources#jedi#show_docstring = 1

" Clang autocomplete
let g:deoplete#sources#clang#libclang_path = '/usr/lib64/libclang.so.8'
let g:deoplete#sources#clang#clang_header = '/usr/lib64/clang'

" Java autocomplete
" autocmd FileType java setlocal omnifunc=javacomplete#Complete

" JS autocomplete
let g:deoplete#sources#ternjs#docs = 1

"================================================

" Indentline configuration

let g:indentLine_setColors = 0
let g:indentLine_char = '┆'
set list lcs=tab:\┆\ 

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

" vim-gutentags
let g:gutentags_file_list_command = 'rg --files'
let g:gutentags_cache_dir = '~/.cache/gutentags'
set statusline+=%{gutentags#statusline()}

"================================================

" Markdown composer
let g:markdown_composer_browser = 'firefox'

"================================================

" Gruvbox theme

" Truecolors
set termguicolors

" let g:gruvbox_italic = 1
" let g:gruvbox_contrast_dark= 'light'
" set background=dark

let ayucolor = "mirage"
colorscheme ayu

"================================================

" Lightline showing git branch name
let g:lightline = {
    \ 'colorscheme': 'ayu',
    \ 'component_expand': {
    \       'linter_checking': 'lightline#ale#checking',
    \       'linter_warnings': 'lightline#ale#warnings',
    \       'linter_errors': 'lightline#ale#errors',
    \       'linter_ok': 'lightline#ale#ok',
    \ },
    \ 'component_type': {
    \       'linter_checking': 'left',
    \       'linter_warnings': 'warning',
    \       'linter_errors': 'error',
    \       'linter_ok': 'left',
    \ },
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
    \   'right': [ [ 'linter_checking', 'linter_warnings', 'linter_errors', 'linter_ok'],
    \             [ 'lineinfo' ],
    \             [ 'percent' ],
    \             [ 'fileformat', 'fileencoding', 'filetype'] ],
    \ },
    \ 'component_function': {
    \   'gitbranch': 'fugitive#head'
    \ },
  \ }

let g:lightline#ale#indicator_checking = "\uf110  "
let g:lightline#ale#indicator_warnings = "\uf071 "
let g:lightline#ale#indicator_errors = "\uf05e "
let g:lightline#ale#indicator_ok = "\uf00c  "

"================================================

filetype plugin indent on

" Line number
set number
set relativenumber

" Automatically wrap lines
set wrap

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

" Highlights current row
set cursorline

" Updatetime for faster Tagbar update
set updatetime=400

" Shows number of string matches
set shortmess-=S

" folding method
" set foldmethod=syntax

" auto reloading of file as soon as it changes in disk
set autoread

" Enable local configuration
set exrc
set secure

" Indentation
autocmd FileType html,css,javascript setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
autocmd FileType vim setlocal tabstop=4 expandtab shiftwidth=2 softtabstop=2

" Format JSON
com! FormatJSON %!python -m json.tool

" Paste from clipboard
inoremap <leader>pc <ESC>"+pi
nnoremap <leader>pc "+p
