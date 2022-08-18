local Plug = vim.fn['plug#']
local package_path = vim.fn.stdpath('data')..'/plugged'
vim.call('plug#begin', package_path)
Plug 'nvim-lualine/lualine.nvim'
Plug 'morhetz/gruvbox'
-- Plug 'neovim/nvim-lspconfig'
-- Plug 'glepnir/lspsaga.nvim'
-- Plug 'kyazdani42/nvim-web-devicons'
-- Plug 'nvim-lua/completion-nvim'

-- file search
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'kyazdani42/nvim-web-devicons'

-- Highlighter
Plug ('nvim-treesitter/nvim-treesitter', {['do'] = vim.fn['TSUpdate']})
vim.call('plug#end')

require('lualine').setup {
    options = {
        theme = 'auto',
        icons_enabled = false,
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        }
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
}

vim.cmd([[

]])
