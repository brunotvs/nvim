--- @type LazySpec
return {
  'andythigpen/nvim-coverage',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {
    commands = true,
    auto_reload = true,
    highlights = {
      covered = { fg = '#a6e3a1' },
      uncovered = { fg = '#f38ba8' },
      partial = { fg = '#f5e0dc' },
    },
    summary = {
      window = {
        winblend = 0,
        -- percentage = 0,
      },
    },
  },
  keys = {

    {
      '<leader>cl',
      function()
        local coverage = require('coverage')
        coverage.load(false)
      end,
      desc = 'Coverage: Summary',
    },
    {
      '<leader>cs',
      function()
        local coverage = require('coverage')
        coverage.summary()
      end,
      desc = 'Coverage: Summary',
    },
    {
      '<leader>ct',
      function()
        local coverage = require('coverage')
        coverage.toggle()
      end,
      desc = 'Coverage: Toggle',
    },
  },
}
