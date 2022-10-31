require('base')
require('plugins')
require('keymap')

vim.cmd[[
    " NERDTree stuffs
    " autocmd vimenter * NERDTree
    map <C-n> :NERDTreeToggle<CR>
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

    colorscheme gruvbox

    nnoremap <C-Left> :tabprevious<CR>
    nnoremap <C-Right> :tabnext<CR>
]]
