local keymap = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

keymap('i', 'jj', "<ESC>", default_opts)
keymap('n', '<leader><space>', ":noh<CR>", default_opts)

local wk = require("which-key")
wk.setup({
    show_help = false,
    triggers = "auto",
    plugins = { spelling = true },
    key_labels = { ["<leader>"] = "SPC" },
})

local leader = {
    f = {
        name = "+file",
        f = { "<CMD>Telescope find_files<CR>", "Find File" },
        r = { "<CMD>Telescope oldfiles<CR>", "Open Recent File" },
        n = { "<CMD>enew<CR>", "New File" },
    },
    n = {
        name = "+filetree",
        n = { "<CMD>Neotree toggle<CR>", "File Explorer" },
        r = { "<CMD>Neotree reveal<CR>", "Reveal" }
    },
    l = {
        name = "+lsp",
        i = { "<CMD>Mason<CR>", "Manage Servers" },
        l = { "<CMD>MasonLog<CR>", "See logs" }
    },
    s = {
        name = "+search",
        g = { "<CMD>Telescope live_grep<CR>", "Grep" },
        b = { "<CMD>Telescope current_buffer_fuzzy_find<CR>", "Buffer" },
        s = {
            function()
                require("telescope.builtin").lsp_document_symbols({
                    symbols = {
                        "Class",
                        "Function",
                        "Method",
                        "Constructor",
                        "Interface",
                        "Module",
                        "Struct",
                        "Trait",
                        "Field",
                        "Property",
                    },
                })
            end,
            "Goto Symbol",
        },
        h = { "<CMD>Telescope command_history<CR>", "Command History" },
        m = { "<CMD>Telescope marks<CR>", "Jump to Mark" },
        r = { "<CMD>lua require('spectre').open()<CR>", "Replace (Spectre)" },
    },
}

wk.register(leader, { prefix = "<leader>" })
-- wk.register({ g = { name = "+goto" } })

