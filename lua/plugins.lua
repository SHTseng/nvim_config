local Plug = vim.fn['plug#']
local package_path = vim.fn.stdpath('data')..'/plugged'
vim.call('plug#begin', package_path)
Plug ('neoclide/coc.nvim', {branch = 'release'})
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'scrooloose/nerdtree'
Plug 'petertriho/nvim-scrollbar'
-- File search tool
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
-- Color scheme
Plug 'morhetz/gruvbox'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
-- Plug 'neovim/nvim-lspconfig'
-- Plug 'glepnir/lspsaga.nvim'
-- Plug 'nvim-lua/completion-nvim'

-- file search
-- Plug 'nvim-lua/popup.nvim'
-- Plug 'nvim-lua/plenary.nvim'
-- Plug 'nvim-telescope/telescope.nvim'
-- Highlighter
Plug ('nvim-treesitter/nvim-treesitter', {['do'] = vim.fn['TSUpdate']})
Plug 'lukas-reineke/indent-blankline.nvim'
vim.call('plug#end')

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

require("scrollbar").setup()
require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    show_current_context = true,
    show_current_context_start = true,
}

require('plugin.coc')
require('plugin.fzf')
require('plugin.lualine')
require('plugin.treesitter')
