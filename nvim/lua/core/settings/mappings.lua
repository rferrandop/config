local function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("n", "<leader>pv", ":Ex<CR>", nil)
map("n", "<C-s>", ":w<CR>", nil)

-- Move between splits
map("n", "<C-l>", '<C-w>l', nil)
map("n", "<C-h>", '<C-w>h', nil)
map("n", "<C-j>", '<C-w>j', nil)
map("n", "<C-k>", '<C-w>k', nil)

-- Telescope
map("n", "<leader>pf", ':lua require("telescope.builtin").find_files({ hidden = true })<CR>', nil)
map("n", "<leader>ff", ':lua require("telescope.builtin").git_files({ hidden = true })<CR>', nil)
map("n", "<leader>pg", ':lua require("telescope.builtin").live_grep()<CR>', nil)
