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

    use 'rebelot/kanagawa.nvim'

    use { "lewis6991/gitsigns.nvim" }

    use { "nvim-lualine/lualine.nvim" }

    use {
        'ruifm/gitlinker.nvim',
        requires = 'nvim-lua/plenary.nvim',
    }

    use {
        "hrsh7th/nvim-cmp",
        -- event = 'InsertEnter',
        requires = {
            "hrsh7th/cmp-nvim-lsp",
            "onsails/lspkind-nvim",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-omni",
            "hrsh7th/cmp-emoji",
            "quangnguyen30192/cmp-nvim-ultisnips",
            "sirver/ultisnips",
        }
    }

    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
        "jose-elias-alvarez/null-ls.nvim",
        "folke/neodev.nvim"
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

end)
