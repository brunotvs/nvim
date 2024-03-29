TableInsert(LspServers, { rust_analyzer = {} })
TableInsert(TreesitterEnsureInstalled, { 'rust' })

--- @type LazySpec
return {
  {
    'rouge8/neotest-rust',
    dependecies = {
      'nvim-neotest/neotest',
    },
    init = function()
      require('neotest').setup({
        adapters = {
          require('neotest-rust'),
        },
      })
    end,
  },
}
