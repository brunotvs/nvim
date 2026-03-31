local function ensure_installed(packages)
  local mr = require('mason-registry')
  for _, tool in ipairs(packages) do
    local p = mr.get_package(tool)
    if not p:is_installed() then
      p:install()
    end
  end
end

--- @module "mason"
--- @type LazySpec
return {
  'williamboman/mason.nvim',
  build = ':MasonUpdate',
  ---@type MasonSettings
  opts = {
    ensure_installed = MasonEnsureInstalled,
    registries = {
      'github:brunotvs/custom-mason-registry',
      'github:mason-org/mason-registry',
    },
  },
  keys = { { '<M-m>', '<cmd>Mason<CR>', desc = 'Mason: Open' } },
}
