local os = require('os')


local M = {}

local function getenv(variable)
  local value = os.getenv(variable)

  if value == nil then
    error('"' .. variable .. '"' .. 'environment variable not defined')
  end

  return value
end

M.getenv = getenv

return M
