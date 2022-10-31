-- vim.cmd("autocmd!")
vim.opt.scrolloff = 5
vim.opt.swapfile = false
vim.opt.splitright = true
vim.opt.splitbelow = true

--indent
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.softtabstop = 4

--search
vim.opt.hlsearch = true
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.incsearch = true

---word wrap
vim.opt.textwidth = 80
vim.opt.wrapmargin = 120  --Enable line wrap
vim.opt.wrap = true
vim.opt.linebreak = true --Break lines at word (requires Wrap lines)
vim.opt.ruler = true --Show row and column ruler information
vim.opt.showbreak = '+++' --Wrap-broken line prefix

vim.opt.showmatch = true --Highlight matching brace
vim.opt.showcmd = true --Show command in bottom bar
vim.opt.laststatus = 2
vim.opt.title = true --Show file in titlebar
vim.opt.showmode = true --Show mode in status bar (insert/replace/...)
vim.opt.cursorline = true --Show current cursor line

vim.opt.virtualedit = 'onemore'  --Allow to go one character behind the end of the line
vim.opt.wildmenu = true --visual autocomplete for command menu
vim.opt.wildignore = '*.o,*.obj,*.bak,*.exe,*.py[co],*.swp,*~,*.pyc,.svn,*/cm/log/**,tags,*.jpg,*.png,*.jpeg,*.png,*.mesh,build*/**,build/**,*.sublime-workspace,*.svg,build2/**,build3/**'

vim.opt.lazyredraw = true --Redraw only when we need to.
vim.opt.confirm = true --get a dialog when :q, :w, or :wq fails
vim.opt.backup = false --no backup~ files.
vim.opt.writebackup = false
-- vim.opt.viminfo='20,\"500' --remember copy registers after quitting in the .viminfo file -- 20 jump links, regs up to 500 lines'
vim.opt.hidden = true --remember undo after quitting
vim.opt.history = 50 --keep 50 lines of command history
vim.opt.mouse = 'a' --use mouse in visual mode (not normal,insert,command,help mode
vim.opt.previewheight = 7

--display whitespace
vim.opt.list = true
vim.opt.listchars = { trail = '.', tab = '»-»' }
--set listchars=tab:>-,trail:~,extends:>,precedes:<
--set listchars=eol: ,tab:>-,trail:~,extends:>,precedes:<

--set tags=./tags;/   "This will look in the current directory for 'tags', and work up the tree towards root until one is found.
vim.opt.cscopetag = true
