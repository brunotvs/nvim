--- @type LazySpec
return {
  'brenoprata10/nvim-highlight-colors',

  keys = { {
    '<M-c>',
    function()
      require('nvim-highlight-colors').toggle()
    end,
    desc = 'Neotest: Run File',
  } },
}
