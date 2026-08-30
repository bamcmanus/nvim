-- Options are automatically loaded before lazy.nvim startup.
require("config.remote_clipboard").setup()

local nvim_python = vim.fn.stdpath("data") .. "/python/bin/python"
if vim.fn.executable(nvim_python) == 1 then
  vim.g.python3_host_prog = nvim_python
end

vim.opt.relativenumber = true
vim.opt.showtabline = 0
vim.g.autoformat = true
