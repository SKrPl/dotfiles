local g = vim.g
local M = {}

-- enable true colors
vim.o.termguicolors = true
vim.o.background = 'light'

M.name = 'gruvbox'

require('gruvbox').setup()

-- no Lua API to set colorscheme
vim.cmd('colorscheme ' .. M.name)

return M
