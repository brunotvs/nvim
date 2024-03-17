TableInsert(LspServers, {
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

TableInsert(MasonEnsureInstalled, { 'prettierd' })
TableInsert(TreesitterEnsureInstalled, { 'graphql' })

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
