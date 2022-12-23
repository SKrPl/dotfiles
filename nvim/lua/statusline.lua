local theme = require('theme');

require('lualine').setup({
  theme = theme.name,
  sections = {
    lualine_c = {
      {
        'filename',
        path = 1 -- relative file path
      }
    }
  }
})
