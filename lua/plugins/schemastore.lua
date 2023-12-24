return {
  "b0o/schemastore.nvim",
  enabled = false,
  dependencies = {
    'folke/neoconf.nvim',
    'neovim/nvim-lspconfig'
  },
  config = function()
    require('lspconfig').jsonls.setup {
      settings = {
        json = {
          schemas = require('schemastore').json.schemas(),
          validate = { enable = true },
        },
      },
    }
  end
}
