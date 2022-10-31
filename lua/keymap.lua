local keymap = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

keymap('i', 'jj', "<ESC>", default_opts)
keymap('n', '<leader><space>', ":noh<CR>", default_opts)
