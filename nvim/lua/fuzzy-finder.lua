local telescope = require('telescope')
local builtin = require('telescope.builtin')
local keymap = vim.keymap


telescope.load_extension('fzf')

-- set keyboard mappings
keymap.set('n', '<leader>ff', builtin.find_files, {})
keymap.set('n', '<leader>fg', builtin.live_grep, {})
keymap.set('n', '<leader>fb', builtin.buffers, {})
keymap.set('n', '<leader>fh', builtin.help_tags, {})
keymap.set('n', '<leader>fs', builtin.lsp_document_symbols, {})
keymap.set('n', '<leader>fgb', builtin.git_branches, {})


