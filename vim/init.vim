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

" requires
" Plug 'kyazdani42/nvim-tree.lua'
" Plug 'kyazdani42/nvim-web-devicons' " for file icons

" Easy commenting
Plug 'scrooloose/nerdcommenter'

" fzf: Fuzzy file search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Neovim treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Rice Native LSP UI
Plug 'glepnir/lspsaga.nvim'

" LSP configurations
Plug 'neovim/nvim-lspconfig'

" Auto complete plugin for neovim
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'

" Snippet engine, required for LSP auto import
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

" Display function signature for completions
Plug 'Shougo/echodoc.vim'

" Indentaion levels
Plug 'Yggdroot/indentLine'

" Asynchronous lint engine
" Plug 'dense-analysis/ale'

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
Plug 'maximbaz/lightline-ale' " ALE errors, warnings in lightline

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
nnoremap <leader>bu :Buffers<CR>

"================================================

" Native LSP

lua << EOF

local nvim_lsp = require('lspconfig')
local saga = require 'lspsaga'

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua require("lspsaga.hover").render_hover_doc()<CR>', opts)
  buf_set_keymap('n', '<C-f>', '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(1)<CR>', opts)
  buf_set_keymap('n', '<C-b>', '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(-1)<CR>', opts)
  -- buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

-- Diagnostic configuration
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    -- Disable virtual_text
    virtual_text = false
  }
)

-- The nvim-cmp almost supports LSP's capabilities. So you should advertise it to LSP servers..
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- LSP saga configuration
saga.init_lsp_saga {
  use_saga_diagnostic_sign = true,
  error_sign = ' ', -- ban
  warn_sign = ' ', -- exclamation-triangle
  hint_sign = ' ', -- lightbulb
  infor_sign = ' ', -- info
  dianostic_header_icon = '   '
}

-- LSP server configurations
nvim_lsp.pyright.setup {
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  }
}

nvim_lsp.clangd.setup {
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  }
}

nvim_lsp.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  flags = {
    debounce_text_changes = 150,
  }
}

nvim_lsp.efm.setup {
  on_attach = on_attach,
  filetypes = {
    "python",
    -- "go"
  },
  init_options = {
    documentFormatting = true,
    codeAction = true
  },
  settings = {
    languages = {
      python = {
        {
          lintCommand = "flake8 --stdin-display-name ${INPUT} -",
          lintStdin = true,
          lintFormats = { "%f:%l:%c: %m" },
        },
        {
          formatCommand = "isort --quiet -",
          formatStdin = true
        },
        {
          formatCommand = "black -l 79 --quiet -",
          formatStdin = true
        }
      },
      -- go = {
      --   {
      --     lintCommand = "errcheck",
      --     lintStdin = true,
      --     lintFormats = { "%f:%l:%c: %m" },
      --   },
      -- }
    }
  }
}

EOF

"================================================

" Neovim treesitter

lua << EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true
  },
  incremental_selection = {
    enabled = false
  },
  indent = {
    enabled = true
  },
}
EOF

"================================================

" Nvim Cmp (for autocompletion)

set completeopt=menu,menuone,noselect

lua <<EOF
  local cmp = require('cmp')

  cmp.setup {
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` user.
      end,
    },
    mapping = {
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    -- You should specify your *installed* sources.
    sources = {
      { name = 'buffer' },
      { name = 'nvim_lsp' },
    },

    preselect = cmp.PreselectMode.None
  }
EOF

"================================================

" Echodoc

let g:echodoc#enable_at_startup = 1

"================================================

" Indentline configuration

let g:indentLine_setColors = 0
let g:indentLine_char = '┆'
set list lcs=tab:\┆\ 

"================================================

" ALE : Asynchronous Lint Engine

" Display message format
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" Disable linters, LSP is used for linting for these languages 
let g:ale_linters = {
    \   'python': [],
    \   'cpp': []
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
" colorscheme nord

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

" Use unicode glyphs for status
let g:lightline#ale#indicator_checking = "  " " spinner
let g:lightline#ale#indicator_infos = "  " " info
let g:lightline#ale#indicator_warnings = "  " " exclamation-triangle
let g:lightline#ale#indicator_errors = "  " " ban
let g:lightline#ale#indicator_ok = "  " " check-square

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
autocmd FileType html,css,javascript setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
autocmd FileType vim setlocal tabstop=4 expandtab shiftwidth=4 softtabstop=2
autocmd FileType markdown setlocal tabstop=4 expandtab shiftwidth=4 softtabstop=4
autocmd FileType lua setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2

" Format JSON
com! FormatJSON %!python3 -m json.tool

" Paste from clipboard
inoremap <leader>pc <ESC>"+pi
nnoremap <leader>pc "+p

" capitalize the word
inoremap <leader><c-u> <esc>bveUea
nnoremap <leader><c-u> bveUe
