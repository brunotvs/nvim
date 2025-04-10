-- Useful plugin to show you pending keybinds.
--- @type LazySpec
return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  ---@diagnostic disable-next-line: missing-fields
  ---@type wk.Opts
  opts = {
    delay = 1000,
  },
  keys = {
    {
      '<leader><leader>?',
      function()
        require('which-key').show({ global = false })
      end,
      desc = 'Buffer Local Keymaps (which-key)',
    },
  },
}
