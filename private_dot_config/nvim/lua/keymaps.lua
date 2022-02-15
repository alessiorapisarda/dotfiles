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
map("n", "<leader>s", [[<cmd>w<CR>]])

-- Indenting in Visual mode
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Better window navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")
