LspServers = vim.tbl_extend('error', LspServers, { rledgerls = {} })

vim.filetype.add({ extension = { beancount = 'beancount' } })
--- @type LazySpec
return {
  'williamboman/mason-lspconfig.nvim',
  dependencies = {
    'beancount-config',
    virtual = true,
    config = function()
      local mappings_server = require('mason-lspconfig.mappings.server')
      mappings_server.lspconfig_to_package['rledgerls'] = 'rustledger-lsp'
      mappings_server.package_to_lspconfig['rustledger-lsp'] = 'rledgerls'
      local mappings_filetypes = require('mason-lspconfig.mappings.filetype')
      mappings_filetypes.beancount = { 'beancount', 'rledgerls' }
    end,
  },
}
