local nvim_lsp = require('lspconfig')
local null_ls = require('null-ls')

vim.g.coq_settings = { auto_start = true } -- to be called before importing coq
local coq = require('coq')

local servers = {
  'pyright',
  'clangd',
  'gopls',
  'tsserver',
  'vimls',
  'sumneko_lua'
}

local opts = { noremap = true, silent = true }

-- diagnostic mapping
-- See `:help vim.diagnostic.*` for documentation
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local function on_attach(client, bufnr)
  local buf_opts = { buffer = bufnr, noremap = true, silent = true }

  -- TODO: enable in neovim 8.0
  --[[local async_format = function()
    vim.lsp.buf.format { async = true }
  end ]]

  local list_workspace_folders = function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end

  -- See `:help vim.lsp.*` for documentation
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, buf_opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, buf_opts)
  vim.keymap.set('n', '<space>d', vim.lsp.buf.type_definition, buf_opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, buf_opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, buf_opts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, buf_opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, buf_opts)

  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, buf_opts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, buf_opts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, buf_opts)

  -- workspace mappings
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, buf_opts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, buf_opts)
  vim.keymap.set('n', '<space>wl', list_workspace_folders, buf_opts)
end

-- Diagnostic configuration
vim.diagnostic.config({ virtual_text = false })

-- TODO: Use a different configuration for specifc language servers
local default_config = {
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  },
  foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
  }
}

-- setup server for languages
for _, lsp in pairs(servers) do
  nvim_lsp[lsp].setup(coq.lsp_ensure_capabilities(default_config))
end


-- diagnostics & code actions in LSP
null_ls.setup({
  sources = {
    -- javascript
    null_ls.builtins.diagnostics.eslint,

    -- python
    null_ls.builtins.diagnostics.flake8,
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.isort,
  },
})
