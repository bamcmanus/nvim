return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    -- Required for opencode.nvim
    input = { enabled = true },
    picker = { enabled = true },
    terminal = { enabled = true },

    -- Additional features
    notifier = { enabled = true },
    quickfile = { enabled = true },
    bigfile = { enabled = true },
    lazygit = { enabled = true },
  },
  keys = {
    { "<leader>lg", function() Snacks.lazygit() end, desc = "Lazygit" },
  },
}
