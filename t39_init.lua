--[[
-- Peter Tran's Definitive Neovim Configuration File
-- ]]
local vim = vim
local plug = vim.fn['plug#']

--[[
-- Plugin repositories
-- ]]
vim.call('plug#begin')
plug('ellisonleao/gruvbox.nvim')
vim.call('plug#end')

--[[
-- Commands
-- ]]
vim.cmd('colorscheme gruvbox')
