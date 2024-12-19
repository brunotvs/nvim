--- @module "neogit"
--- @type LazySpec
return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim', -- required
    'sindrets/diffview.nvim', -- optional - Diff integration

    -- Only one of these is needed, not both.
    'nvim-telescope/telescope.nvim', -- optional
  },
  --- @type NeogitConfig
  opts = {
    integrations = {
      telescope = true,
      diffview = true,
    },
  },
  keys = {
    {
      '<leader>ng',
      function()
        require('neogit').open()
      end,
      desc = 'Neogit: Open',
      mode = { 'n' },
    },
  },
}
