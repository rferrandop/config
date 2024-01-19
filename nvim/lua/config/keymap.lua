local function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("n", "<leader>pv", ":Ex<CR>", nil)
map("n", "<C-s>", ":w<CR>", nil)

map("n", "<leader>ff", ":Telescope git_files<CR>", nil)
map("n", "<leader>fa", ":Telescope find_files<CR>", nil)
map("n", "<leader>fsd", ":Telescope lsp_document_symbols<CR>", nil)
map("n", "<leader>fsa", ":Telescope lsp_dynamic_workspace_symbols<CR>", nil)
map("n", "<leader>fso", ":SymbolsOutlineOpen<CR>", nil)
map("n", "<leader>b", ":Telescope buffers<CR>", nil)
map("n", "<leader>`", ":Telescope project<CR>", nil)
map("n", "<leader>t", ":Telescope<CR>", nil)
map("n", "<leader>c", ":Telescope commands<CR>", nil)

map("n", "<C-l>", '<C-w>l', nil)
map("n", "<C-h>", '<C-w>h', nil)
map("n", "<C-j>", '<C-w>j', nil)
map("n", "<C-k>", '<C-w>k', nil)
