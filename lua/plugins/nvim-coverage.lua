--- @type LazySpec
return {
  'andythigpen/nvim-coverage',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {
    commands = true,
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
