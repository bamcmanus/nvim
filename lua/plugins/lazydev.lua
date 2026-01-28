-- lazydev.nvim: Configures LuaLS for Neovim config development
--
-- What it does:
-- 1. Dynamically adds type definitions for plugins you `require()` in your files
-- 2. Enables type hints like `---@type conform.setupOpts` to work
-- 3. Provides better autocomplete for vim.* APIs and plugin options
--
-- The `library` option pre-loads specific type definitions:
-- - `${3rd}/luv/library` loads types for `vim.uv` (Neovim's libuv bindings)
-- - `words = { "vim%.uv" }` means it only loads when "vim.uv" appears in the file
--   (the % escapes the dot in Lua pattern matching)
--
-- Without this plugin, LuaLS doesn't know about Neovim's APIs or your plugins.
return {
    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
            library = {
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },
}
