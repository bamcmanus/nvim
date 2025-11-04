return {
    'alexander-born/bazel.nvim',
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
        'nvim-lua/plenary.nvim'
    },
    ft = { "bzl", "bazel" },
    config = function()
        vim.g.bazel_config = vim.g.bazel_config or ""
        vim.g.bazel_cmd = vim.g.bazel_cmd or "bazel"
    end,
    keys = {
        -- Buffer-local keybindings for .bzl/.bazel files
        { "<leader>gd", function() vim.fn.GoToBazelDefinition() end, desc = "Goto Definition", ft = { "bzl", "bazel" } },

        -- Global bazel keybindings
        { "gbt", function() vim.fn.GoToBazelTarget() end, desc = "Goto Bazel Build File" },
        { "<Leader>bl", function() require("bazel").run_last() end, desc = "Bazel Last" },
        { "<Leader>bt", function()
            local bazel = require("bazel")
            if not bazel.is_bazel_workspace() then
                print("Error: Not in a bazel workspace")
                return
            end
            vim.ui.input({ prompt = "Bazel test target: " }, function(target)
                if target and target ~= "" then
                    bazel.run("test", vim.g.bazel_config or "", target, bazel.get_workspace())
                end
            end)
        end, desc = "Bazel Test (manual target)" },
        { "<Leader>bb", function()
            local bazel = require("bazel")
            if not bazel.is_bazel_workspace() then
                print("Error: Not in a bazel workspace")
                return
            end
            -- Try automatic target detection first
            bazel.call_with_bazel_target(function(target)
                bazel.run("build", vim.g.bazel_config or "", target, bazel.get_workspace())
            end)
        end, desc = "Bazel Build" },
        { "<Leader>br", function()
            local bazel = require("bazel")
            if not bazel.is_bazel_workspace() then
                print("Error: Not in a bazel workspace")
                return
            end
            vim.ui.input({ prompt = "Bazel run target: " }, function(target)
                if target and target ~= "" then
                    bazel.run("run", vim.g.bazel_config or "", target, bazel.get_workspace())
                end
            end)
        end, desc = "Bazel Run (manual target)" },
        { "<Leader>bdb", function()
            local bazel = require("bazel")
            if not bazel.is_bazel_workspace() then
                print("Error: Not in a bazel workspace")
                return
            end
            vim.ui.input({ prompt = "Bazel debug build target: " }, function(target)
                if target and target ~= "" then
                    local config = (vim.g.bazel_config or "") .. " --compilation_mode dbg --copt=-O0"
                    bazel.run("build", config, target, bazel.get_workspace())
                end
            end)
        end, desc = "Bazel Debug Build (manual target)" },
    }
}
