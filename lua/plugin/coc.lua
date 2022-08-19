local config_path = vim.fn.stdpath('config')
vim.cmd(string.format([[
    source %s/coc.vim
]], config_path))
