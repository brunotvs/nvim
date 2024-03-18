-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

-- NOTE: Here is where you install your plugins.
--  You can configure plugins using the `config` key.
--
--  You can also configure plugins after the setup call,
--    as they will be available in your neovim runtime.
require('lazy').setup({
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  checker = {
    enabled = true,
    notify = false,
  },
  concurrency = 4,
  spec = {
    { import = 'plugins' },
    { import = 'plugins.languages' },
  },
})

vim.keymap.set('n', '<M-l>', vim.cmd.Lazy, { desc = 'Lazy: Menu' })
vim.keymap.set('n', '<leader>lu', function()
  require('lazy').update({ show = false })
end, { desc = 'Lazy: update plugins' })

local function udapteOutdatedPlugins()
  local lazy_status = require('lazy.status').has_updates()

  if not lazy_status then
    return
  end
  local updated_plugins = require('lazy.manage.checker').updated

  local plural = #updated_plugins > 1 and 's' or ''
  vim.notify('Updating ' .. #updated_plugins .. ' plugin' .. plural)

  local lazy = require('lazy')

  lazy.update({
    show = false,
    plugins = updated_plugins,
  })
end

local group = vim.api.nvim_create_augroup('LazyVim', { clear = true })
vim.api.nvim_create_autocmd('User', {
  group = group,
  pattern = 'LazyCheck',
  desc = 'Update lazy plugins if no breaking changes',
  callback = udapteOutdatedPlugins,
})

vim.api.nvim_create_autocmd('User', {
  group = group,
  pattern = 'LazyDone',
  desc = 'Update lazy plugins if no breaking changes',
  callback = udapteOutdatedPlugins,
})
