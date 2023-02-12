local lsp = require("lsp-zero")

lsp.preset({
    name = "recommended",
    set_lsp_keymaps = false,
    manage_nvim_cmp = true,
    suggest_lsp_servers = true,
})

lsp.nvim_workspace()

lsp.configure("rust_analyzer", {
    settings = {
        ["rust-analyzer"] = {
            check = {
                command = "cranky",
            },
        },
    },
})

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
})

lsp.on_attach(function(_, bufnr)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Goto definition" })
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Goto declaration" })
    vim.keymap.set("n", "go", vim.lsp.buf.type_definition, { desc = "Goto type definition" })

    vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
            vim.lsp.buf.format()
        end
    })
end)
