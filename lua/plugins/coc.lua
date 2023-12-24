return {
  'neoclide/coc.nvim',
  branch = 'release',
  config = function()
    vim.g.coc_global_extensions = { 'coc-git', 'coc-json', 'coc-pyright' }
  end,
  enabled = false
}
