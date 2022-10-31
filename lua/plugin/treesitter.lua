require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
    },
    indent = {
        enable = true,
    },
    ensure_installed = {
        "c",
        "cpp",
        "python",
        "java",
        "lua",
        "rust",
    },
    autotag = {
        enable = true,
    },
    auto_install = true,
    sync_isntall = false,
}
