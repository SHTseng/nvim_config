require("base")
require("plugins")

vim.cmd[[
    " NERDTree stuffs
    " autocmd vimenter * NERDTree
    map <C-n> :NERDTreeToggle<CR>
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
    " map <C-o> :NERDTreeToggle %<CR>

    " set background=dark
    if (has("termguicolors"))
      set termguicolors
    endif

    colorscheme gruvbox
    "let g:gruvbox_contrast_dark='hard'

    " Map esc key to jj 
    :imap jj <Esc>

    " set number  "Show line numbers
    set number relativenumber
    " set rnu
    nmap <leader>num :set nu! <CR>:set rnu!<CR>
    nmap \q :nohlsearch<CR>
    nnoremap <leader><space> :noh<cr>

    nnoremap <C-Left> :tabprevious<CR>
    nnoremap <C-Right> :tabnext<CR>
]]
