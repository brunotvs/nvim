LspServers.lua_ls = {
  settings = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    }
  },
}
return {
  { 'williamboman/mason-lspconfig.nvim' },
  -- {
  --   'nvim-treesitter/nvim-treesitter',
  --   -- opts = function(_, opts)
  --   --   opts.ensure_installed = opts.ensure_installed or {}
  --   --   opts.ensure_installed = vim.list_extend(opts.ensure_installed, { { 'lua' } })
  --   -- end,
  -- }
}
