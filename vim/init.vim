"================================================

" Specifies plugin directory
call plug#begin('~/.config/nvim/bundle')

" File tree explorer
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" Easy commenting
Plug 'scrooloose/nerdcommenter'

" fzf: Fuzzy file search
Plug 'junegunn/fzf', { 'dir': '~/.config/nvim/bundle/fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

" Language pack
Plug 'sheerun/vim-polyglot'

" Floating window for completion preview
Plug 'ncm2/float-preview.nvim'

" Language client neovim
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" Asynchronous completion framework
Plug 'Shougo/deoplete.nvim'

" Indentaion levels
Plug 'Yggdroot/indentLine'

" Asynchronous lint engine
Plug 'dense-analysis/ale'

" Fast motions in vim
Plug 'easymotion/vim-easymotion'

" Markdown viewer
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

" Git wrapper for vim
Plug 'tpope/vim-fugitive'

" Gruvbox theme
Plug 'morhetz/gruvbox'

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

" LSP Server configs
let g:LanguageClient_serverCommands = {
    \ 'cpp' : ['clangd-9', '-background-index'],
    \ 'c' : ['clangd-9', '-background-index'],
    \ 'python': ['~/Applications/anaconda3/envs/neovim/bin/pyls']
    \ }

set hidden

" keymaps
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>

"================================================

" Use deoplete
let g:deoplete#enable_at_startup = 1

set completeopt-=preview

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

" Disable linters, LSP is used for linting for these languages 
let g:ale_linters = {
    \   'c': [],
    \   'cpp': [],
    \   'python': []
    \}

" Navigating through errors
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

"================================================

" Gruvbox theme

" Truecolors
set termguicolors

let g:gruvbox_italic = 1
let g:gruvbox_contrast_dark= 'light'
set background=dark

colorscheme gruvbox

"================================================

" Lightline showing git branch name
let g:lightline = {
    \ 'colorscheme': 'gruvbox',
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
    \   'gitbranch': 'fugitive#head',
    \   'filename': 'LightlineFilename'
    \ },
\ }

" relative path of a file
function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

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
autocmd FileType vim setlocal tabstop=4 expandtab shiftwidth=4 softtabstop=2
autocmd FileType markdown setlocal tabstop=4 expandtab shiftwidth=4 softtabstop=4

" Format JSON
com! FormatJSON %!python -m json.tool

" Paste from clipboard
inoremap <leader>pc <ESC>"+pi
nnoremap <leader>pc "+p
