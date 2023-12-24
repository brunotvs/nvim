return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", },
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  config = function(_, opts)
    require('trouble').setup(opts)

    vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end, { desc = 'Trouble: Toggle' })
    vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end,
      { desc = 'Trouble: Workspace diagnostics' })
    vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end,
      { desc = 'Trouble: Document diagnostics' })
    vim.keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end,
      { desc = 'Trouble: Quickfix' })
    vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end, { desc = 'Trouble: Loclist' })
    vim.keymap.set("n", "<leader>xR", function() require("trouble").toggle("lsp_references") end,
      { desc = 'Trouble: Lsp references' })
  end
}
