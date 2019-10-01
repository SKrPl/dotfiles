"================================================

" Specifies plugin directory
call plug#begin('~/.config/nvim/bundle')

" File tree explorer
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" Easy commenting
Plug 'scrooloose/nerdcommenter'

" Editor Config
Plug 'editorconfig/editorconfig-vim'

" fzf: Fuzzy file search
Plug 'junegunn/fzf.vim'

" File structure: functions, methods, classes
Plug 'majutsushi/tagbar'

" Asynchronous completion framework
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins', 'tag': '5.1' }

" Python auto-complete
Plug 'deoplete-plugins/deoplete-jedi'

" JS autocomplete
Plug 'carlitux/deoplete-ternjs'

" Indentaion levels
Plug 'Yggdroot/indentLine'

" Asynchronous lint engine
Plug 'dense-analysis/ale'

" Manages 'tags' file
Plug 'ludovicchabant/vim-gutentags'

"  Git gutter
Plug 'airblade/vim-gitgutter'

" Git wrapper for vim
Plug 'tpope/vim-fugitive'

" Fast motions in vim
Plug 'easymotion/vim-easymotion'

" Dev icons
" Plug 'ryanoasis/vim-devicons'

" Track the engine.
Plug 'SirVer/ultisnips'

" Any fold
Plug 'pseewald/vim-anyfold'

" Markdown viewer
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

" Snippets are separated from the engine. Add this if you want them:
" Plug 'honza/vim-snippets'

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

" Insatlled using brew
set rtp+=/usr/local/opt/fzf

nnoremap <C-p> :Files<CR>

"================================================

" Tagbar

"================================================

" Util snippets config

let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<c-l>"
let g:UltiSnipsJumpBackwardTrigger = "<c-h>"

"================================================

" Use deoplete
let g:deoplete#enable_at_startup = 1

" Python auto-complete
let g:python3_host_prog = '/miniconda3/envs/neovim/bin/python'
let g:deoplete#sources#jedi#show_docstring = 1

" JS auto-complete
let g:deoplete#sources#ternjs#tern_bin = '/Users/siddhant/.nvm/versions/node/v10.16.0/bin/tern'
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

" Navigate through errors
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" Fix lint errors
let g:ale_fixers = {
    \ 'javascript': ['eslint']
    \ }

" ALE language specific linters
let g:ale_linters = {
    \ 'javascript': ['eslint']
    \ }

"================================================

" vim-gutentags

let g:gutentags_file_list_command = {
      \ 'markers': {
      \ '.git': 'git ls-files',
      \ '.hg': 'hg files',
      \ },
    \ }

let g:gutentags_cache_dir = '~/.local/share/gutentags'

"================================================

" Vim any-fold

autocmd FileType * AnyFoldActivate
set foldlevel=99

"================================================

" Markdown preview

let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 0
let g:mkdp_refresh_slow = 0

"================================================

" Gruvbox theme

" Truecolors
set termguicolors

let g:gruvbox_italic = 1
let g:gruvbox_contrast_dark= 'light'
set background=dark
colorscheme gruvbox

" let ayucolor='mirage'
" colorscheme ayu

"================================================

" Lightline showing git branch name

let g:lightline = {
    \ 'colorscheme': 'gruvbox',
    \ 'component_expand': {
    \       'linter_checking': 'lightline#ale#checking',
    \       'linter_warnings': 'lightline#ale#warnings',
    \       'linter_errors': 'lightline#ale#errors',
    \       'linter_ok': 'lightline#ale#ok'
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
let g:lightline#ale#indicator_warnings = "\uf071  "
let g:lightline#ale#indicator_errors = "\uf05e  "
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
autocmd FileType markdown,html,css,javascript setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
autocmd FileType json,yaml setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
autocmd FileType vim setlocal tabstop=4 expandtab shiftwidth=2 softtabstop=2

" Format JSON
com! FormatJSON %!python -m json.tool

" Paste from clipboard
inoremap <leader>pc <ESC>"+pi
nnoremap <leader>pc "+p
