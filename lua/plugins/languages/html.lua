LspServers = vim.tbl_extend('error', LspServers, { emmet_ls = {}, html = {} })
MasonEnsureInstalled = vim.list_extend(MasonEnsureInstalled, { 'prettierd' })
TreesitterEnsureInstalled = vim.list_extend(TreesitterEnsureInstalled, { 'html' })
ServersToFilterFromFormat = vim.list_extend(ServersToFilterFromFormat, { 'html' })
--- @type LazySpec
return {
  {
    'stevearc/conform.nvim',
    opts = {
      formatters_by_ft = {
        html = { 'prettierd' },
      },
    },
  },
}
