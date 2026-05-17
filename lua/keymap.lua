local keymap = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

keymap('n', '<C-[>', ":tabprevious<CR>", default_opts)
keymap('n', '<C-]>', ":tabnext<CR>", default_opts)
keymap('i', 'jj', "<ESC>", default_opts)

local wk = require("which-key")
wk.setup({
    plugins = { spelling = true },
    replace = {
        ["<leader>"] = "SPC",
    },
})

wk.add({
    { "<leader>f", group = "file" },
    { "<leader>ff", "<CMD>Telescope find_files<CR>", desc = "Find File" },
    { "<leader>fr", "<CMD>Telescope oldfiles<CR>", desc = "Open Recent File" },
    { "<leader>fn", "<CMD>enew<CR>", desc = "New File" },

    { "<leader>n", group = "filetree" },
    { "<leader>nn", "<CMD>Neotree toggle<CR>", desc = "File Explorer" },
    { "<leader>nr", "<CMD>Neotree reveal<CR>", desc = "Reveal" },

    { "<leader>l", group = "lsp" },
    { "<leader>li", "<CMD>Mason<CR>", desc = "Manage Servers" },
    { "<leader>ll", "<CMD>MasonLog<CR>", desc = "See logs" },

    { "<leader>s", group = "search" },
    { "<leader>sg", "<CMD>Telescope live_grep<CR>", desc = "Grep" },
    { "<leader>sb", "<CMD>Telescope current_buffer_fuzzy_find<CR>", desc = "Buffer" },
    {
        "<leader>ss",
        function()
            require("telescope.builtin").lsp_document_symbols({
                symbols = {
                    "Class", "Function", "Method", "Constructor", "Interface",
                    "Module", "Struct", "Trait", "Field", "Property",
                },
            })
        end,
        desc = "Goto Symbol",
    },
    { "<leader>sh", "<CMD>Telescope command_history<CR>", desc = "Command History" },
    { "<leader>sm", "<CMD>Telescope marks<CR>", desc = "Jump to Mark" },
    { "<leader>sr", "<CMD>lua require('spectre').open()<CR>", desc = "Replace (Spectre)" },
})
