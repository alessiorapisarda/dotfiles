local M = {
    "folke/which-key.nvim",
    lazy = false,
}

function M.config()
    local status_ok, which_key = pcall(require, "which-key")
    if not status_ok then
        return
    end

    local setup = {
        plugins = {
            marks = true, -- shows a list of your marks on ' and `
            registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
            spelling = {
                enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
                suggestions = 20, -- how many suggestions should be shown in the list?
            },
            -- the presets plugin, adds help for a bunch of default keybindings in Neovim
            -- No actual key bindings are created
            presets = {
                operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
                motions = true, -- adds help for motions
                text_objects = true, -- help for text objects triggered after entering an operator
                windows = true, -- default bindings on <c-w>
                nav = true, -- misc bindings to work with windows
                z = true, -- bindings for folds, spelling and others prefixed with z
                g = true, -- bindings for prefixed with g
            },
        },
        -- add operators that will trigger motion and text object completion
        -- to enable all native operators, set the preset / operators plugin above
        -- operators = { gc = "Comments" },
        key_labels = {
            -- override the label used to display some keys. It doesn't effect WK in any other way.
            -- For example:
            -- ["<space>"] = "SPC",
            -- ["<cr>"] = "RET",
            -- ["<tab>"] = "TAB",
        },
        icons = {
            breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
            separator = "➜", -- symbol used between a key and it's label
            group = "+", -- symbol prepended to a group
        },
        popup_mappings = {
            scroll_down = "<c-d>", -- binding to scroll down inside the popup
            scroll_up = "<c-u>", -- binding to scroll up inside the popup
        },
        window = {
            border = "rounded", -- none, single, double, shadow
            position = "bottom", -- bottom, top
            margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
            padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
            winblend = 0,
        },
        layout = {
            height = { min = 4, max = 25 }, -- min and max height of the columns
            width = { min = 20, max = 50 }, -- min and max width of the columns
            spacing = 3, -- spacing between columns
            align = "left", -- align columns left, center or right
        },
        ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
        hidden = { "<silent>", "<cmd>", "<Cmd>", "<cr>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
        show_help = true, -- show help message on the command line when the popup is visible
        triggers = "auto", -- automatically setup triggers
        -- triggers = {"<leader>"} -- or specify a list manually
        triggers_blacklist = {
            -- list of mode / prefixes that should never be hooked by WhichKey
            -- this is mostly relevant for key maps that start with a native binding
            -- most people should not need to change this
            i = { "j", "k" },
            v = { "j", "k" },
        },
    }

    local opts = {
        mode = "n", -- NORMAL mode
        prefix = "<leader>",
        buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
        silent = true, -- use `silent` when creating keymaps
        noremap = true, -- use `noremap` when creating keymaps
        nowait = true, -- use `nowait` when creating keymaps
    }

    local mappings = {
        ["a"] = { "<cmd>Alpha<cr>", "Dashboard" },
        ["w"] = { "<cmd>w<cr>", "Save" },
        ["q"] = { "<cmd>q!<cr>", "Quit" },
        ["h"] = { "<cmd>nohlsearch<cr>", "No Highlight" },

        t = {
            name = "Nvim-Tree",
            t = { "<cmd>NvimTreeToggle<cr>", "Nvim-tree" },
        },

        p = {
            name = "Lazy",
            i = { "<cmd>Lazy<cr>", "Status" },
            s = { "<cmd>Lazy sync<cr>", "Sync" },
            S = { "<cmd>Lazy install<cr>", "Install" },
            u = { "<cmd>Lazy update<cr>", "Update" },
        },

        b = {
            name = "Bufferline",
            c = { "<cmd>Bdelete!<cr>", "Close Buffer" },
            p = { "<cmd>BufferLinePick<cr>", "Pick Buffer" },
            n = { "<cmd>BufferLinePickClose<cr>", "Pick Buffer Close" },
            l = { "<cmd>BufferLineCycleNext<cr>", "Buffer Cycle Next" },
            h = { "<cmd>BufferLineCyclePrev<cr>", "Buffer Cycle Previous" },
            ["1"] = { "<cmd>BufferLineGoToBuffer 1<cr>", "Buffer 1" },
            ["2"] = { "<cmd>BufferLineGoToBuffer 2<cr>", "Buffer 2" },
            ["3"] = { "<cmd>BufferLineGoToBuffer 3<cr>", "Buffer 3" },
            ["4"] = { "<cmd>BufferLineGoToBuffer 4<cr>", "Buffer 4" },
            ["5"] = { "<cmd>BufferLineGoToBuffer 5<cr>", "Buffer 5" },
            ["6"] = { "<cmd>BufferLineGoToBuffer 6<cr>", "Buffer 6" },
            ["7"] = { "<cmd>BufferLineGoToBuffer 7<cr>", "Buffer 7" },
            ["8"] = { "<cmd>BufferLineGoToBuffer 8<cr>", "Buffer 8" },
            ["9"] = { "<cmd>BufferLineGoToBuffer 9<cr>", "Buffer 9" },
        },

        f = {
            name = "Telescope",
            f = {
                "<cmd>Telescope find_files find_command=rg,--files,--follow prompt_prefix=🔍<cr>",
                "Find Files",
            },
            h = {
                "<cmd>Telescope find_files find_command=rg,--files,--hidden prompt_prefix=🔍<cr>",
                "Find Hidden Files",
            },
            r = { "<cmd>Telescope registers<cr>", "Find Registers" },
            m = { "<cmd>Telescope marks<cr>", "Find Marks" },
            b = { "<cmd>Telescope buffers<cr>", "Find Buffers" },
            u = { "<cmd>Telescope oldfiles<cr>", "Old Files" },
            t = { "<cmd>Telescope file_browser<cr>", "File Browser" },
            g = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
        },

        l = {
            name = "LSP",
            a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
            c = {
                "<cmd>lua vim.lsp.buf.implementation()<cr>",
                "Implementation",
            },
            d = {
                "<cmd>lua vim.lsp.buf.declaration()<cr>",
                "Declaration",
            },
            D = {
                "<cmd>lua vim.lsp.buf.definition()<cr>",
                "Definition",
            },
            f = { "<cmd>lua vim.lsp.buf.format { async = true }<cr>", "Format" },
            i = { "<cmd>LspInfo<cr>", "Info" },
            I = { "<cmd>Mason<cr>", "Installer Info" },
            j = {
                "<cmd>lua vim.diagnostic.goto_next()<cr>",
                "Next Diagnostic",
            },
            k = {
                "<cmd>lua vim.diagnostic.goto_prev()<cr>",
                "Previous Diagnostic",
            },
            K = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover" },
            l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
            o = { "<cmd>SymbolsOutline<cr>", "Symbols Outline" },
            q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
            r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
            R = { "<cmd>lua vim.lsp.buf.references()<cr>", "References" },
            s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
            S = {
                "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
                "Workspace Symbols",
            },
        },

        x = {
            name = "Trouble",
            x = { "<cmd>TroubleToggle<cr>", "Toggle" },
            w = {
                "<cmd>TroubleToggle workspace_diagnostics<cr>",
                "Workspace Diagnostics",
            },
            d = {
                "<cmd>TroubleToggle document_diagnostics<cr>",
                "Document Diagnotics",
            },
            q = { "<cmd>TroubleToggle quickfix<cr>", "Quickfix" },
            l = { "<cmd>TroubleToggle loclist<cr>", "Loc List" },
            r = { "<cmd>TroubleToggle lsp_references<cr>", "References" },
        },

        j = {
            name = "ToggleTerm",
            j = { "<cmd>ToggleTerm<cr>", "Toggle" },
            h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
            v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
        },

        g = {
            name = "Git",
            j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
            k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
            l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
            p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
            r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
            R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
            s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
            u = {
                "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
                "Undo Stage Hunk",
            },
            o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
            b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
            c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
            d = {
                "<cmd>Gitsigns diffthis HEAD<cr>",
                "Diff",
            },
        },

        o = {
            name = "Overseer",
            o = { "<cmd>OverseerToggle<cr>", "Toggle" },
            r = { "<cmd>OverseerRun<cr>", "Run" },
            b = { "<cmd>OverseerBuild<cr>", "Build" },
        },

        d = {
            name = "DAP",
            ["<F4>"] = { "<cmd>lua require('dapui').toggle()<cr>", "UI Toggle" },
            ["<F5>"] = {
                "<cmd>lua require('dap').toggle_breakpoint()<cr>",
                "Toggle Breakpoint",
            },
            ["<F9>"] = { "<cmd>lua require('dap').continue()<cr>", "Continue" },
            ["<F1>"] = { "<cmd>lua require('dap').step_over()<cr>", "Step Over" },
            ["<F2>"] = { "<cmd>lua require('dap').step_into()<cr>", "Step Into" },
            ["<F3>"] = { "<cmd>lua require('dap').step_out()<cr>", "Step Out" },
            h = { "<cmd>lua require('dap.ui.variables').hover()<cr>", "UI Hover" },
            v = {
                "<cmd>lua require('dap.ui.variables').visual_hover()<cr>",
                "UI Visual Hover",
            },
            s = { "<cmd>lua require('dap.ui.variables').scopes()<cr>", "Scopes" },
        },
    }

    which_key.setup(setup)
    which_key.register(mappings, opts)
end

return M