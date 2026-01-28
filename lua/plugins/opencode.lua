return {
  "NickvanDyke/opencode.nvim",
  config = function()
    ---@type opencode.Opts
    vim.g.opencode_opts = {
      provider = {
        enabled = "snacks",
        snacks = {
          win = {
            position = "right",
            width = math.floor(vim.o.columns * 0.4),
          },
        },
      },
      events = {
        permissions = {
          idle_delay_ms = 500,
        },
      },
    }

    vim.o.autoread = true

    vim.keymap.set({ "n", "x" }, "<leader>oa", function() require("opencode").ask("@this: ", { submit = true }) end, { desc = "Opencode ask…" })
    vim.keymap.set({ "n", "x" }, "<leader>os", function() require("opencode").select() end, { desc = "Opencode select…" })
    vim.keymap.set({ "n", "t" }, "<leader>ot", function() require("opencode").toggle() end, { desc = "Opencode toggle" })
    vim.keymap.set({ "n", "x" }, "<leader>oo", function() return require("opencode").operator("@this ") end, { desc = "Opencode operator", expr = true })

    -- Optional: scroll commands
    vim.keymap.set("n", "<S-C-u>", function() require("opencode").command("session.half.page.up") end, { desc = "Scroll opencode up" })
    vim.keymap.set("n", "<S-C-d>", function() require("opencode").command("session.half.page.down") end, { desc = "Scroll opencode down" })
  end,
}
