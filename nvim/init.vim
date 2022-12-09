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
Plug 'nvim-tree/nvim-tree.lua'

" Icons
Plug 'kyazdani42/nvim-web-devicons' 

" Easy commenting
Plug 'scrooloose/nerdcommenter'

" Fuzzy finder
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

" Ultra fold neovim
Plug 'kevinhwang91/promise-async'
Plug 'kevinhwang91/nvim-ufo'

" Indentaion levels
Plug 'lukas-reineke/indent-blankline.nvim'

" Fast motions in vim
Plug 'easymotion/vim-easymotion'

" Markdown viewer
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

" Git wrapper for vim
Plug 'tpope/vim-fugitive'

" Git integrations for buffers
Plug 'lewis6991/gitsigns.nvim'

" Gruvbox theme
Plug 'morhetz/gruvbox'

" Light and configurable statusline and tabline
Plug 'nvim-lualine/lualine.nvim'

" Initialize plugin system
call plug#end()

"================================================

lua << EOF

-- load lua configs
require('explorer') -- file explorer, nvim-tree
require('editor')
require('commenter') -- nerd commenter
require('fuzzy-finder') -- telescope
require('indentline') -- indent blankline
require('theme')
require('statusline') -- lua line
require('autocomplete') -- LSP and coq_nvim
require('nvim-ts') -- treesitter

-- ultra fold neovim
-- should be called after lsp and tree-sitter setup
require('ufo').setup()
require('gitsigns').setup()

require('filetype-configs') -- file extension specific indentation
require('keybindings') -- custom keybindings

EOF

" Format JSON
" com! FormatJSON %!python3 -m json.tool
