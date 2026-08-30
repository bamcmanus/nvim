return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        bzl = { "buildifier" },
        css = { "prettier" },
        graphql = { "prettier" },
        html = { "prettier" },
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        json = { "prettier" },
        markdown = { "prettier" },
        python = { "isort", "black" },
        rust = { "rustfmt" },
        starlark = { "buildifier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        yaml = { "prettier" },
        go = { "gofumpt", "goimports-reviser" },
      },
      formatters = {
        prettier = {
          prepend_args = { "--prose-wrap=always", "--print-width=100" },
        },
      },
    },
  },
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "black",
        "buildifier",
        "gofumpt",
        "goimports-reviser",
        "isort",
        "prettier",
      })
    end,
  },
}
