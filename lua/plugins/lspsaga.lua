return {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    enabled = false,
    dependencies = {
        { "nvim-tree/nvim-web-devicons" }, -- Please make sure you install markdown and markdown_inline parser
        { "nvim-treesitter/nvim-treesitter" } },
    opts = {
        lightbulb = {
            enable = false,
        },
        symbol_in_winbar = {
            enable = false,
        },
    },
    config = function(_, opts)
        require('lspsaga').setup(opts)
        local keymap = vim.keymap.set

        -- LSP finder - Find the symbol's definition
        -- If there is no definition, it will instead be hidden
        -- When you use an action in finder like "open vsplit",
        -- you can use <C-t> to jump back
        keymap("n", "<leader>gh", "<cmd>Lspsaga lsp_finder<CR>", {
            desc = 'LSPSaga: Find the symbol\'s definition'
        })

        -- Code action
        keymap({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", {
            desc = 'LSPSaga: Code action'
        })

        -- Rename all occurrences of the hovered word for the entire file
        keymap("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", {
            desc = "LSPSaga: Rename all occurrences"
        })

        -- Rename all occurrences of the hovered word for the selected files
        keymap("n", "<leader>rN", "<cmd>Lspsaga rename ++project<CR>", {
            desc = "LSPSaga: Rename for selected files"
        })

        -- Peek definition
        -- You can edit the file containing the definition in the floating window
        -- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
        -- It also supports tagstack
        -- Use <C-t> to jump back
        keymap("n", "<leader>gd", "<cmd>Lspsaga peek_definition<CR>", {
            desc = 'LSPSaga: Peek type definition'
        })

        -- Go to definition
        keymap("n", "<leader>gD", "<cmd>Lspsaga goto_definition<CR>", {
            desc = 'LSPSaga: Go to definition'
        })

        -- Peek type definition
        -- You can edit the file containing the type definition in the floating window
        -- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
        -- It also supports tagstack
        -- Use <C-t> to jump back
        keymap("n", "<leader>gt", "<cmd>Lspsaga peek_type_definition<CR>", {
            desc = 'LSPSaga: Peek type definition'
        })

        -- Go to type definition
        keymap("n", "<leader>gT", "<cmd>Lspsaga goto_type_definition<CR>")

        -- Show line diagnostics
        -- You can pass argument ++unfocus to
        -- unfocus the show_line_diagnostics floating window
        keymap("n", "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>", {
            desc = 'LSPSaga: Show lide diagnostics'
        })

        -- Show buffer diagnostics
        keymap("n", "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>", {
            desc = 'LSPSaga: Show buffer diagnostics'
        })

        -- Show workspace diagnostics
        keymap("n", "<leader>sw", "<cmd>Lspsaga show_workspace_diagnostics<CR>", {
            desc = 'LSPSaga: Show workspace diagnostics'
        })

        -- Show cursor diagnostics
        keymap("n", "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>", {
            desc = 'LSPSaga: Show cursor diagnostics'
        })

        -- Diagnostic jump
        -- You can use <C-o> to jump back to your previous location
        keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", {
            desc = 'LSPSaga: Diagnostic jump previous'
        })
        keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", {
            desc = 'LSPSaga: Diagnostic jump next'
        })

        -- Diagnostic jump with filters such as only jumping to an error
        keymap("n", "[E", function()
            require("lspsaga.diagnostic"):goto_prev({
                severity = vim.diagnostic.severity.ERROR
            })
        end, {
            desc = 'LSPSaga: Diagnostic jump previous error'
        })
        keymap("n", "]E", function()
            require("lspsaga.diagnostic"):goto_next({
                severity = vim.diagnostic.severity.ERROR
            })
        end, {
            desc = 'LSPSaga: Diagnostic jump next error'
        })

        -- Toggle outline
        keymap("n", "<A-o>", "<cmd>Lspsaga outline<CR>", {
            desc = 'LSPSaga: Toggle outline'
        })

        -- Hover Doc
        -- If there is no hover doc,
        -- there will be a notification stating that
        -- there is no information available.
        -- To disable it just use ":Lspsaga hover_doc ++quiet"
        -- Pressing the key twice will enter the hover window
        keymap("n", "<leader>k", "<cmd>Lspsaga hover_doc<CR>", { desc = 'LSPSaga: Hover doc' })

        -- If you want to keep the hover window in the top right hand corner,
        -- you can pass the ++keep argument
        -- Note that if you use hover with ++keep, pressing this key again will
        -- close the hover window. If you want to jump to the hover window
        -- you should use the wincmd command "<C-w>w"
        keymap("n", "<leader>K", "<cmd>Lspsaga hover_doc ++keep<CR>", {
            desc = 'LSPSaga: Hover doc persistent'
        })

        -- Call hierarchy
        keymap("n", "<Leader>ic", "<cmd>Lspsaga incoming_calls<CR>", {
            desc = 'LSPSaga: Incoming calls'
        })
        keymap("n", "<Leader>oc", "<cmd>Lspsaga outgoing_calls<CR>", {
            desc = 'LSPSaga: Outgoing calls'
        })

        -- Floating terminal
        keymap({ "n", "t" }, "<A-d>", "<cmd>Lspsaga term_toggle<CR>", {
            desc = 'LSPSaga: Floating terminal'
        })
    end,
}
