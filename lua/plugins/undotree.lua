--- @type LazySpec
return {
  'mbbill/undotree',
  config = function()
    --  if set, let undotree window get focus after being opened, otherwise
    --  focus will stay in current window.
    if vim.g.undotree_SetFocusWhenToggle then
      vim.g.undotree_SetFocusWhenToggle = 1
    end
  end,
  keys = {

    { '<M-u>', vim.cmd.UndotreeToggle, desc = 'UndoTree: Toggle', mode = { 'n', 'v' } },
  },
}
