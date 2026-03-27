MasonEnsureInstalled = vim.list_extend(MasonEnsureInstalled, { 'beautysh' })
LspServers = vim.tbl_extend('force', LspServers, { bashls = {} })

--- @type LazySpec
return {
  {
    'stevearc/conform.nvim',
    opts = {
      formatters_by_ft = {
        zsh = { 'beautysh' },
      },
    },
  },
}
