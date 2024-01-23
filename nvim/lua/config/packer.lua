local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
    print("Installing packer close and reopen Neovim...")
    vim.cmd([[packadd packer.nvim]])
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

return packer.startup(function(use)
    -- Packer can manage itself
    use "wbthomason/packer.nvim"

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate' -- useful to update in case of new version
    }
    use 'nvim-treesitter/nvim-treesitter-context'

    use "folke/tokyonight.nvim"

    use { "lewis6991/gitsigns.nvim" }

    use {
        "nvim-lualine/lualine.nvim",
    }

    use {
        'ruifm/gitlinker.nvim',
        requires = 'nvim-lua/plenary.nvim',
    }

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    }

    use "mfussenegger/nvim-jdtls"

    use {
        "nvim-telescope/telescope.nvim",
        requires = {
            {'nvim-lua/popup.nvim'},
            {'nvim-lua/plenary.nvim'},
            {'nvim-telescope/telescope-fzf-native.nvim', run="make"},
            {'nvim-telescope/telescope-symbols.nvim'},
        }
    }

    use 'ThePrimeagen/harpoon'

end)
