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
require('ufo').setup();
require('gitsigns').setup()

require('filetype-configs') -- file extension specific indentation
require('keybindings') -- custom keybindings
