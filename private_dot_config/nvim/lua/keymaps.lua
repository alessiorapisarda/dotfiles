local function map(mode, lhs, rhs)
    opts = opts or { noremap = true, silent = true }
    return vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end

local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
end

-- Enable completion triggered by <c-x><c-o>
buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

map("", "<Space>", "<Nop>")
map("n", "<A-l>", [[<cmd>noh<cr>]])
map("n", "<leader>w", [[<cmd>w<CR>]])

-- Indenting in Visual mode
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Better window navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- bufferline
map("n", "<A-c>", [[<cmd>bd<CR>]])
map("n", "<A-p>", [[<cmd>BufferLinePick<CR>]])
map("n", "<A-n>", [[<cmd>BufferLinePickClose<CR>]])
map("n", "<A-1>", [[<cmd>BufferLineGoToBuffer 1<CR>]])
map("n", "<A-2>", [[<cmd>BufferLineGoToBuffer 2<CR>]])
map("n", "<A-3>", [[<cmd>BufferLineGoToBuffer 3<CR>]])
map("n", "<A-4>", [[<cmd>BufferLineGoToBuffer 4<CR>]])
map("n", "<A-5>", [[<cmd>BufferLineGoToBuffer 5<CR>]])
map("n", "<A-6>", [[<cmd>BufferLineGoToBuffer 6<CR>]])
map("n", "<A-7>", [[<cmd>BufferLineGoToBuffer 7<CR>]])
map("n", "<A-8>", [[<cmd>BufferLineGoToBuffer 8<CR>]])
map("n", "<A-9>", [[<cmd>BufferLineGoToBuffer 9<CR>]])

-- nvim-dap
map("n", "<F4>", ":lua require('dapui').toggle()<CR>")
map("n", "<F5>", ":lua require('dap').toggle_breakpoint()<CR>")
map("n", "<F9>", ":lua require('dap').continue()<CR>")
map("n", "<F1>", ":lua require('dap').step_over()<CR>")
map("n", "<F2>", ":lua require('dap').step_into()<CR>")
map("n", "<F3>", ":lua require('dap').step_out()<CR>")
map("n", "<Leader>dsc", ":lua require('dap').continue()<CR>")
map("n", "<Leader>dsv", ":lua require('dap').step_over()<CR>")
map("n", "<Leader>dsi", ":lua require('dap').step_into()<CR>")
map("n", "<Leader>dso", ":lua require('dap').step_out()<CR>")
map("n", "<Leader>dhh", ":lua require('dap.ui.variables').hover()<CR>")
map("v", "<Leader>dhv", ":lua require('dap.ui.variables').visual_hover()<CR>")
map("n", "<Leader>duh", ":lua require('dap.ui.widgets').hover()<CR>")
map("n", "<Leader>duf", ":lua local widgets=require('dap.ui.widgets');widgets.centered_float(widgets.scopes)<CR>")
map("n", "<Leader>dro", ":lua require('dap').repl.open()<CR>")
map("n", "<Leader>drl", ":lua require('dap').repl.run_last()<CR>")
map("n", "<Leader>dbc", ":lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
map("n", "<Leader>dbm", ":lua require('dap').set_breakpoint({ nil, nil, vim.fn.input('Log point message: ') })<CR>")
map("n", "<Leader>dbt", ":lua require('dap').toggle_breakpoint()<CR>")
map("n", "<Leader>dc", ":lua require('dap.ui.variables').scopes()<CR>")
map("n", "<Leader>di", ":lua require('dapui').toggle()<CR>")

-- Telescope
map("n", "<leader>ff", [[<cmd>Telescope find_files find_command=ag,--vimgrep,--follow,--filename-pattern<CR>]])
map("n", "<leader>fh", [[<cmd>Telescope find_files find_command=ag,--vimgrep,--hidden,--filename-pattern<CR>]])
map("n", "<leader>fb", [[<cmd>Telescope buffers<CR>]])
map("n", "<leader>fu", [[<cmd>Telescope oldfiles<CR>]])
map("n", "<leader>ft", [[<cmd>Telescope file_browser<CR>]])
map("n", "<leader>fg", [[<cmd>Telescope live_grep<CR>]])
map("n", "<leader>fr", [[<cmd>Telescope registers<CR>]])
map("n", "<leader>fm", [[<cmd>Telescope marks<CR>]])

-- nvim-tree
map("n", "<leader>tt", [[<cmd>NvimTreeToggle<CR>]])
map("n", "<leader>tr", [[<cmd>NvimTreeRefresh<CR>]])
map("n", "<leader>tf", [[<cmd>NvimTreeFindFile<CR>]])

-- Alpha
map("n", "<leader>a", [[<cmd>Alpha<CR>]])

-- Trouble
map("n", "<leader>xx", [[<cmd>TroubleToggle<CR>]])
map("n", "<leader>xw", [[<cmd>TroubleToggle workspace_diagnostics<CR>]])
map("n", "<leader>xd", [[<cmd>TroubleToggle document_diagnostics<CR>]])
map("n", "<leader>xq", [[<cmd>TroubleToggle quickfix<CR>]])
map("n", "<leader>xl", [[<cmd>TroubleToggle loclist<CR>]])
map("n", "<leader>xr", [[<cmd>TroubleToggle lsp_references<CR>]])

-- Gitsigns
--- Navigation
map("n", "]c", "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true })
map("n", "[c", "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true })

--- Actions
map("n", "<leader>hs", ":Gitsigns stage_hunk<CR>")
map("v", "<leader>hs", ":Gitsigns stage_hunk<CR>")
map("n", "<leader>hr", ":Gitsigns reset_hunk<CR>")
map("v", "<leader>hr", ":Gitsigns reset_hunk<CR>")
map("n", "<leader>hS", "<cmd>Gitsigns stage_buffer<CR>")
map("n", "<leader>hu", "<cmd>Gitsigns undo_stage_hunk<CR>")
map("n", "<leader>hR", "<cmd>Gitsigns reset_buffer<CR>")
map("n", "<leader>hp", "<cmd>Gitsigns preview_hunk<CR>")
map("n", "<leader>hb", '<cmd>lua require"gitsigns".blame_line{full=true}<CR>')
map("n", "<leader>tb", "<cmd>Gitsigns toggle_current_line_blame<CR>")
map("n", "<leader>hd", "<cmd>Gitsigns diffthis<CR>")
map("n", "<leader>hD", '<cmd>lua require"gitsigns".diffthis("~")<CR>')
map("n", "<leader>td", "<cmd>Gitsigns toggle_deleted<CR>")

-- LSP
map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
map("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
map("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>")
map("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>")
map("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>")
map("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
map("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
map("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
map("n", "<space>e", "<cmd>lua vim.diagnostic.open_float()<CR>")
map("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
map("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>")
map("n", "<space>q", "<cmd>lua vim.diagnostic.setloclist()<CR>")
map("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>")
