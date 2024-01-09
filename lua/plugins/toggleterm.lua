return {
  "akinsho/toggleterm.nvim",
  enabled = false,
  init = function()
    local Terminal       = require('toggleterm.terminal').Terminal
    local lazygit        = Terminal:new({ cmd = "lazygit", hidden = true, direction = 'tab' })
    local float_terminal = Terminal:new({ direction = 'float' })
    vim.api.nvim_create_user_command('Lazygit', function()
      lazygit:toggle()
    end, {})
    vim.api.nvim_create_user_command('Lg', function()
      lazygit:toggle()
    end, {})
    vim.api.nvim_create_user_command('FloatTerminal', function()
      float_terminal:toggle()
    end, {})
  end,
  keys = {
    {
      "<M-d>",
      vim.cmd.FloatTerminal,
      desc = "Toggleterm: Open float terminal",
      mode = { 'n', 'v', 't' }
    },
  },
}
