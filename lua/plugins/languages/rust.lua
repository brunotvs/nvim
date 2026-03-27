TreesitterEnsureInstalled = vim.list_extend(TreesitterEnsureInstalled, { 'rust' })
MasonEnsureInstalled = vim.list_extend(MasonEnsureInstalled, { 'codelldb' })
NeotestAdapters = vim.tbl_extend('force', NeotestAdapters, { ['rustaceanvim.neotest'] = {} })

--- @type LazySpec
return {
  {
    'mrcjkb/rustaceanvim',
    version = '^5', -- Recommended
    lazy = false, -- This plugin is already lazy
    dependecies = {
      'nvim-neotest/neotest',
    },
    init = function(_)
      --- @type rustaceanvim.Opts
      ---NOTE: for rustaceanvim lsp implementation
      vim.g.rustaceanvim = {
        --- @type rustaceanvim.lsp.ClientOpts
        server = {
          on_attach = function(client, bufnr)
            OnAttach(client, bufnr)
            vim.keymap.set('n', '<leader>me', ':RustLsp expandMacro<CR>', { desc = 'Expand rust macro' })
          end,
          default_settings = {
            ['rust-analyzer'] = {
              runnables = {
                extraTestBinaryArgs = {
                  '--nocapture',
                },
              },
            },
          },
        },
      }
    end,
  },
}
