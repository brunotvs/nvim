LspServers = vim.tbl_extend('error', LspServers, { yamlls = {} })
MasonEnsureInstalled = vim.list_extend(MasonEnsureInstalled, { 'prettierd' })
TreesitterEnsureInstalled = vim.list_extend(TreesitterEnsureInstalled, { 'yaml' })

--- @type LazySpec
return {
  {
    'stevearc/conform.nvim',
    opts = {
      formatters_by_ft = {
        yaml = { 'prettierd' },
      },
    },
  },
}
