-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set('n', '$', "v:count == 0 ? 'g$' : '$'", { expr = true, silent = true })
vim.keymap.set('n', '0', "v:count == 0 ? 'g0' : '0'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', function()
  vim.diagnostic.jump({ count = -1 })
end, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', function()
  vim.diagnostic.jump({ count = 1 })
end, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move selection down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move selection up' })

vim.keymap.set('n', 'J', 'mzJ`z', { desc = 'Remove line break' })
vim.keymap.set('n', 'K', 'i<cr><Esc>', { desc = 'Breaks line before' })
-- vim.keymap.set("n", "<C-M-k>", "a<cr><Esc>", { desc = 'Breaks line after' })
vim.keymap.set('n', '<leader>o', ":<c-u>put =repeat([''],v:count)<bar>'[-1<cr>", { desc = 'Add line above', silent = true })
vim.keymap.set('n', '<leader>O', ":<c-u>put!=repeat([''],v:count)<bar>']+1<cr>", { desc = 'Add line below', silent = true })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Down half a page' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Up half a page' })
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Next search match' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Previous search match' })

vim.keymap.set('n', '<leader>bn', vim.cmd.bnext, { desc = 'Next buffer' })
vim.keymap.set('n', '<leader>bp', vim.cmd.bnext, { desc = 'Previous buffer' })
vim.keymap.set('n', '<leader>bd', vim.cmd.bdelete, { desc = 'Delete buffer' })
vim.keymap.set('n', '<leader>bod', function()
  local current_buffer = vim.api.nvim_get_current_buf()
  local buffers = vim.api.nvim_list_bufs()
  local count = 0
  for _, bufnr in ipairs(buffers) do
    local listed = vim.fn.buflisted(bufnr) == 1
    if listed and bufnr ~= current_buffer then
      count = count + 1
      local clients = vim.lsp.get_clients({ bufnr = bufnr })
      for _, client in ipairs(clients) do
        if not vim.lsp.buf_is_attached(current_buffer, client.id) then
          vim.lsp.stop_client(client.id)
        end
      end
      vim.cmd.bdelete(bufnr)
    end
  end
  local bufstr = count == 1 and ' buffer ' or ' buffers '
  vim.print(count .. bufstr .. 'deleted')
end, { desc = 'Delete every other listed buffer' })

vim.keymap.set('n', '<leader>bD', '<cmd>:bdelete!<CR>', { desc = 'Delete buffer' })

-- ThePrimeagen keymaps
-- greatest remap ever
vim.keymap.set('x', '<leader>p', [["_dP]], { desc = 'Paste without replacing' })

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]], { desc = 'Yank to OS register' })
vim.keymap.set('n', '<leader>Y', [["+Y]], { desc = 'Yank until end of line to OS register' })

vim.keymap.set({ 'n', 'v' }, '<leader>d', [["_d]], { desc = 'Delete without copying to register' })
vim.keymap.set({ 'n', 'v' }, '<leader>D', [["_D]], { desc = 'Delete until end of line without copying to register' })

-- This is going to get me cancelled
vim.keymap.set('i', '<C-c>', '<Esc>')

vim.keymap.set('n', 'Q', '<nop>')

vim.keymap.set('n', '<C-n>', '<cmd>cnext<CR>zz', { desc = 'Next quickfix list' })
vim.keymap.set('n', '<C-p>', '<cmd>cprev<CR>zz', { desc = 'Previous quickfix list' })
vim.keymap.set('n', '[k', '<cmd>lnext<CR>zz', { desc = 'Next location list' })
vim.keymap.set('n', '[j', '<cmd>lprev<CR>zz', { desc = 'Previous location list' })

vim.keymap.set('n', '<leader>*', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], {
  desc = 'Replace all ocurrencies',
})
vim.keymap.set('n', '<leader>X', '<cmd>!chmod +x %<CR>', { silent = true, desc = 'Make current file runnable' })
