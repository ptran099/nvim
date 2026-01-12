local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('ellisonleao/gruvbox.nvim')
Plug('junegunn/seoul256.vim')
Plug('hrsh7th/nvim-cmp')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('nvim-treesitter/nvim-treesitter')

vim.call('plug#end')

vim.o.background = "dark"
vim.cmd('colorscheme gruvbox')
vim.cmd('set tabstop=4')
vim.cmd('set shiftwidth=4')

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

local clangd_config = {
  name = 'clangd',
  cmd = {
    'clangd',
    '--header-insertion=never',
    '--query-driver=/usr/bin/clang*',
  },
  filetypes = { 'c', 'cpp', 'objc', 'objcpp' },
  root_dir = vim.fs.dirname(vim.fs.find({'.git', 'compile_commands.json'}, { upward = true })[1] or vim.api.nvim_buf_get_name(0)),
  capabilities = capabilities,
}

-- Automatically start clangd for C/C++ files, only if not already running
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'c', 'cpp', 'objc', 'objcpp' },
  callback = function()
    local clients = vim.lsp.get_clients({bufnr = bufnr,})
    for _, client in pairs(clients) do
      if client.name == 'clangd' then
        return
      end
    end
    vim.lsp.start(clangd_config)
  end,
})
