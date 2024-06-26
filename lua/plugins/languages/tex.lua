TableInsert(LspServers, { texlab = {}, ltex = {
  on_attach = function(client, bufnr)
    require('ltex_extra').setup()
  end,
} })

TableInsert(MasonEnsureInstalled, { 'latexindent' })

return {
  { 'williamboman/mason-lspconfig.nvim' },
  {
    'barreiroleo/ltex_extra.nvim',
    ft = { 'markdown', 'tex' },
    dependencies = { 'neovim/nvim-lspconfig' },
  },
  {
    'stevearc/conform.nvim',
    opts = {
      formatters_by_ft = {
        tex = { 'latexindent' },
      },
    },
  },
}
