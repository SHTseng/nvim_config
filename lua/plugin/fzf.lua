local config_path = vim.fn.stdpath('config')
vim.cmd(string.format([[
    source %s/fzf.vim
]], config_path))
