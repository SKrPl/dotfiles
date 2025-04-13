local g = vim.g
local M = {}

-- enable true colors
vim.o.termguicolors = true
vim.o.background = 'dark'

M.name = 'catppuccin-frappe' -- theme name

-- gruvbox config
require('gruvbox').setup()

-- nord config
g.nord_contrast = true
g.nord_uniform_diff_background = true
g.nord_borders = true

require('nord').set()

-- no Lua API to set colorscheme
vim.cmd('colorscheme ' .. M.name)

return M
