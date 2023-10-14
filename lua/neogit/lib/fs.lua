local cli = require("neogit.lib.git.cli")
local Path = require("plenary.path")

local M = {}

function M.relpath_from_repository(path)
  local result = cli["ls-files"].others.cached.modified.deleted.full_name
    .cwd("<current>")
    .args(path)
    .show_popup(false)
    .call()
  return result.stdout[1]
end

function M.stdpath(location)
  return vim.fn.stdpath(location)
end

function M.cwd()
  return vim.loop.cwd()
end

function M.sep()
  return Path.path.sep()
end

return M
