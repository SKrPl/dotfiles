local g = vim.g
local M = {}

-- enable true colors
vim.o.termguicolors = true
vim.o.background = 'dark'

M.name = 'nord' -- theme name

-- gruvbox config
require('gruvbox').setup()

-- nord config
g.nord_cursor_line_number_background = 1
g.nord_bold_vertical_split_line = 1
g.nord_uniform_diff_background = 1

-- no Lua API to set colorscheme
vim.cmd('colorscheme ' .. M.name)

return M
