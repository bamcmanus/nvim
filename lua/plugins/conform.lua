return {
    {
        'stevearc/conform.nvim',
        dependencies = { "WhoIsSethDaniel/mason-tool-installer.nvim" },
        event = { "BufWritePre" },
        cmd = { "ConformInfo" },
        opts = {
            -- Set up formatters by filetype
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "isort", "black" },
                javascript = { "prettier" },
                typescript = { "prettier" },
                javascriptreact = { "prettier" },
                typescriptreact = { "prettier" },
                css = { "prettier" },
                html = { "prettier" },
                json = { "prettier" },
                yaml = { "prettier" },
                markdown = { "prettier" },
                graphql = { "prettier" },
                -- You can use a function to dynamically choose a formatter
                -- or return a list of formatters to run sequentially
                go = function(bufnr)
                    if require("conform").get_formatter_info("gofumpt", bufnr).available then
                        return { "gofumpt", "goimports-reviser", "golines" }
                    else
                        return { "goimports", "gofmt" }
                    end
                end,
            },
            -- Enables format on save
            format_on_save = {
                -- I recommend these options for a smooth experience
                timeout_ms = 500,
                lsp_format = "fallback",
            },
            -- You can customize formatters here
            formatters = {
                prettier = {
                    prepend_args = { "--prose-wrap=always" },
                },
            },
        },
        init = function()
            -- This will install the formatters specified in `formatters_by_ft`
            -- with mason.nvim. Make sure you have mason.nvim installed.
            require("mason-tool-installer").setup {
                ensure_installed = {
                    "black",
                    "gofumpt",
                    "goimports-reviser",
                    "golines",
                    "isort",
                    "prettier",
                },
            }
        end,
    },
}
