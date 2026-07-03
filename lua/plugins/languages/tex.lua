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
            ['\\subref{}'] = 'ignore',
          },
        },
      },
    },
  },
})

MasonEnsureInstalled = vim.list_extend(MasonEnsureInstalled, { 'texlab', 'ltex-ls-plus', 'latexindent' })
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
    {
      'stevearc/conform.nvim',
      ---@type conform.setupOpts
      opts = {
        formatters_by_ft = {
          tex = {},
        },
      },
    },
  },
}
