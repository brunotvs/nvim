LspServers = vim.tbl_extend('force', LspServers, { cssls = {} })
MasonEnsureInstalled = vim.list_extend(MasonEnsureInstalled, { 'prettierd' })
TreesitterEnsureInstalled = vim.list_extend(TreesitterEnsureInstalled, { 'css', 'scss' })
ServersToFilterFromFormat = vim.list_extend(ServersToFilterFromFormat, { 'cssls' })

--- @type LazySpec
return {
  {
    'stevearc/conform.nvim',
    opts = {
      formatters_by_ft = {
        css = { 'prettierd' },
        scss = { 'prettierd' },
        sass = { 'prettierd' },
      },
    },
  },
}
