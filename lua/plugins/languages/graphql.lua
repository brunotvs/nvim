LspServers = vim.tbl_extend('force', LspServers, {
  graphql = {
    root_dir = function(fname)
      return require('lspconfig.util').root_pattern(
        '.graphqlrc',
        '.graphqlrc.yml',
        '.graphqlrc.yaml',
        'graphql.config.yml',
        'graphql.config.yml',
        '.graphqlconfig.yml',
        '.git'
      )(fname)
    end,
  },
})

MasonEnsureInstalled = vim.list_extend(MasonEnsureInstalled, { 'prettierd' })
TreesitterEnsureInstalled = vim.list_extend(TreesitterEnsureInstalled, { 'graphql' })

--- @type LazySpec
return {
  {
    'stevearc/conform.nvim',
    opts = {
      formatters_by_ft = {
        graphql = { 'prettierd' },
      },
    },
  },
}
