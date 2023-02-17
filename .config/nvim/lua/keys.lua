-- Documentation is here:
-- https://github.com/folke/which-key.nvim
require("which-key").register({
    ["<leader>"] = {
        ["<leader>"] = { "<cmd>Telescope find_files<cr>", "Find File" },
        [":"] = { "<cmd>Telescope commands<cr>", "Commands" },

        f = {
            name = "+file",
            f = { "<cmd>Telescope find_files<cr>", "Find File" },
            r = { "<cmd>Telescope oldfiles<cr>", "Recent Files" },
            p = { "<cmd>Telescope project<cr>", "Projects" },
        },

        s = {
            name = "+search",
            s = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Search File" },
            p = { "<cmd>Telescope live_grep<cr>", "Search Project" },
            ["["] = { "<cmd>Telescope resume<cr>", "Resume Search" },
            e = { "<cmd>Telescope symbols<cr>", "Emojis" },
            h = { "<cmd>Telescope help_tags<cr>", "Help Pages" },
            m = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
            c = { "<cmd>Telescope colorscheme<cr>", "Colourscheme" },
            r = { "<cmd>Telescope registers<cr>", "Registers" },
            k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
        },

        w = {
            name = "+window",
            h = { "<cmd>vsplit<cr>", "Split Horizontal" },
            v = { "<cmd>split<cr>", "Split Vertical" },
        },

        c = {
            name = "+code",
            a = { vim.lsp.buf.code_action, "Code Action" },
            r = { vim.lsp.buf.rename, "Rename" },
            R = { "<cmd>Telescope lsp_references<cr>", "References" },
            i = { "<cmd>Telescope lsp_implementations<cr>", "Implementations" },
            s = { "<cmd>Telescope lsp_document_symbols<cr>", "Symbols" },
            S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Project Symbols" },
            d = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
        },

        g = {
            name = "+git",
            d = { "<cmd>Gitsigns diffthis<cr>", "Diff" },
            s = { "<cmd>Telescope git_status<cr>", "Status" },
            S = { "<cmd>Telescope git_stash<cr>", "Stashes" },
            c = { "<cmd>Telescope git_commits<cr>", "Commits" },
            C = { "<cmd>Telescope git_bcommits<cr>", "File Commits" },
            b = { "<cmd>Telescope git_branches<cr>", "Branches" },
            a = { "<cmd>Gitsigns stage_hunk<cr>", "Stage" },
            u = { "<cmd>Gitsigns undo_stage_hunk<cr>", "Undo Stage" },
            p = { "<cmd>Gitsigns preview_hunk<cr>", "Preview" },
        },

        o = {
            name = "+open",
            p = { "<cmd>NvimTreeToggle<cr>", "File Tree" },
            t = { "<cmd>FloatermToggle<cr>", "Terminal" },
            s = { "<cmd>Vista!!<cr>", "Symbols" },
            l = { "<cmd>Lazy<cr>", "Lazy" },
            m = { "<cmd>Mason<cr>", "Mason" },
        },

        d = {
            name = "+debug",
            c = { require("dap").continue, "Continue" },
            l = { require("dap").step_over, "Step over" },
            j = { require("dap").step_into, "Step into" },
            k = { require("dap").step_out, "Step out" },
            b = { require("dap").toggle_breakpoint, "Toggle Breakpoint" },
            r = { "<cmd>RustRunnables<cr>", "Runnables" },
            d = { "<cmd>RustDebuggables<cr>", "Debuggables" },
        },

    },
    -- Moving between windows
    ["<C-h>"] = { "<C-w>h", "Go Left" },
    ["<C-l>"] = { "<C-w>l", "Go Right" },
    ["<C-j>"] = { "<C-w>j", "Go Down" },
    ["<C-k>"] = { "<C-w>k", "Go Up" },
    -- Quit the terminal while inside it
    ["<Esc>"] = { "<cmd>FloatermToggle<cr>", "Quit Terminal", mode = "t" },
})

vim.keymap.set("n", ";", "<cmd>Commentary<cr>", { desc = "Comment" })
vim.keymap.set("v", ";", ":'<,'>Commentary<cr>", { desc = "Comment" })
