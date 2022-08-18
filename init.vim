lua require("base")
lua require("packages")
lua require("keymap")
lua require("plugins.treesitter")

" netrw config
" let g:netrw_banner = 0
" let g:netrw_liststyle=3
" let g:netrw_altv=1
" let g:netrw_winsize = 17
" let g:netrw_chgwin = -1
" augroup ProjectDrawer
" autocmd!
" autocmd VimEnter * :Vexplore
" augroup END

syntax on
set background=dark
if (has("termguicolors"))
  set termguicolors
endif

colorscheme gruvbox

" Map esc key to jj
" imap jj <Esc>


set number relativenumber
nmap <leader>num :set nu! <CR>:set rnu!<CR>
" set wrap  "enable wraping
" set linebreak   "Break lines at word (requires Wrap lines)
" set nolist         " list disables linebreak
" " set scrolloff=5         " 5 lines above/below cursor when scrolling
" set noswapfile  " turn off swapfiles
" set splitright
" set splitbelow

set textwidth=0
set wrapmargin=0  "Disable line wrap
set ruler   "Show row and column ruler information
set showbreak=+++   "Wrap-broken line prefix
"set textwidth=100   "Line wrap (number of cols)
set showmatch   "Highlight matching brace
set showcmd             " show command in bottom bar
" set laststatus=2
set title               " show file in titlebar
set showmode            " show mode in status bar (insert/replace/...)
set cursorline " show current cursor line

set hlsearch    "Highlight all search results
set smartcase   "Enable smart-case search
set ignorecase  "Always case-insensitive
set incsearch   "Searches for strings incrementally
nmap \q :nohlsearch<CR>
nnoremap <leader><space> :noh<cr>

set virtualedit=onemore  "allow to go one character behind the end of the line
" set autoindent  "Auto-indent new lines
" set expandtab   "Use spaces instead of tabs
" set shiftwidth=4    "Number of auto-indent spaces
" set smartindent "Enable smart-indent
" set smarttab    "Enable smart-tabs
" set softtabstop=4   "Number of spaces per Tab
set wildmenu            " visual autocomplete for command menu
set wildignore+=*.o,*.obj,*.bak,*.exe,*.py[co],*.swp,*~,*.pyc,.svn,*/cm/log/**,tags,*.jpg,*.png,*.jpeg,*.png,*.mesh,build*/**,build/**,*.sublime-workspace,*.svg,build2/**,build3/**
set lazyredraw          " redraw only when we need to.
set confirm             " get a dialog when :q, :w, or :wq fails
set nobackup            " no backup~ files.
set nowritebackup
set viminfo='20,\"500   " remember copy registers after quitting in the .viminfo file -- 20 jump links, regs up to 500 lines'
set hidden              " remember undo after quitting
set history=50          " keep 50 lines of command history
set mouse=a             " use mouse in visual mode (not normal,insert,command,help mode
set t_ut=
set previewheight=7

"display whitespace
set listchars=tab:>-,trail:~,extends:>,precedes:<
"set listchars=eol: ,tab:>-,trail:~,extends:>,precedes:<

set tags=./tags;/   "This will look in the current directory for 'tags', and work up the tree towards root until one is found.
set cscopetag

