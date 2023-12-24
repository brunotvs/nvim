return {
  "brenoprata10/nvim-highlight-colors",

  keys = { {
    "<A-c>",
    function() require("nvim-highlight-colors").toggle() end,
    desc = "Neotest: Run File"
  }
  }
}
