TableInsert(TreesitterEnsureInstalled, { 'rust' })
TableInsert(MasonEnsureInstalled, { 'codelldb' })

--- @type rustaceanvim.Opts
---NOTE: for rustaceanvim lsp implementation
vim.g.rustaceanvim = {
  --- @type rustaceanvim.lsp.ClientOpts
  server = {
    on_attach = OnAttach,
  },
}

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
