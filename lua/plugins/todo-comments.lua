return {
  'folke/todo-comments.nvim',
  dependencies = {
    'folke/trouble.nvim',
    'nvim-telescope/telescope.nvim',
  },
  event = 'VeryLazy',
  cmd = { 'TodoTrouble', 'TodoTelescope' },
  config = true,
  -- stylua: ignore
  keys = {
    { "<leader>xt", "<cmd>TodoTrouble<cr>",                              desc = "Troube: Todo" },
    { "<leader>xT", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>",      desc = "Trouble: Todo/Fix/Fixme" },
    { "<leader>st", "<cmd>TodoTelescope<cr>",                            desc = "Trouble: Todo" },
    { "<leader>sT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>",    desc = "Trouble: Todo/Fix/Fixme" },
    { "]t",function ()
      require('todo-comments').jump_next()
    end,    desc = "Trouble: Jump next todo" },{ "[t",function ()
      require('todo-comments').jump_prev()
    end,    desc = "Trouble: Jump prev todo" }
  },
}
