local select_one_or_multi = function(prompt_bufnr)
  local picker = require('telescope.actions.state').get_current_picker(prompt_bufnr)
  local multi = picker:get_multi_selection()
  if not vim.tbl_isempty(multi) then
    for _, j in pairs(multi) do
      if j.path ~= nil then
        require("harpoon.mark").add_file(j.path)
      end
    end
  end
  require('telescope.actions').select_default(prompt_bufnr)
end
return {
  "ThePrimeagen/harpoon",
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope.nvim',
      opts = {
        defaults = {
          mappings = {
            i = {
              ["<CR>"] = select_one_or_multi,
            }
          }
        }
      }
    }
  },
  opts = {
    menu = {
      width = 100,
    }
  },
  config = function(_, opts)
    require("telescope").load_extension('harpoon')
    require('harpoon').setup(opts)
  end,
  keys = {
    { "<M-h>",      function() require("harpoon.ui").toggle_quick_menu() end, desc = "Harpoon: Toggle menu" },
    { "<leader>ha", function() require("harpoon.mark").add_file() end,        desc = "Harpoon: Add file" },
    { "<leader>hh", function() require("harpoon.ui").nav_file(1) end,         desc = "Harpoon: Nav file 1" },
    { "<leader>hj", function() require("harpoon.ui").nav_file(2) end,         desc = "Harpoon: Nav file 2" },
    { "<leader>hk", function() require("harpoon.ui").nav_file(3) end,         desc = "Harpoon: Nav file 3" },
    { "<leader>hl", function() require("harpoon.ui").nav_file(4) end,         desc = "Harpoon: Nav file 4" },
    { "<leader>hc", function() require("harpoon.mark").clear_all() end,       desc = "Harpoon: Clear all" }
  }
}
