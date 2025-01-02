-- Useful plugin to show you pending keybinds.
--- @type LazySpec
return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  ---@diagnostic disable-next-line: missing-fields
  ---@type wk.Opts
  opts = {},
  keys = {
    {
      '<leader>?',
      function()
        require('which-key').show({ global = false })
      end,
      desc = 'Buffer Local Keymaps (which-key)',
    },
  },
}
