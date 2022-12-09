local treesitter_config = require('nvim-treesitter.configs');

treesitter_config.setup({
  highlight = { enable = true },
  incremental_selection = { enable = true },
  indent = { enable = true },
})
