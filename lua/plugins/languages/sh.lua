LspServers = vim.tbl_extend('force', LspServers, { bashls = {} })
MasonEnsureInstalled = vim.list_extend(MasonEnsureInstalled, { 'bash-language-server', 'beautysh' })

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
