return {
  'andythigpen/nvim-coverage',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {
    commands = true,
  },
  keys = {
    { '<leader>cl', vim.cmd.CoverageLoad, desc = 'Coverage: Load' },
    { '<leader>ct', vim.cmd.CoverageToggle, desc = 'Coverage: Toggle' },
  },
}
