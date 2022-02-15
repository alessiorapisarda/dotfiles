local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    Packer_bootstrap = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
    vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost pack.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})

return packer.startup(function(use)
    use("wbthomason/packer.nvim")

    -- Performance
    use("lewis6991/impatient.nvim")
    use("nathom/filetype.nvim")
    use("antoinemadec/FixCursorHold.nvim")

    -- Misc
    use("nvim-lualine/lualine.nvim")
    use("nvim-lua/plenary.nvim")
    use("tpope/vim-repeat")
    use("tpope/vim-fugitive")
    use("moll/vim-bbye")
    use("folke/which-key.nvim")
    use("nvim-telescope/telescope.nvim")
    use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
    use("nvim-telescope/telescope-file-browser.nvim")
    use("nvim-telescope/telescope-dap.nvim")
    use("lukas-reineke/indent-blankline.nvim")
    use("kyazdani42/nvim-tree.lua")
    use("kyazdani42/nvim-web-devicons")
    use("akinsho/bufferline.nvim")
    use("akinsho/toggleterm.nvim")
    use("goolord/alpha-nvim")
    use("ggandor/lightspeed.nvim")
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
    use("JoosepAlviste/nvim-ts-context-commentstring")
    use("dstein64/vim-startuptime")
    use("McAuleyPenney/tidy.nvim")
    use("lewis6991/gitsigns.nvim")
    use("numToStr/Comment.nvim")

    -- Colorschemes
    use("rose-pine/neovim")
    use("EdenEast/nightfox.nvim")
    use("folke/tokyonight.nvim")
    use("tanvirtin/monokai.nvim")
    use("sainnhe/sonokai")
    use("sainnhe/gruvbox-material")
    use("shaunsingh/moonlight.nvim")
    use("rebelot/kanagawa.nvim")
    use("ful1e5/onedark.nvim")
    use("marko-cerovac/material.nvim")
    use("catppuccin/nvim")

    -- LSP
    use("neovim/nvim-lspconfig")
    use("williamboman/nvim-lsp-installer")
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-cmdline")
    use("hrsh7th/cmp-nvim-lsp")
    use("L3MON4D3/LuaSnip")
    use("saadparwaiz1/cmp_luasnip")
    use("rafamadriz/friendly-snippets")
    use("onsails/lspkind-nvim")
    use("folke/trouble.nvim")
    use("jose-elias-alvarez/null-ls.nvim")
    use("windwp/nvim-autopairs")
    use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
    use("Pocco81/DAPInstall.nvim")

    -- use 'andweeb/presence.nvim'
    -- use 'ThePrimeagen/vim-be-good'

    if Packer_bootstrap then
        require("packer").sync()
    end
end)
