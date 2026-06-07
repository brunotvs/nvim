LspServers = vim.tbl_extend('force', LspServers, {
  turtle_ls = {},
})

TreesitterEnsureInstalled = vim.list_extend(TreesitterEnsureInstalled, { 'turtle' })

vim.filetype.add({ extension = { ttl = 'turtle' } })

--- @type LazySpec
return {
  'williamboman/mason-lspconfig.nvim',
  dependencies = {
    'turtle-config',
    virtual = true,
    config = function()
      local mappings_server = require('mason-lspconfig.mappings.server')
      mappings_server.lspconfig_to_package['turtle_ls'] = 'turtle-language-server'
      mappings_server.package_to_lspconfig['turtle-language-server'] = 'turtle_ls'
      local mappings_filetypes = require('mason-lspconfig.mappings.filetype')
      mappings_filetypes.turtle = { 'turtle_ls' }
    end,
  },
}
