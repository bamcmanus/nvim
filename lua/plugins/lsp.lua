vim.filetype.add({
  pattern = {
    [".*%.bazelrc"] = "bazelrc",
    [".*%.axl"] = "starlark",
  },
})

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        bazelrc_lsp = {},
        eslint = {},
        gh_actions_ls = {},
        gopls = {},
        html = {},
        pylsp = {},
        rust_analyzer = {},
        starpls = {
          filetypes = { "bzl", "starlark" },
          cmd = {
            "starpls",
            "server",
            "--experimental_infer_ctx_attributes",
            "--experimental_use_code_flow_analysis",
            "--experimental_enable_label_completions",
          },
        },
        ts_ls = {},
      },
    },
  },
}
