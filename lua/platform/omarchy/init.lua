local M = {}

function M.is_active()
  return (vim.env.OMARCHY_PATH or "") ~= "" or vim.env.DESKTOP_SESSION == "omarchy"
end

return M
