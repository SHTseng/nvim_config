

local treesitter_config = prequire("nvim-treesitter.configs")
if not treesitter_config then return end

treesitter_config.setup({
  ensure_installed = {
    "bash",
    "c",
    "cpp",
    "cmake",
    "java",
    "rust",
    "python",
    "javascript",
    "comment",
    "css",
    "html",
    "json",
    "typescript",
    "lua",
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true
  }
})