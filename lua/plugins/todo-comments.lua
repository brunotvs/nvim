return {
  'folke/todo-comments.nvim',
  dependencies = {
    'folke/trouble.nvim',
    'nvim-telescope/telescope.nvim',
  },
  cmd = { 'TodoTrouble', 'TodoTelescope' },
  config = true,
  -- stylua: ignore
  keys = {
    { "<leader>xt", "<cmd>TodoTrouble<cr>",                              desc = "Troube: Todo" },
    { "<leader>xT", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>",      desc = "Trouble: Todo/Fix/Fixme" },
    { "<leader>st", "<cmd>TodoTelescope<cr>",                            desc = "Trouble: Todo" },
    { "<leader>sT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>",    desc = "Trouble: Todo/Fix/Fixme" },
  },
}
