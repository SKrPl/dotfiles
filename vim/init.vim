"================================================

" Automatically add vim-plug and install all plugins
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" Specifies plugin directory
call plug#begin('~/.config/nvim/bundle')

" File tree explorer
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" Easy commenting
Plug 'scrooloose/nerdcommenter'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Neovim treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" LSP configurations
Plug 'neovim/nvim-lspconfig'

" Auto complete plugin for neovim
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
" 9000+ Snippets
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}

" Snippet engine, required for LSP auto import
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

" Display function signature for completions
Plug 'Shougo/echodoc.vim'

" Indentaion levels
Plug 'Yggdroot/indentLine'

" Fast motions in vim
Plug 'easymotion/vim-easymotion'

" Markdown viewer
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

" Git wrapper for vim
Plug 'tpope/vim-fugitive'

" Gruvbox theme
Plug 'morhetz/gruvbox'

" Nord theme
Plug 'arcticicestudio/nord-vim'

" Light and configurable statusline and tabline
Plug 'itchyny/lightline.vim'

" Initialize plugin system
call plug#end()

"================================================

" NERDCommenter configuration

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

"================================================

" Neovim tree

nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>

"================================================

" Nerd commenter

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'


"================================================

" Telescope configurations

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>

"================================================

" COQ auto completion
let g:coq_settings = { 'auto_start': v:true }

"================================================

" Native LSP

lua << EOF

local nvim_lsp = require('lspconfig')
local coq = require('coq')

local opts = { noremap=true, silent=true }

vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

    -- workspace mappings
    buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
end

-- Diagnostic configuration
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    -- Disable virtual_text
    virtual_text = false
  }
)

-- LSP server configurations
local servers = { 'pyright', 'clangd', 'gopls', 'tsserver' }

for _, lsp in pairs(servers) do
    nvim_lsp[lsp].setup(coq.lsp_ensure_capabilities({
    -- default lsp configuration
    -- nvim_lsp[lsp].setup({
        on_attach = on_attach,
        flags = {
            debounce_text_changes = 150,
        }
    -- })
    }))
end

EOF

"================================================

" Neovim treesitter

lua << EOF
require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true
    },
    incremental_selection = {
        enabled = true
    },
    indent = {
        enabled = true
    },
}
EOF

"================================================

" Indentline configuration

let g:indentLine_setColors = 0
let g:indentLine_char = '┆'
set list lcs=tab:\┆\ 

"================================================

" Theme

" Truecolors
set termguicolors

let g:gruvbox_italic = 1
let g:gruvbox_contrast_dark= 'light'
set background=dark

colorscheme gruvbox
" colorscheme nord

"================================================

" Lightline showing git branch name
let g:lightline = {
    \ 'colorscheme': 'gruvbox',
    \ 'component_expand': {
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
    \   'gitbranch': 'FugitiveHead',
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

" Use unicode glyphs for status
"   " spinner
"   " info
"   " exclamation-triangle
"   " ban
"   " check-square

"================================================

" Neovim python3 host prog
let g:python3_host_prog = '/home/siddhant/Applications/miniconda3/envs/neovim/bin/python'

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

" Show effect of command incrementally
if has('nvim')
    set inccommand=split
endif

" Shows matching commands in command mode when TAB is pressed
set wildmenu

" Always show the signcolumn so that it doesn't distract due to LSP diagnostic
" set signcolumn=yes

" VIM modes are only shown in lightline
set noshowmode

" Disable modeline
set nomodeline

" Highlights current row
set cursorline

" Shows number of string matches
set shortmess-=S

" folding
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldcolumn=1 " 1 column in sign column to indicate folding
set foldlevelstart=99 " all the folds are opened when a buffer is opened

" auto reloading of file as soon as it changes in disk
set autoread

" Enable local configuration
set exrc
set secure

" Show default (neov)vim info when IndentLine is enabled
" https://github.com/Yggdroot/indentLine/issues/315
autocmd VimEnter * if bufname('%') == '' | IndentLinesDisable | endif

" Indentation
autocmd FileType html,css,javascript,json,jsonc setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
autocmd FileType vim setlocal tabstop=4 expandtab shiftwidth=4 softtabstop=2
autocmd FileType markdown setlocal tabstop=4 expandtab shiftwidth=4 softtabstop=4
autocmd FileType lua setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2

" Format JSON
com! FormatJSON %!python3 -m json.tool

" Paste from clipboard
inoremap <leader>pc <ESC>"+pi
nnoremap <leader>pc "+p
