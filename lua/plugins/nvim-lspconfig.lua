--- @type LazySpec
return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
    },
    init = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

      for name, settings in pairs(LspServers) do
        settings.capabilities = capabilities
        vim.lsp.config(name, settings)
        vim.lsp.enable(name)
      end
    end,
  },
}
