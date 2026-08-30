return {
  {
    "bamcmanus/bazel.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-lua/plenary.nvim",
    },
    ft = { "bzl", "bazel", "starlark" },
    config = function()
      vim.g.bazel_config = vim.g.bazel_config or ""
      vim.g.bazel_cmd = vim.fn.executable("bazelisk") == 1 and "bazelisk" or "bazel"
    end,
    keys = {
      {
        "<leader>bd",
        function()
          vim.fn.GoToBazelDefinition()
        end,
        desc = "Bazel Goto Definition",
        ft = { "bzl", "bazel", "starlark" },
      },
      { "gbt", function() vim.fn.GoToBazelTarget() end, desc = "Goto Bazel Build File" },
      { "<leader>bl", function() require("bazel").run_last() end, desc = "Bazel Last" },
      {
        "<leader>bt",
        function()
          require("bazel").run_here("test", vim.g.bazel_config or "")
        end,
        desc = "Bazel Test",
      },
      {
        "<leader>bb",
        function()
          require("bazel").run_here("build", vim.g.bazel_config or "")
        end,
        desc = "Bazel Build",
      },
      {
        "<leader>br",
        function()
          require("bazel").run_here("run", vim.g.bazel_config or "")
        end,
        desc = "Bazel Run",
      },
      {
        "<leader>bdb",
        function()
          require("bazel").run_here("build", (vim.g.bazel_config or "") .. " --compilation_mode dbg --copt=-O0")
        end,
        desc = "Bazel Debug Build",
      },
    },
  },
}
