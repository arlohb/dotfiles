require("lspconfig").svelte.setup {
    on_attach = function(_, bufnr)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
        vim.keymap.set("n", "J", vim.diagnostic.open_float, { desc = "Diagnostic hover" })
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Goto definition" })
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Goto declaration" })
        vim.keymap.set("n", "go", vim.lsp.buf.type_definition, { desc = "Goto type definition" })

        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
                vim.lsp.buf.format()
            end,
        })
    end
}

require("lspconfig").eslint.setup {}
