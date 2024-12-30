--- @module "mason"
--- @type LazySpec
return {
  'williamboman/mason.nvim',
  build = ':MasonUpdate',
  ---@type MasonSettings
  opts = {
    ensure_installed = MasonEnsureInstalled,
    registries = {
      'github:mason-org/mason-registry',
      'github:brunotvs/lua-dap-mason-registry',
    },
  },
  ---@param opts MasonSettings | { ensure_installed: string[] }
  config = function(_, opts)
    require('mason').setup(opts)
    local mr = require('mason-registry')
    local function ensure_installed()
      for _, tool in ipairs(opts.ensure_installed) do
        local p = mr.get_package(tool)
        if not p:is_installed() then
          p:install()
        end
      end
    end
    if mr.refresh then
      mr.refresh(ensure_installed)
    else
      ensure_installed()
    end
  end,
  keys = { { '<M-m>', '<cmd>Mason<CR>', desc = 'Mason: Open' } },
}
