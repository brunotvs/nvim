return {
  "Pocco81/true-zen.nvim",
  config = function()
    require("true-zen").setup { modes = {
      ataraxis = {
        padding = { -- padding windows
          left = 40,
          right = 40,
          top = 0,
          bottom = 0,
        }
      },
      minimalist = {
        options = { -- options to be disabled when entering Minimalist mode
          number = true,
          relativenumber = true,
        },
      },
    } }
  end,
  keys = {
    { "<leader>zn", ":TZNarrow<CR>",      desc = "Zen: Toggle zen narrow" },
    { "<leader>zn", ":'<,'>TZNarrow<CR>", desc = "Zen: Toggle zen narrow",    mode = "v" },
    { "<leader>zf", ":TZFocus<CR>",       desc = "Zen: Toggle zen focus" },
    { "<leader>zm", ":TZMinimalist<CR>",  desc = "Zen: Toggle zen minimalist" },
    { "<leader>za", ":TZAtaraxis<CR>",    desc = "Zen: Toggle zen ataraxis" }
  },
  enabled = false
}
