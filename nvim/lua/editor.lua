local o = vim.o
local g = vim.g

g.python3_host_prog = '/home/siddhant/Applications/python-venv/neovim/bin/python3'

-- enable local configurations if any
o.exrc = true
o.secure = true

-- line number
o.number = true
o.relativenumber = true

-- automatically wrap lines
o.wrap = true

-- show matching brackets
o.showmatch = true

-- incremental search
o.incsearch = true
o.inccommand = 'split'

-- show matching command in command mode when TAB is pressed
o.wildmenu = true

-- VIM modes are only shown in statusbar (lightline)
o.showmode = false

-- disable modeline
o.modeline = false

-- higlight current row
o.cursorline = true

-- show number of string matches
-- o.shortmess, _  = string.gsub(o.shortmess, 'S', '') -- Lua way
vim.opt.shortmess:remove('S') -- Neovim Lua API way

-- folding options
o.foldcolumn = '1'
o.foldlevel = 99
o.foldlevelstart = 99
