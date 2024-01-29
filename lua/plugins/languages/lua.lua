TableInsert(LspServers, {
  lua_ls = {
    settings = {
      Lua = {
        workspace = { checkThirdParty = false },
        telemetry = { enable = false },
        hint = { enable = true },
      },
    },
  },
})

TableInsert(MasonEnsureInstalled, { 'stylua' })
return {
  { 'williamboman/mason-lspconfig.nvim' },
  {
    'stevearc/conform.nvim',
    opts = {
      formatters_by_ft = {
        lua = { 'stylua' },
      },
    },
  },
}
