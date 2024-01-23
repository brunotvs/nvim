-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move selection down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move selection up' })

vim.keymap.set('n', 'J', 'mzJ`z', { desc = 'Remove line break' })
vim.keymap.set('n', 'K', 'i<cr><Esc>', { desc = 'Breaks line before' })
-- vim.keymap.set("n", "<C-M-k>", "a<cr><Esc>", { desc = 'Braks line after' })
-- vim.keymap.set("n", "<c-o>", "o<Esc>", { desc = 'Add line below' })
-- vim.keymap.set("n", "<C-M-o>", "O<Esc>", { desc = 'Add line above' })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Down half a page' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Up half a page' })
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Next search match' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Previous search match' })

vim.keymap.set('n', '<leader>bn', vim.cmd.bnext, { desc = 'Next buffer' })
vim.keymap.set('n', '<leader>bp', vim.cmd.bnext, { desc = 'Previous buffer' })
vim.keymap.set('n', '<leader>bd', vim.cmd.bdelete, { desc = 'Delete buffer' })
vim.keymap.set('n', '<leader>bod', '<cmd>:%bd|e#<CR>', { desc = 'Delete every other buffer' })
vim.keymap.set('n', '<leader>bD', '<cmd>:bdelete!<CR>', { desc = 'Delete buffer' })

-- ThePrimeagen keymaps
-- greatest remap ever
vim.keymap.set('x', '<leader>p', [["_dP]], { desc = 'Paste without replacing' })

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]], { desc = 'Yank to OS register' })
vim.keymap.set('n', '<leader>Y', [["+Y]], { desc = 'Yank until end of line to OS register' })

vim.keymap.set({ 'n', 'v' }, '<leader>d', [["_d]], { desc = 'Delete without copying to register' })

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
