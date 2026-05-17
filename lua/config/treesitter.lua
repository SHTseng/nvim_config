local ts = prequire("nvim-treesitter")
if not ts then return end

local parsers = {
  "bash", "c", "cpp", "cmake", "java", "rust", "python",
  "javascript", "typescript", "comment", "css", "html",
  "json", "lua", "markdown", "markdown_inline", "vim", "vimdoc",
}

ts.install(parsers)

vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "bash", "sh", "c", "cpp", "cmake", "java", "rust", "python",
    "javascript", "typescript", "css", "html", "json", "lua",
    "markdown", "vim", "help",
  },
  callback = function(args)
    pcall(vim.treesitter.start, args.buf)
    vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
