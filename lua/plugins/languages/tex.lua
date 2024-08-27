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
  ltex = {
    on_attach = function(client, bufnr)
      require('ltex_extra').setup()
    end,
    settings = {
      ltex = {
        latex = {
          commands = {
            ['\\gls{}'] = 'default',
            ['\\glsentryshort{}'] = 'default',
            ['\\glsentrylong{}'] = 'default',
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
