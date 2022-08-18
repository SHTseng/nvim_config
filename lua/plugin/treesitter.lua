require'nvim-treesitter.configs'.setup{
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
    },
    autotag = {
        enable = true,
    },
}
