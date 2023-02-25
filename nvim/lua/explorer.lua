vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('nvim-tree').setup()

-- toggle keymap
vim.keymap.set('n', '<leader>nt', ':NvimTreeToggle<CR>')
-- find the current buffer in explorer
vim.keymap.set('n', '<leader>nf', ':NvimTreeFindFile<CR>')
