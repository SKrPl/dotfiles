local g = vim.g
local M = {}

-- enable true colors
vim.o.termguicolors = true
vim.o.background = 'dark'

-- gruvbox config
g.gruvbox_italic = 1
g.gruvbox_contrast_dark = 'light'

M.name = 'gruvbox'

-- no Lua API to set colorscheme
vim.cmd('colorscheme ' .. M.name)

return M
