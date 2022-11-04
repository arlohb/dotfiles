local wk = require("which-key")

-- Documentation is here:
-- https://github.com/folke/which-key.nvim
wk.register({
    ["<leader>"] = {
        f = {
            name = "+file",
            f = {"<cmd>Telescope find_files<cr>", "Find File"},
            r = {"<cmd>Telescope oldfiles<cr>", "Recent Files"},
        },

        s = {
            name = "+search",
            s = {"<cmd>Telescope live_grep<cr>", "Live Grep"},
            c = {"<cmd>Telescope commands<cr>", "Commands"},
        },

        w = {
            name = "+window",
            h = {"<cmd>vsplit<cr>", "Split Horizontal"},
            v = {"<cmd>split<cr>", "Split Vertical"},
            d = {"<cmd>close<cr>", "Close"},
        },

        l = {
            name = "+lsp",
            a = {"<cmd>call CocActionAsync('codeAction', 'cursor')<cr>", "Code Action"},
            r = {"<cmd>call CocActionAsync('rename')<cr>", "Rename"},
        },

        n = {"<cmd>NvimTreeToggle<cr>", "Toggle NvimTree"},

        t = {"<cmd>FloatermToggle<cr>", "Toggle Terminal"},
    },

    -- Moving between windows
    ["<C-h>"] = {"<C-w>h", "Go Left"},
    ["<C-l>"] = {"<C-w>l", "Go Right"},
    ["<C-j>"] = {"<C-w>j", "Go Down"},
    ["<C-k>"] = {"<C-w>k", "Go Up"},

    -- Quit the terminal while inside it
    ["<Esc>"] = {"<cmd>FloatermToggle<cr>", "Quit Terminal", mode = "t"},

    -- Comment the current line
    ["-"] = {"<cmd>Commentary<CR>", "Comment Line"},
    -- Comment the current selection
    ["-"] = {":'<,'>Commentary<CR>", "Comment Line", mode = "v"},

    -- Goto definition
    gd = {"<cmd>call CocActionAsync('jumpDefinition')<cr>", "Goto Definition"},
    -- Show documentation
    K = {"<cmd>call CocActionAsync('doHover')<cr>", "Show Documentation"},
})

