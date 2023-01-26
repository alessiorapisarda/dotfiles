return {
    {
        "nvim-lualine/lualine.nvim",
        event = "VimEnter",
        opts = {
            options = {
                icons_enabled = true,
                theme = "catppuccin",
                component_separators = { left = "", right = "" },
                section_separators = { left = "", right = "" },
                disabled_filetypes = { statusline = { "alpha" } },
                always_divide_middle = true,
                globalstatus = true,
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = {
                    "branch",
                    "diff",
                    { "diagnostics", sources = { "nvim_diagnostic" } },
                },
                lualine_c = { "filename" },
                lualine_x = { "filetype" },
                lualine_y = { "progress" },
                lualine_z = { "location" },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { "filename" },
                lualine_x = { "location" },
                lualine_y = {},
                lualine_z = {},
            },
            tabline = {},
            extensions = { "nvim-tree", "symbols-outline", "toggleterm", "nvim-dap-ui" },
        },
        config = function(_, opts)
            require("lualine").setup(opts)
        end,
    },
}
