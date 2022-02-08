local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
    return
end

vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

indent_blankline.setup({
    buftype_exclude = { "terminal", "nofile", "alpha" },
    filetype_exclude = { "dashboard", "NvimTree" },
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = false,
    context_patterns = {
        "class",
        "return",
        "function",
        "method",
        "^if",
        "^while",
        "jsx_element",
        "^for",
        "^object",
        "^table",
        "block",
        "arguments",
        "if_statement",
        "else_clause",
        "jsx_element",
        "jsx_self_closing_element",
        "try_statement",
        "catch_clause",
        "import_statement",
        "operation_type",
    },
    indent_blankline_use_treesitter = true,
})
