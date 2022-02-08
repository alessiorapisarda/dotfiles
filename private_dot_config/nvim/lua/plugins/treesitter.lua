local status_ok, treesitter = pcall(require, "nvim-treesitter")
if not status_ok then
    return
end

treesitter.setup({
    ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
    highlight = {
        enable = true, -- false will disable the whole extension
        additional_vim_regex_highlighting = true,
    },
    indent = {
        enable = true,
    },
    context_commentstring = {
        enable = true,
    },
    autopairs = {
        enable = true,
    },
})
