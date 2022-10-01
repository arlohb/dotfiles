local map = vim.api.nvim_set_keymap

-- Toggle nvim-tree
map("n", "<leader>n", ":NvimTreeToggle<CR>", {})

-- Toggle floating terminal
map("n", "<leader>t", ":FloatermToggle<CR>", {})
-- Quit the terminal while inside it
map("t", "<Esc>", "<C-\\><C-n><leader>t", {})

