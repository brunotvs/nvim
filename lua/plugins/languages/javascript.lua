TableInsert(LspServers, {
  angularls = {
    root_dir = function(fname)
      return require('lspconfig.util').root_pattern('angular.json', 'project.json')(fname)
    end,
  },
  tsserver = {},
  eslint = {
    on_attach = function(client, bufnr)
      client.server_capabilities.documentFormattingProvider = true
    end
  },
  jsonls = {
    settings = {
      json = {
        format = {
          enable = false,
        },
        validate = { enable = true },
      },
    },
  }
})
TableInsert(ServersToFilterFromFormat, { 'tsserver', 'jsonls' })
TableInsert(MasonEnsureInstalled, { "js-debug-adapter", "prettierd", 'eslint_d', 'nxls' })
TableInsert(TreesitterEnsureInstalled, { "javascript", 'jsdoc', 'jsonc', 'jsonc' })
TableInsert(NeotestAdapters, {
  ["neotest-jest"] = {
    jestCommand = "npm run jest -- --coverage",
    cwd = function()
      require('lspconfig.util').root_pattern('nx.json', 'package-lock.json', '.git')
    end
    ,
  }
})

return {
  {
    "mfussenegger/nvim-dap",
    optional = true,
    dependencies = {
      {
        "williamboman/mason.nvim",
      },
    },
    opts = function()
      local dap = require("dap")
      if not dap.adapters["pwa-node"] then
        require("dap").adapters["pwa-node"] = {
          type = "server",
          host = "localhost",
          port = "${port}",
          executable = {
            command = "node",
            -- 💀 Make sure to update this path to point to your installation
            args = {
              require("mason-registry").get_package("js-debug-adapter"):get_install_path()
              .. "/js-debug/src/dapDebugServer.js",
              "${port}",
            },
          },
        }
      end
      for _, language in ipairs({ "typescript", "javascript" }) do
        if not dap.configurations[language] then
          dap.configurations[language] = {
            {
              type = "pwa-node",
              request = "launch",
              name = "Launch file",
              program = "${file}",
              cwd = "${workspaceFolder}",
            },
            {
              type = "pwa-node",
              request = "attach",
              name = "Attach",
              processId = require("dap.utils").pick_process,
              cwd = "${workspaceFolder}",
            },
          }
        end
      end
    end,
  },
  {
    "nvim-neotest/neotest-jest",
    dependencies = {
      {
        "nvim-neotest/neotest",
      },
    },
    ft = { 'typescript', 'javascript' }
  },
  {
    'stevearc/conform.nvim',
    dependencies = {
      {
        "williamboman/mason.nvim",
      },
    },
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
      formatters_by_ft = {
        javascript = { "prettierd" },
        typescript = { "prettierd" },
        javascriptreact = { "prettierd" },
        typescriptreact = { "prettierd" },
        json = { "prettierd" },
        jsonc = { "prettierd" }
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-angular",
    enabled = false,
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  }
  -- {
  --   'mfussenegger/nvim-lint',
  --   dependencies = {
  --     {
  --       "williamboman/mason.nvim",
  --     },
  --   },
  --   event = { 'BufReadPre', 'BufNewFile' },
  --   opts = {
  --     linters_by_ft = {
  --       javascript = { "eslint_d" },
  --       typescript = { "eslint_d" },
  --       javascriptreact = { "eslint_d" },
  --       typescriptreact = { "eslint_d" },
  --     }
  --   }
  -- }
}
