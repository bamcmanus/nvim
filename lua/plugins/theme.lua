-- Keep a dependable fallback for other Linux distributions and macOS. The
-- Omarchy theme remains selected on Omarchy, while its theme catalogue and
-- hot-reload behavior are isolated in plugins/omarchy-*.lua.
if require("platform.omarchy").is_active() then
  return {
    {
      "bjarneo/hackerman.nvim",
      dependencies = { "bjarneo/aether.nvim" },
      priority = 1000,
    },
    {
      "LazyVim/LazyVim",
      opts = {
        colorscheme = "hackerman",
      },
    },
  }
end

return {
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    opts = {
      style = "night",
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight-night",
    },
  },
}
