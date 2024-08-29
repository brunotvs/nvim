TableInsert(TreesitterEnsureInstalled, { 'rust' })
TableInsert(MasonEnsureInstalled, { 'codelldb' })

--- @type LazySpec
return {
  {
    'mrcjkb/rustaceanvim',
    version = '^5', -- Recommended
    lazy = false, -- This plugin is already lazy
    dependecies = {
      'nvim-neotest/neotest',
    },
    init = function()
      require('neotest').setup({
        adapters = {
          require('rustaceanvim.neotest'),
        },
      })
    end,
  },
}
