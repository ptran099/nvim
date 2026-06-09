--[[
-- Peter Tran's Definitive Neovim Configuration File
-- Tested for: NVIM v0.12.1
-- [:] + [tab] drop-down is native NVIM feature
-- ]]
local vim = vim
local plug = vim.fn['plug#']

--[[
-- Plugin repositories
-- ]]
vim.call('plug#begin')
plug('ellisonleao/gruvbox.nvim') -- default true-color mode
plug('joshdick/onedark.vim') -- default 256-color mode (macos no true-color support)
plug('hrsh7th/nvim-cmp') -- completion engine, completion engine needs snippet engine
plug('L3MON4D3/LuaSnip') -- snippet engine, snippet engine needs snippet sources
vim.call('plug#end')

--[[
-- Plugin settings
-- ]]

--[[
-- Commands
-- ]]
vim.cmd('colorscheme onedark')
vim.cmd('set tabstop=4')
vim.cmd('set shiftwidth=4') -- number of spaces when I press tab
