local wk = require("which-key")

local M = {}

local ok_blink, blink = pcall(require, "blink.cmp")
if ok_blink then
  M.capabilities = blink.get_lsp_capabilities()
else
  M.capabilities = vim.lsp.protocol.make_client_capabilities()
end

function M.on_attach(client, bufnr)
  M.set_keys(client, bufnr)
  vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

  if client.name == "eslint" then
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      pattern = { "*.tsx", "*.ts", "*.jsx", "*.js" },
      command = "EslintFixAll",
    })
  end
end

local function format_buf()
  local ok, conform = pcall(require, "conform")
  if ok then
    conform.format({ lsp_format = "fallback", timeout_ms = 1000 })
  else
    vim.lsp.buf.format({ timeout_ms = 1000 })
  end
end

function M.set_keys(client, buffer)
  wk.add({
    { "<leader>c", group = "code", buffer = buffer },
    { "<leader>cr", vim.lsp.buf.rename, desc = "Rename", buffer = buffer },
    { "<leader>ca", vim.lsp.buf.code_action, desc = "Code Action", buffer = buffer, mode = { "n", "v" } },
    { "<leader>cf", format_buf, desc = "Format", buffer = buffer, mode = { "n", "v" } },
    { "<leader>cd", vim.diagnostic.open_float, desc = "Line Diagnostics", buffer = buffer },
    { "<leader>cg", group = "goto", buffer = buffer },
    { "<leader>cgd", "<CMD>Telescope lsp_definitions<CR>", desc = "Goto Definition", buffer = buffer },
    { "<leader>cgr", "<CMD>Telescope lsp_references<CR>", desc = "References", buffer = buffer },
    { "<leader>cgR", "<CMD>Trouble lsp_references<CR>", desc = "Trouble References", buffer = buffer },
    { "<leader>cgD", "<CMD>Telescope lsp_declarations<CR>", desc = "Goto Declaration", buffer = buffer },
    { "<leader>cgI", "<CMD>Telescope lsp_implementations<CR>", desc = "Goto Implementation", buffer = buffer },
    { "<leader>cgt", "<CMD>Telescope lsp_type_definitions<CR>", desc = "Goto Type Definition", buffer = buffer },
    { "<C-k>", vim.lsp.buf.signature_help, desc = "Signature Help", buffer = buffer, mode = { "n", "i" } },
    { "K", vim.lsp.buf.hover, desc = "Hover", buffer = buffer },
    { "[d", function() vim.diagnostic.jump({ count = -1 }) end, desc = "Prev Diagnostic", buffer = buffer },
    { "]d", function() vim.diagnostic.jump({ count = 1 }) end, desc = "Next Diagnostic", buffer = buffer },
  })
end

return M
