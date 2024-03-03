TableInsert(MasonEnsureInstalled, { 'commitlint' })
TableInsert(TreesitterEnsureInstalled, { 'css', 'scss' })
-- TableInsert(ServersToFilterFromFormat, { 'cssls' })
return {
  {
    'mfussenegger/nvim-lint',
    opts = {
      linters_by_ft = {
        gitcommit = { 'commitlint' },
      },
    },
  },
}
