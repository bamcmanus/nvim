-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>jd", vim.lsp.buf.definition, { desc = "Jump to Definition" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move Selection Down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move Selection Up" })

vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to Clipboard" })
vim.keymap.set("n", "<leader>Y", '"+Y', { desc = "Yank Line to Clipboard" })
vim.keymap.set("x", "<leader>pp", '"_dp', { desc = "Paste Without Replacing Register" })

vim.keymap.set("n", "<leader>pv", "<cmd>Neotree reveal<CR>", { desc = "Reveal File in Explorer" })

vim.keymap.set("n", "<leader>qc", "<cmd>quit<CR>", { desc = "Close Window" })
vim.keymap.set("n", "<leader>qw", "<cmd>write<Bar>quit<CR>", { desc = "Save and Close Window" })
vim.keymap.set("n", "<leader>qf", "<cmd>quit!<CR>", { desc = "Force Close Window" })
