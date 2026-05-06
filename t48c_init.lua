--[[
-- Peter Tran's Definitive Neovim Configuration File
-- Tested for: NVIM v0.12.1
-- ]]
local vim = vim
local plug = vim.fn['plug#']

--[[
-- Plugin repositories
-- ]]
vim.call('plug#begin')
plug('ellisonleao/gruvbox.nvim') -- default true-color mode
plug('joshdick/onedark.vim') -- default 256-color mode
vim.call('plug#end')

--[[
-- Commands
-- ]]
vim.cmd('colorscheme onedark')
vim.cmd('set tabstop=4')
