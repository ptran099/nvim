# Description
An attempt at unifying my nvim config across all my development machines.

# Dependencies
Requires prior installation of vim-plug from https://github.com/junegunn/vim-plug

# Installation:
To download the configs seamlessly, change directory to:
    cd ~/.config
Then clone the repository:
    git clone https://github.com/ptran099/nvim.git

To use the configs, enter in terminal in the path ~/.config/nvim:
    ln -s <lua config of choice> init.lua
or
    ln -s <vim config of choice> init.vim

To delete the symlink:
    rm init.lua/init.vim


# Details:
    t48a_init.lua has error and warning highlights
        Version: NVIM v0.11.x
        Plugins:
    t48b_init.lua has LSP but no autocomplete
        Version: NVIM v0.11.x
        Plugins:
    t48c_init.lua is barebones and only accumulates plugins as needed
        Version: NVIM v0.12.1
        Plugins:
            ellisonleao/gruvbox
            joshdick/onedark.vim
        Settings:
            colorscheme onedark

    t31a_init.lua
        Version: NVIM v0.11.x
        Plugins:
            ellisonleao/gruvbox.nvim
            hrsh7th/nvim-cmp
            hrsh7th/cmp-nvim-lsp

    t44a_init.vim supports autocomplete, lspconfig deprecated error
        Plugins:
            gruvbox

