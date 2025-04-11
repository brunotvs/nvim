TableInsert(LspServers, {
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
    on_attach = function(client, bufnr)
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

return {
  { 'williamboman/mason-lspconfig.nvim' },
  {
    'barreiroleo/ltex_extra.nvim',
    ft = { 'markdown', 'tex' },
    dependencies = { 'neovim/nvim-lspconfig' },
  },
}
