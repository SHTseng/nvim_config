local conform = prequire("conform")
if not conform then return end

conform.setup({
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "ruff_format" },
    c = { "clang-format" },
    cpp = { "clang-format" },
    java = { "clang-format" },
    rust = { "rustfmt" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
    json = { "prettier" },
    html = { "prettier" },
    css = { "prettier" },
  },
  format_on_save = function(bufnr)
    if not vim.g.autoformat then return end
    return { timeout_ms = 500, lsp_format = "fallback" }
  end,
})
