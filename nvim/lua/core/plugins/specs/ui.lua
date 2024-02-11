return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
        opts = function()
            return {
                options = {
                    theme = "auto",
                    globalstatus = true,
                    disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" }},
                },
                sections = {
                    lualine_a = {
                        "mode"
                    },
                    lualine_b = {
                        "branch"
                    }
                }
            }
        end
    }
}
