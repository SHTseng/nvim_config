local util = require("utils")
local require = util.require

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " " -- make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup({
    -- Detect tabstop and shiftwidth automatically
    'tpope/vim-sleuth',
    -- "gc" to comment visual regions/lines
    { 'numToStr/Comment.nvim', opts = {} },
    'morhetz/gruvbox',
    {
        'rebelot/kanagawa.nvim',
        lazy = false,
        config = true
    },
    'folke/tokyonight.nvim',
    {
        'nvim-tree/nvim-web-devicons',
        event = 'BufRead'
    },
    {
        'nvim-lualine/lualine.nvim',
        event = 'VeryLazy',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    'lukas-reineke/indent-blankline.nvim',
    'tpope/vim-sleuth',
    {
        'nvim-telescope/telescope.nvim',
        event = 'VeryLazy',
        branch = '0.1.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make',
                cond = vim.fn.executable 'make' == 1
            },
            { 'nvim-telescope/telescope-ui-select.nvim' },
        },
        config = function()
            require('config.telescope')
            -- Enable telescope extensions, if they are installed
            --	    pcall(require('config.telescope').load_extension, 'fzf')
            --	    pcall(require('config.telescope').load_extension, 'ui-select')
        end,
    },
    {
        'nvim-neo-tree/neo-tree.nvim',
        -- cmd = 'Neotree',
        branch = 'v3.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-tree/nvim-web-devicons',
            'MunifTanjim/nui.nvim'
        },
        config = function() require('config.neotree') end
    },
    {
        'nvim-treesitter/nvim-treesitter',
        branch = 'main',
        lazy = false,
        build = ':TSUpdate',
        config = function() require('config.treesitter') end
    },
    {
        'saghen/blink.cmp',
        event = 'InsertEnter',
        version = '1.*',
        dependencies = {
            'rafamadriz/friendly-snippets',
            'L3MON4D3/LuaSnip',
        },
        opts = {
            keymap = { preset = 'default' },
            snippets = { preset = 'luasnip' },
            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer' },
            },
            completion = {
                documentation = { auto_show = true, auto_show_delay_ms = 200 },
                list = { selection = { preselect = false, auto_insert = false } },
            },
            signature = { enabled = true },
            appearance = { nerd_font_variant = 'mono' },
        },
    },
    {
        'L3MON4D3/LuaSnip',
        dependencies = {
            'rafamadriz/friendly-snippets'
        },
        config = function() require('config.luasnip') end
    },
    {
        'folke/trouble.nvim',
        cmd = { 'TroubleToggle', 'Trouble' },
        opts = {
            auto_open = false,
            use_diagnostic_signs = true,
        },
    },
    {
        'williamboman/mason.nvim',
        cmd = {
            'Mason',
            'MasonInstall',
            'MasonUninstall',
            'MasonUninstallAll',
            'MasonLog'
        },
        config = function() require('config.mason') end,
    },
    {
        'stevearc/conform.nvim',
        event = { 'BufWritePre' },
        cmd = { 'ConformInfo' },
        config = function() require('config.conform') end,
    },
    {
        'neovim/nvim-lspconfig',
        event = "BufReadPre",
        dependencies = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            'WhoIsSethDaniel/mason-tool-installer.nvim',
            'saghen/blink.cmp',
            { 'j-hui/fidget.nvim', opts = {} },
        },
        config = function() require('config.lsp') end,
    },
    { 'folke/which-key.nvim' },
    {
        'karb94/neoscroll.nvim',
        keys = { '<C-u>', '<C-d>', 'gg', 'G' },
        config = function() require('config.neoscroll') end
    },
    {
        'windwp/nvim-autopairs',
        event = 'InsertEnter',
        opts = {},
    }
})

local disabled_built_ins = {
    "gzip",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "rrhelper",
    "spellfile_plugin",
    "netrwPlugin"
}

for _, plugin in pairs(disabled_built_ins) do
    vim.g["loaded_" .. plugin] = 1
end

require('base')
require('keymap')

-- colorscheme gruvbox
-- vim.cmd [[colorscheme gruvbox]]
-- vim.cmd [[colorscheme tokyonight-storm]]
vim.cmd [[colorscheme kanagawa]]
