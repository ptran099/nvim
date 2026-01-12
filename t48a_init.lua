local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

-- Shorthand notation for GitHub; translates to https://github.com/junegunn/seoul256.vim.git
Plug('junegunn/seoul256.vim')

Plug('ellisonleao/gruvbox.nvim')

-- Any valid git URL is allowed
Plug('https://github.com/junegunn/vim-easy-align.git')

-- Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug('fatih/vim-go', { ['tag'] = '*' })

-- Using a non-default branch
Plug('neoclide/coc.nvim', { ['branch'] = 'release' })

-- Use 'dir' option to install plugin in a non-default directory
Plug('junegunn/fzf', { ['dir'] = '~/.fzf' })

-- Post-update hook: run a shell command after installing or updating the plugin
Plug('junegunn/fzf', { ['dir'] = '~/.fzf', ['do'] = './install --all' })

-- Post-update hook can be a lambda expression
Plug('junegunn/fzf', { ['do'] = function()
  vim.fn['fzf#install']()
end })

-- If the vim plugin is in a subdirectory, use 'rtp' option to specify its path
Plug('nsf/gocode', { ['rtp'] = 'vim' })

-- On-demand loading: loaded when the specified command is executed
Plug('preservim/nerdtree', { ['on'] = 'NERDTreeToggle' })

-- On-demand loading: loaded when a file with a specific file type is opened
Plug('tpope/vim-fireplace', { ['for'] = 'clojure' })

-- Unmanaged plugin (manually installed and updated)
Plug('~/my-prototype-plugin')

vim.call('plug#end')

-- Color schemes should be loaded after plug#end().
-- We prepend it with 'silent!' to ignore errors when it's not yet installed.
-- vim.cmd('silent! colorscheme seoul256')

vim.o.background = "dark"
vim.cmd('colorscheme gruvbox')
vim.o.number = true
vim.o.tabstop = 4 -- number of spaces a tab represents
vim.o.shiftwidth = 4 -- number of spaces for each indent

-- Check if clangd is available
if vim.fn.executable("clangd") == 1 then
  vim.api.nvim_create_autocmd("FileType", {
    pattern = { "c", "cpp" },
    callback = function()
      -- Start clangd LSP manually
      vim.lsp.start({
        name = "clangd",
        cmd = { "clangd" },
        root_dir = vim.fn.getcwd(),
        filetypes = { "c", "cpp" },
      })
    end,
  })
end


-- Enable LSP for C (using clangd)
--[[
vim.api.nvim_create_autocmd('FileType', {
	pattern = { 'c', 'cpp' },
	callback = function()
    
	local lspconfig = require('lspconfig')
    lspconfig.clangd.setup(
	{
		cmd = { "clangd" },
		filetypes = { "c", "cpp", "objc", "objcpp" },
		root_dir = lspconfig.util.root_pattern("compile_commands.json", ".git"),
		on_attach = function(client, bufnr)
		-- Optional keymaps
		local buf_map = function(mode, lhs, rhs)
      		vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, { noremap=true, silent=true })
    	end

		buf_map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
    	buf_map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
    	buf_map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
    	buf_map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
  		end,
	}
	)
  end,
})
]]--
