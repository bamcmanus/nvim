return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "folke/snacks.nvim",
    },
    opts = {},
    keys = {
      {
        "<leader>hl",
        function()
          local items = {}

          for index, item in ipairs(require("harpoon"):list().items) do
            items[#items + 1] = {
              text = item.value,
              file = item.value,
              idx = index,
            }
          end

          Snacks.picker({
            title = "Harpoon",
            items = items,
            format = "file",
            preview = "file",
          })
        end,
        desc = "Harpoon List",
      },
      {
        "<leader>hA",
        function()
          require("harpoon"):list():prepend()
        end,
        desc = "Harpoon Prepend File",
      },
      {
        "<leader>ha",
        function()
          require("harpoon"):list():add()
        end,
        desc = "Harpoon Add File",
      },
      {
        "<leader>hc",
        function()
          require("harpoon"):list():clear()
        end,
        desc = "Harpoon Clear List",
      },
      {
        "<leader>h1",
        function()
          require("harpoon"):list():select(1)
        end,
        desc = "Harpoon File 1",
      },
      {
        "<leader>h2",
        function()
          require("harpoon"):list():select(2)
        end,
        desc = "Harpoon File 2",
      },
      {
        "<leader>h3",
        function()
          require("harpoon"):list():select(3)
        end,
        desc = "Harpoon File 3",
      },
      {
        "<leader>h4",
        function()
          require("harpoon"):list():select(4)
        end,
        desc = "Harpoon File 4",
      },
    },
  },
}
