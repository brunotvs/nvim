--- @type LazySpec
return {
  'folke/todo-comments.nvim',
  dependencies = {
    'folke/trouble.nvim',
    'nvim-telescope/telescope.nvim',
    'nvim-lua/plenary.nvim',
  },
  event = 'VeryLazy',
  cmd = { 'TodoTrouble', 'TodoTelescope' },
  config = true,
  -- stylua: ignore
  keys = {
    {
      "<leader>xt",
      "<cmd>Trouble todo toggle<cr>",
      desc = "Troube: Todo",
    },
    {
      "<leader>xT",
      "<cmd>Trouble todo toggle filter = {tag = {TODO,FIX,FIXME}}<cr>",
      desc = "Trouble: Todo/Fix/Fixme",
    },
    {
      "<leader>st",
      "<cmd>TodoTelescope<cr>",
      desc = "Trouble: Todo",
    },
    {
      "<leader>sT",
      "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>",
      desc = "Trouble: Todo/Fix/Fixme",
    },
    {
      "]t",
      function() require('todo-comments').jump_next() end,
      desc = "Trouble: Jump next todo",
    },
    {
      "[t",
      function() require('todo-comments').jump_prev() end,
      desc = "Trouble: Jump prev todo",
    }
  },
}
