require("config.set")

require("config.lazy")

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

vim.o.foldmethod = 'indent'
vim.o.foldlevel = 99 -- ensures folds are open by default

local bamcmanus = augroup('bamcmanus', {})
autocmd('LspAttach', {
    group = bamcmanus,
    callback = function(e)
        local opts = { buffer = e.buf }
        vim.keymap.set("n", "<leader>gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workpsace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vi", function() vim.lsp.buf.implementation() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "<leader>va", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>vr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    end
})

local netrwlinenum = augroup("NetrwLineNumbers", {})
autocmd("FileType", {
  group = netrwlinenum,
  pattern = "netrw",
  callback = function()
        vim.wo.number = true
        vim.wo.relativenumber = true
    end,
})
