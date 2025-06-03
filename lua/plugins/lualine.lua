return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require('lualine').setup {
            options = {
                icons_enabled = true,
                theme = 'iceberg_dark',
                component_separators = { left = ' ', right = ' '},
                section_separators = { left = ' ', right = ' '},
                disabled_filetypes = { },
                ignore_focus = {},
                always_divide_middle = true,
                always_show_tabline = false,
                globalstatus = false,
                refresh = { statusline = 100, tabline = 100, winbar = 100 }
            },
            sections = {
                lualine_a = {'mode'},
                lualine_b = {'branch', 'diff', 'diagnostics'},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {
                    function()
                        -- expands to relative path, replace . with p for absolute
                        return vim.fn.expand('%:.')
                    end
                },
                lualine_z = {'filetype'}
            }
        }
    end
}
