local config_path = vim.fn.stdpath('config')
vim.cmd(string.format([[
    source %s/cpp_highlight.vim
]], config_path))
