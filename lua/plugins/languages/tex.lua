-- TableInsert(LspServers, { texlab = {} })

TableInsert(MasonEnsureInstalled, { 'latexindent' })

return {
  { 'williamboman/mason-lspconfig.nvim' },
  {
    'stevearc/conform.nvim',
    opts = {
      formatters_by_ft = {
        tex = { 'latexindent' },
      },
    },
  },
}
