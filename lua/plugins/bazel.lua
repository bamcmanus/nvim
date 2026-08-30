return {
  {
    "alexander-born/bazel.nvim",
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
          local bazel = require("bazel")
          if not bazel.is_bazel_workspace() then
            vim.notify("Not in a Bazel workspace", vim.log.levels.WARN)
            return
          end
          vim.ui.input({ prompt = "Bazel test target: " }, function(target)
            if target and target ~= "" then
              bazel.run("test", vim.g.bazel_config or "", target, bazel.get_workspace())
            end
          end)
        end,
        desc = "Bazel Test",
      },
      {
        "<leader>bb",
        function()
          local bazel = require("bazel")
          if not bazel.is_bazel_workspace() then
            vim.notify("Not in a Bazel workspace", vim.log.levels.WARN)
            return
          end
          bazel.call_with_bazel_target(function(target)
            bazel.run("build", vim.g.bazel_config or "", target, bazel.get_workspace())
          end)
        end,
        desc = "Bazel Build",
      },
      {
        "<leader>br",
        function()
          local bazel = require("bazel")
          if not bazel.is_bazel_workspace() then
            vim.notify("Not in a Bazel workspace", vim.log.levels.WARN)
            return
          end
          vim.ui.input({ prompt = "Bazel run target: " }, function(target)
            if target and target ~= "" then
              bazel.run("run", vim.g.bazel_config or "", target, bazel.get_workspace())
            end
          end)
        end,
        desc = "Bazel Run",
      },
      {
        "<leader>bdb",
        function()
          local bazel = require("bazel")
          if not bazel.is_bazel_workspace() then
            vim.notify("Not in a Bazel workspace", vim.log.levels.WARN)
            return
          end
          vim.ui.input({ prompt = "Bazel debug build target: " }, function(target)
            if target and target ~= "" then
              local config = (vim.g.bazel_config or "") .. " --compilation_mode dbg --copt=-O0"
              bazel.run("build", config, target, bazel.get_workspace())
            end
          end)
        end,
        desc = "Bazel Debug Build",
      },
    },
  },
}
