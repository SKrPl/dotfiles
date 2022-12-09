local defaults = {
  max_chars = '80',
  expandtab = true,
}

local indent_config = {
  [2] = {
    tabstop = 2,
    shiftwidth = 2,
    softtabstop = 2
  },
  [4] = {
    tabstop = 4,
    shiftwidth = 4,
    softtabstop = 4
  }
}

local filetype_config = {
  lua = {
    indentation_style = 2,
    max_chars = '80',
  },
  javascript = {
    indentation_style = 2,
    max_chars = '100',
  },
  html = {
    indentation_style = 2,
    max_chars = '100',
  },
  css = {
    indentation_style = 2,
    max_chars = '100',
  },
  json = {
    indentation_style = 2,
    max_chars = '100',
  },
  jsonc = {
    indentation_style = 2,
    max_chars = '100',
  },
  vim = {
    indentation_style = 2,
    max_chars = '100',
  },
  markdown = {
    indentation_style = 4,
    max_chars = '100',
  },
  python = {
    indentation_style = 4,
    max_chars = '79',
  },
  java = {
    indentation_style = 4,
    max_chars = '100',
  },
  c = {
    indentation_style = 4,
    max_chars = '80',
    expandtab = false,
  },
}

-- create an autocommand for each file type
for filetype, config in pairs(filetype_config) do
  -- get indentation style of a file extension/language i.e. 2/4 columns
  local indentation_config = indent_config[config.indentation_style]

  vim.api.nvim_create_autocmd('FileType', {
    pattern = filetype,
    callback = function()
      local setlocal = vim.opt_local

      -- apply each indentation config
      for command, value in pairs(indentation_config) do
        setlocal[command] = value
      end

      setlocal.expandtab = config.expandtab or defaults.expandtab
      setlocal.colorcolumn = config.max_chars or defaults.max_chars

    end
  })
end

