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
    'morhetz/gruvbox',
    'folke/tokyonight.nvim',
    {
        'kyazdani42/nvim-web-devicons',
        event = 'BufRead'
    },
    {
        'nvim-lualine/lualine.nvim',
        event = 'VeryLazy',
        dependencies = { 'kyazdani42/nvim-web-devicons' }
    },
    'lukas-reineke/indent-blankline.nvim',
    'tpope/vim-sleuth',
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        cmd = 'Telescope',
        config = function() require('config.telescope') end
    },
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = vim.fn.executable 'make' == 1
    },
    {
        'nvim-neo-tree/neo-tree.nvim',
        cmd = 'Neotree',
        branch = 'v2.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'kyazdani42/nvim-web-devicons',
            'MunifTanjim/nui.nvim'
        },
        config = function() require('config.neotree') end
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        event = 'BufReadPost',
        cmd = 'TSUpdate',
        config = function() require('config.treesitter') end
    },
    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-path' },
            { 'hrsh7th/cmp-nvim-lsp-signature-help' },
            { 'saadparwaiz1/cmp_luasnip' }
        },
        config = function() require('config.cmp') end
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
        'glepnir/lspsaga.nvim',
        cmd = { 'Lspsaga' },
        config = function() require('config.lspsaga') end,
    },
    {
        'neovim/nvim-lspconfig',
        event = "BufReadPre",
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'williamboman/mason-lspconfig.nvim'
        },
        config = function() require('config.lsp') end,
    },
    { 'folke/which-key.nvim' },
    {
        'neovim/nvim-lspconfig',
        event = "BufReadPre",
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'williamboman/mason-lspconfig.nvim'
        },
        config = function() require('config.lsp') end,
    },
    {
        'karb94/neoscroll.nvim',
        keys = { '<C-u>', '<C-d>', 'gg', 'G' },
        config = function() require('config.neoscroll') end
    },
    {
        'steelsojka/pears.nvim',
        event = 'InsertEnter',
        config = function() require("pears").setup() end
    }
})

local disabled_built_ins = {
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
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
    "spellfile_plugin"
}

for _, plugin in pairs(disabled_built_ins) do
    vim.g["loaded_" .. plugin] = 1
end

require('base')
require('keymap')

-- colorscheme gruvbox
vim.cmd [[colorscheme tokyonight-storm]]
vim.cmd [[
    nnoremap <C-Left> :tabprevious<CR>
    nnoremap <C-Right> :tabnext<CR>
]]
