LspServers = vim.tbl_extend('force', LspServers, {
  texlab = {
    settings = {
      texlab = {
        experimental = {
          labelReferenceCommands = { 'nameref' },
        },
      },
    },
  },
  ltex_plus = {
    on_attach = function(_, _)
      require('ltex_extra').setup()
    end,
    settings = {
      ltex = {
        latex = {
          commands = {
            ['\\listof{}'] = 'ignore',
            ['\\author{}'] = 'ignore',
            ['\\author[]{}'] = 'ignore',
          },
        },
      },
    },
  },
})

TreesitterEnsureInstalled = vim.list_extend(TreesitterEnsureInstalled, { 'latex' })

return {
  'tex-config',
  virtual = true,
  ft = { 'tex', 'latex', 'markdown' },
  dependencies = {
    { 'williamboman/mason-lspconfig.nvim' },
    {
      'barreiroleo/ltex_extra.nvim',
      ft = { 'markdown', 'tex' },
      dependencies = { 'neovim/nvim-lspconfig' },
    },
  },
}
