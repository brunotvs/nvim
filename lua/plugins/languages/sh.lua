TableInsert(MasonEnsureInstalled, { 'beautysh' })
TableInsert(LspServers, { bashls = {} })

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
