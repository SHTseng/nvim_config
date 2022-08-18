lua require("base")
lua require("plugins")

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

set textwidth=0
set wrapmargin=0  "Disable line wrap
set ruler   "Show row and column ruler information
set showbreak=+++   "Wrap-broken line prefix
"set textwidth=100   "Line wrap (number of cols)
set showmatch   "Highlight matching brace
set showcmd             " show command in bottom bar
set laststatus=2
set title               " show file in titlebar
set showmode            " show mode in status bar (insert/replace/...)
set cursorline " show current cursor line


set virtualedit=onemore  "allow to go one character behind the end of the line
set wildmenu            " visual autocomplete for command menu
set wildignore+=*.o,*.obj,*.bak,*.exe,*.py[co],*.swp,*~,*.pyc,.svn,*/cm/log/**,tags,*.jpg,*.png,*.jpeg,*.png,*.mesh,build*/**,build/**,*.sublime-workspace,*.svg,build2/**,build3/**
set lazyredraw          " redraw only when we need to.
set confirm             " get a dialog when :q, :w, or :wq fails
set nobackup            " no backup~ files.
set nowritebackup
set viminfo='20,\"500   " remember copy registers after quitting in the .viminfo file -- 20 jump links, regs up to 500 lines'
set hidden              " remember undo after quitting
set history=50          " keep 50 lines of command history
set mouse=v             " use mouse in visual mode (not normal,insert,command,help mode
" set t_ut=
set previewheight=7

"display whitespace
set listchars=tab:>-,trail:~,extends:>,precedes:<
"set listchars=eol: ,tab:>-,trail:~,extends:>,precedes:<

set tags=./tags;/   "This will look in the current directory for 'tags', and work up the tree towards root until one is found.
set cscopetag

set splitbelow
