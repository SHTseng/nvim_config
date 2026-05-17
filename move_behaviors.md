# Neovim Packages: Supported Move Behaviors

Based on the configuration of your Neovim plugins (packages) in `init.lua` and `lua/config/`, here are the supported "move behaviors" (navigations, jumps, and scrolling) provided by those contents.

## 1. Smooth Scrolling Moves (`neoscroll.nvim`)
The Neoscroll plugin provides smooth scrolling motions. You have configured these keymaps in `lua/config/neoscroll.lua`:
- `<C-u>`: Smooth scroll up (half page)
- `<C-d>`: Smooth scroll down (half page)
- `<C-y>`: Smooth scroll up lines (without moving the cursor relative to text)
- `<C-e>`: Smooth scroll down lines (without moving the cursor relative to text)
- `zt`: Smooth scroll to place current line at the **top** of the window
- `zz`: Smooth scroll to place current line at the **center** of the window
- `zb`: Smooth scroll to place current line at the **bottom** of the window

## 2. Code Navigation Moves (`nvim-lspconfig` & `telescope.nvim`)
Using Language Server Protocol (LSP) and Telescope integrations defined in `lua/config/lsp_utils.lua`, you can jump between code definitions and references:
- `<leader>cgd`: Goto Definition
- `<leader>cgr`: Goto References (Telescope)
- `<leader>cgR`: Goto References (Trouble plugin list)
- `<leader>cgD`: Goto Declaration
- `<leader>cgI`: Goto Implementation
- `<leader>cgt`: Goto Type Definition
- `<leader>ss`: Goto Symbol in the current document
- `[d`: Jump to Previous Diagnostic
- `]d`: Jump to Next Diagnostic

## 3. File and Search Navigation (`telescope.nvim`)
Telescope provides fuzzy-finding movement across files and marks, defined in `lua/keymap.lua`:
- `<leader>ff`: Find File and move to it
- `<leader>fr`: Move to a Recent File
- `<leader>sb`: Move to a search result in the Current Buffer
- `<leader>sg`: Move to a string match in the workspace (Live Grep)
- `<leader>sm`: Jump to a specific Mark
- `<leader>sh`: Move to Command History

## 4. File Tree Navigation (`neo-tree.nvim`)
- `<leader>nn`: Toggle File Explorer
- `<leader>nr`: Reveal current file in File Explorer

## 5. Tab Navigation (Core Keymaps)
You have also mapped standard tab movements in `lua/keymap.lua`:
- `<C-[>`: Move to Previous Tab (`:tabprevious`)
- `<C-]>`: Move to Next Tab (`:tabnext`)

## 6. Essential Core Vim/Neovim Movements
While the above behaviors come from plugins or custom keymaps, here are essential built-in movement commands that are highly practical for daily use:

**Word Movements**
- `w` / `W`: Move forward to the start of the next word / WORD (space-separated).
- `b` / `B`: Move backward to the start of the previous word / WORD.
- `e` / `E`: Move forward to the end of the current word / WORD.

**Line & Character Movements**
- `0`: Move to the absolute beginning of the line.
- `^`: Move to the first non-blank character of the line.
- `$`: Move to the end of the line.
- `f{char}` / `F{char}`: Find and move to the next/previous occurrence of `{char}` on the current line.
- `t{char}` / `T{char}`: Move 'till' (just before/after) the next/previous occurrence of `{char}` on the current line.
- `;` / `,`: Repeat the last `f`, `F`, `t`, or `T` command forward / backward.

**Paragraph & Structure Movements**
- `{` / `}`: Move backward/forward by an empty line (paragraph movement).
- `%`: Jump to the matching pair of `()`, `{}`, or `[]`.

**Viewport Movements**
- `H` / `M` / `L`: Move cursor to the **H**igh (top), **M**iddle, or **L**ow (bottom) of the current screen.
- `<C-o>` / `<C-i>`: Jump back to the older / newer cursor position in the jump list (very useful after LSP jumps like `Goto Definition`).
