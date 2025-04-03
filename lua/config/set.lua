-- reference https://neovim.io/doc/user/options.html for full options

-- set numbers
vim.opt.nu = true 
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

--vim.opt.termguicolors = true

vim.opt.scrolloff = 8 -- ensure there are never less than 8 lines at the bottom unless EOF
vim.opt.isfname:append('@-@')

vim.opt.updatetime = 50

vim.opt.colorcolumn = '100'
vim.g.mapleader = " "
