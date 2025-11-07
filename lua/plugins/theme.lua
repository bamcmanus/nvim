---@diagnostic disable: undefined-global

-- Choose your active theme here
local active_theme = "carbonfox" -- Options: "tokyonight", "carbonfox"

return {
    -- Tokyo Night theme
    {
        "folke/tokyonight.nvim",
        lazy = active_theme ~= "tokyonight",
        priority = 1000,
        config = function()
            if active_theme == "tokyonight" then
                require("tokyonight").setup({
                    transparent = true,
                    styles = {
                        sidebars = "transparent",
                        floats = "transparent",
                    },
                })
                vim.opt.termguicolors = true
                vim.cmd.colorscheme("tokyonight-night")
            end
        end,
    },

    -- Nightfox theme (Carbonfox variant)
    {
        "EdenEast/nightfox.nvim",
        lazy = active_theme ~= "carbonfox",
        priority = 1000,
        config = function()
            if active_theme == "carbonfox" then
                require("nightfox").setup({
                    options = {
                        transparent = true,
                        styles = {
                            sidebars = "transparent",
                            floats = "transparent",
                        },
                    },
                })
                vim.opt.termguicolors = true
                vim.cmd.colorscheme("carbonfox")
            end
        end,
    },
}
