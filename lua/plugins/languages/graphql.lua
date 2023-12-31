LspServers.graphql = {
  root_dir = function(fname)
    return require('lspconfig.util').root_pattern(
      ".graphqlrc",
      ".graphqlrc.yml",
      ".graphqlrc.yaml",
      "graphql.config.yml",
      "graphql.config.yml",
      ".graphqlconfig.yml",
      '.git'
    )(fname)
  end
}
table.insert(MasonEnsureInstalled, 'prettierd')
table.insert(TreesitterEnsureInstalled, 'graphql')
return {
  {
    'stevearc/conform.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
      formatters_by_ft = {
        graphql = { "prettierd" },
      },
    }
  },
}
