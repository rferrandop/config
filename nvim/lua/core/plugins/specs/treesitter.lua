return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = { "BufReadPost", "BufWritePost", "BufNewFile", "VeryLazy" },
        config = function(_, opts)
            require('nvim-treesitter.configs').setup({
                ensure_isntalled = {},
                sync_install = false,
                auto_install = true,
                highlight = {
                    enable = true,
                }
            })
        end
    }
}
