local treesitter_config = require('nvim-treesitter.configs');

treesitter_config.setup({
  ensure_installed = {
    "c",
    "query",
    "lua",
    "vim",
    "vimdoc",

    "cpp",
    "python",
    "javascript",
    "markdown",
    "markdown_inline"
  },
  highlight = { enable = true },
  incremental_selection = { enable = true },
  indent = { enable = false },
})
