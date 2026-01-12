local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('ellisonleao/gruvbox.nvim')
Plug('hrsh7th/nvim-cmp')
Plug('hrsh7th/cmp-nvim-lsp')

vim.call('plug#end')

vim.o.background = "dark"
vim.cmd('colorscheme gruvbox')

local cmp = require('cmp')
local cmp_nvim_lsp = require('cmp_nvim_lsp')

cmp.setup({
  mapping = cmp.mapping.preset.insert(),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'buffer' },
  }),
})

-- === LSP Setup (built-in API, no nvim-lspconfig) ===
local capabilities = cmp_nvim_lsp.default_capabilities()

vim.lsp.config['clangd'] = {
  cmd = {
    'clangd',
    '--header-insertion=never',
    '--query-driver=/usr/bin/clang*',
    '--include-directory=/usr/include/SDL2',
  },
  filetypes = { 'c', 'cpp', 'objc', 'objcpp' },
  capabilities = capabilities,
}

-- Automatically start clangd for C/C++ files
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'c', 'cpp', 'objc', 'objcpp' },
  callback = function()
    vim.lsp.start(vim.lsp.config['clangd'])
  end,
})
