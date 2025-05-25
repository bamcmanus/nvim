-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({"git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath})
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before loading lazy.nvim so that mappings
-- are correct. This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "//"
vim.g.leader = " "

-- allow traversal back to the direcory tree with an easier command than :Ex
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- allow the moving of visually selected lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- yank current section to clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
-- yand line to clipboard
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- allow navigation using vim keybindings while in insert mode with Ctrl
vim.keymap.set("i", "<C-h>", "<Left>", {})
vim.keymap.set("i", "<C-l>", "<Right>", {})
vim.keymap.set("i", "<C-j>", "<Down>", {})
vim.keymap.set("i", "<C-k>", "<Up>", {})

-- allow easy quit/save functionality
vim.keymap.set("n", "<leader>q", ":q<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>fq", ":q!<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>ww", ":w<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>wq", ":wq<CR>", { silent = true, noremap = true })

-- append previous line to current line and keep cursor
vim.keymap.set("n", "J", "mzJ`z", { noremap = true })

-- keep cursor in center of the page when half page jumping
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true })

-- search terms stay in the middle when selecting next
vim.keymap.set("n", "n", "nzzzv", { noremap = true })
vim.keymap.set("n", "N", "Nzzzv", { noremap = true })

-- greatest remap ever, blackhole pasting that doesn't copy the deleted value
vim.keymap.set("x", "<leader>p", [["_dp]], { noremap = true })

-- allows for vertical edits to take when inserting
vim.keymap.set("i", "<C-c>", "<Esc>", { noremap = true })

-- never hit Q, it's the worst place in the world
vim.keymap.set("n", "Q", "<nop>", { noremap = true })

--vim.cmd.colorscheme("<REPLACE_WITH_COLOR_SCHEME>")

-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        -- import the plugins directory
        { import = "plugins" },
    },
    -- Configure any other settings here. See the documentation for more details.
    -- colorscheme taht will be used when installing plugins.
    -- install = { colorscheme = { "habamax" } },
    -- automatically check for plugin updates
    checker = { enabled = true },
})
