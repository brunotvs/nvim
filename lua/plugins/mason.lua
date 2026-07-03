--- @module "mason"

local function ensure_installed(packages)
  local mr = require('mason-registry')
  for _, tool in ipairs(packages) do
    local p = mr.get_package(tool)
    if not p:is_installed() then
      p:install()
    end
  end
end

--- @type LazySpec
return {
  'williamboman/mason.nvim',
  build = ':MasonUpdate',
  ---@type MasonSettings
  opts = {
    registries = {
      'github:brunotvs/custom-mason-registry',
      'github:mason-org/mason-registry',
    },
  },
  init = function()
    local mr = require('mason-registry')
    if mr.refresh then
      mr.refresh(function()
        ensure_installed(MasonEnsureInstalled)
      end)
    else
      ensure_installed(MasonEnsureInstalled)
    end

    local ensure_installed_map = {}
    for _, name in ipairs(MasonEnsureInstalled) do
      ensure_installed_map[name] = true
    end


    local installed_names = mr.get_installed_package_names()

    for _, instaled_name in ipairs(installed_names) do
      if not ensure_installed_map[instaled_name] then
        mr.get_package(instaled_name):uninstall()
      end
    end
  end,
  keys = { { '<M-m>', '<cmd>Mason<CR>', desc = 'Mason: Open' } },
}
