local mason_lsp = prequire("mason-lspconfig")

if not mason_lsp then
  return
end

-- Ensure jdtls can find a JDK: prepend openjdk@21 (keg-only brew install) to PATH.
local jdk_bin = "/opt/homebrew/opt/openjdk@21/bin"
if vim.fn.isdirectory(jdk_bin) == 1 and not vim.env.PATH:find(jdk_bin, 1, true) then
  vim.env.PATH = jdk_bin .. ":" .. vim.env.PATH
end

local utils = require("utils")
local signs = utils.signs
local lspUtils = require("config.lsp_utils")

mason_lsp.setup({
  ensure_installed = {
    "clangd",
    "cmake",
    "rust_analyzer",
    "pyright",
    "jdtls",
    "lua_ls",
    "eslint",
    "ts_ls",
    "jsonls",
    "emmet_ls",
  },
  automatic_installation = true,
})

vim.lsp.config("*", {
  on_attach = lspUtils.on_attach,
  capabilities = lspUtils.capabilities,
  handlers = {
    ["eslint/noLibrary"] = function()
      vim.notify("[lspconfig] Unable to find ESLint library.", vim.log.levels.WARN)
      return {}
    end,
  },
})

local emmet_cap = vim.deepcopy(lspUtils.capabilities)
emmet_cap.textDocument.completion.completionItem.snippetSupport = true
vim.lsp.config("emmet_ls", {
  capabilities = emmet_cap,
  filetypes = { "html", "css", "typescriptreact", "javascriptreact", "javascript" },
})

vim.diagnostic.config({
  virtual_text = false,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = signs.Error,
      [vim.diagnostic.severity.WARN] = signs.Warn,
      [vim.diagnostic.severity.INFO] = signs.Info,
      [vim.diagnostic.severity.HINT] = signs.Hint,
    },
  },
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = true,
    header = "",
    prefix = "",
  },
})

local diagnostic_hover_group = vim.api.nvim_create_augroup("DiagnosticHover", { clear = true })
vim.api.nvim_create_autocmd("CursorHold", {
  group = diagnostic_hover_group,
  callback = function()
    vim.diagnostic.open_float(nil, {
      focus = false,
      scope = "cursor",
      close_events = {
        "BufLeave",
        "CursorMoved",
        "CursorMovedI",
        "InsertEnter",
        "FocusLost",
      },
    })
  end,
})
