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

    use { "ellisonleao/gruvbox.nvim" }

    use { "lewis6991/gitsigns.nvim" }


end)
