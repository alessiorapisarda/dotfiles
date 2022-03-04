vim.opt.termguicolors = true

local rosepine_status_ok, p = pcall(require, "rose-pine.palette")
if not rosepine_status_ok then
    return
end
local moonlight_status_ok, moonlight = pcall(require, "moonlight")
if not moonlight_status_ok then
    return
end

local catpuccin_status_ok, catppuccin = pcall(require, "catppuccin")
if not catpuccin_status_ok then
    return
end

local monokai_status_ok, monokai = pcall(require, "monokai")
if not monokai_status_ok then
    return
end

-- Rose Pine
-- Set theme variant
-- Matches terminal theme if unset
-- @usage 'main' | 'moon' | 'dawn'

-- vim.g.rose_pine_bold_vertical_split_line = false
-- vim.g.rose_pine_inactive_background = false
-- vim.g.rose_pine_disable_background = false
-- vim.g.rose_pine_disable_float_background = false
-- vim.g.rose_pine_disable_italics = false
--
-- local p = require('rose-pine.palette')
-- vim.g.rose_pine_colors = {
-- 	punctuation = p.subtle,
-- 	comment = p.subtle,
-- 	hint = p.iris,
-- 	info = p.foam,
-- 	warn = p.gold,
-- 	error = p.love,
--
-- 	-- Or set all headings to one colour: `headings = p.text`
-- 	headings = {
-- 		h1 = p.iris,
-- 		h2 = p.foam,
-- 		h3 = p.rose,
-- 		h4 = p.gold,
-- 		h5 = p.pine,
-- 		h6 = p.foam,
-- 	},
-- }

-- Monokai
-- monokai.setup {}
-- monokai.setup { palette = monokai.pro }
-- monokai.setup { palette = monokai.soda }

-- Gruvbox Material
-- vim.g.gruvbox_material_palette = 'material'
-- vim.g.gruvbox_material_statusline_style = 'material'
-- vim.g.gruvbox_materialbackground = 'medium'
-- vim.g.gruvbox_material_diagnostic_text_highlight = 1
-- vim.g.gruvbox_material_diagnostic_line_highlight = 1
-- vim.g.gruvbox_material_better_performance = 1
-- vim.cmd('colorscheme gruvbox-material')

-- Moonlight
-- moonlight.set()

-- Catppuccin
catppuccin.setup({
    transparent_background = false,
    term_colors = false,
    styles = {
        comments = "italic",
        functions = "italic",
        keywords = "italic",
        strings = "NONE",
        variables = "italic",
    },
    integrations = {
        treesitter = true,
        native_lsp = {
            enabled = true,
            virtual_text = {
                errors = "italic",
                hints = "italic",
                warnings = "italic",
                information = "italic",
            },
            underlines = {
                errors = "underline",
                hints = "underline",
                warnings = "underline",
                information = "underline",
            },
        },
        lsp_trouble = true,
        cmp = true,
        lsp_saga = false,
        gitgutter = false,
        gitsigns = true,
        telescope = true,
        nvimtree = {
            enabled = true,
            show_root = false,
            transparent_panel = false,
        },
        neotree = {
            enabled = false,
            show_root = false,
            transparent_panel = false,
        },
        which_key = true,
        indent_blankline = {
            enabled = true,
            colored_indent_levels = false,
        },
        dashboard = false,
        neogit = false,
        vim_sneak = false,
        fern = false,
        barbar = false,
        bufferline = true,
        markdown = false,
        lightspeed = true,
        ts_rainbow = false,
        hop = false,
        notify = false,
        telekasten = false,
    },
})
vim.cmd([[colorscheme catppuccin]])

-- Tokyonight
-- vim.g.tokyonight_style = "night"
-- vim.cmd('colorscheme tokyonight')
