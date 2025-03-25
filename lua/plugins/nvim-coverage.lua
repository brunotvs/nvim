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
    {
      ']cc',
      function()
        local coverage = require('coverage')
        coverage.jump_next('covered')
      end,
      desc = 'Coverage: jump next covered',
    },
    {
      '[cc',
      function()
        local coverage = require('coverage')
        coverage.jump_prev('covered')
      end,
      desc = 'Coverage: jump previous covered',
    },
    {
      ']cu',
      function()
        local coverage = require('coverage')
        coverage.jump_next('uncovered')
      end,
      desc = 'Coverage: jump next uncovered',
    },
    {
      '[cu',
      function()
        local coverage = require('coverage')
        coverage.jump_prev('uncovered')
      end,
      desc = 'Coverage: jump previous uncovered',
    },
    {
      ']cp',
      function()
        local coverage = require('coverage')
        coverage.jump_next('partial')
      end,
      desc = 'Coverage: jump next partial',
    },
    {
      '[cp',
      function()
        local coverage = require('coverage')
        coverage.jump_prev('partial')
      end,
      desc = 'Coverage: jump previous partial',
    },
  },
}
