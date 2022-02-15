-----------------------------------------------------------
-- Neovim settings
-----------------------------------------------------------

vim.o.clipboard = "unnamedplus"
vim.o.completeopt = "menuone,noselect"
vim.o.confirm = true
vim.o.fsync = true
vim.o.incsearch = true
vim.o.hlsearch = true
vim.o.mouse = "a"
vim.o.mousefocus = true
vim.o.scrolloff = 4
vim.o.shortmess = "aoOtTIc"
vim.o.sidescrolloff = 4
vim.o.termguicolors = true
vim.o.updatetime = 300
vim.o.timeoutlen = 100
vim.o.wildignorecase = true

vim.wo.cursorline = true
vim.wo.breakindent = true
vim.wo.foldenable = false
vim.wo.colorcolumn = "90"

vim.bo.autoread = true
vim.bo.commentstring = "#\\ %s"
vim.bo.copyindent = true
vim.bo.grepprg = "rg"
vim.bo.modeline = false
vim.bo.swapfile = false
vim.bo.undofile = true

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
vim.opt.number = true             -- show line number
vim.opt.showmatch = true          -- highlight matching parenthesis
vim.opt.foldmethod = 'marker'     -- enable folding (default 'foldmarker')
vim.opt.colorcolumn = '80'        -- line lenght marker at 80 columns
vim.opt.splitright = true         -- vertical split to the right
vim.opt.splitbelow = true         -- orizontal split to the bottom
vim.opt.ignorecase = true         -- ignore case letters when search
vim.opt.smartcase = true          -- ignore lowercase for the whole pattern
vim.opt.linebreak = true          -- wrap on word boundary

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
vim.opt.hidden = true         -- enable background buffers
vim.opt.history = 100         -- remember n lines in history
vim.opt.lazyredraw = true     -- faster scrolling
vim.opt.synmaxcol = 240       -- max column for syntax highlight

-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
vim.opt.expandtab = true      -- use spaces instead of tabs
vim.opt.shiftwidth = 4        -- shift 4 spaces when tab
vim.opt.tabstop = 4           -- 1 tab == 4 spaces
vim.opt.smartindent = true    -- autoindent new lines
vim.opt.smarttab = true
