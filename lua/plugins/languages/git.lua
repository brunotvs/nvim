TableInsert(MasonEnsureInstalled, { 'commitlint' })
TableInsert(TreesitterEnsureInstalled, { 'gitattributes', 'git_rebase', 'gitignore', 'gitcommit', 'git_config' })

--- @type LazySpec
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
