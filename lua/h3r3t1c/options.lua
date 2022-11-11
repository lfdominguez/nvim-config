local opt = vim.opt
local g = vim.g

vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_tab_fallback = ""

-- Moving around, searching and patterns
opt.path = ".,**"
opt.ignorecase = true
opt.smartcase = true

-- Display texts
opt.scrolloff = 10
opt.display = "truncate"
opt.fillchars = { vert = "|", horiz = "─", eob = " " }
opt.lazyredraw = false
opt.list = true
opt.listchars = {
  extends = "⟩",
  nbsp = "␣",
  precedes = "⟨",
  tab = "► ",
  trail = "·",
}

-- Syntax, highlighting and spelling
opt.synmaxcol = 1024
opt.termguicolors = true
opt.cursorline = true
opt.cursorcolumn = true

-- Multiple windows
opt.previewheight = 5
opt.splitbelow = true
opt.splitright = true

-- Using the mouse
opt.mouse = "a"
opt.ruler = false
opt.visualbell = true

-- Selecting text
opt.clipboard = "unnamedplus,unnamed"

-- Editing text
opt.undofile = true
opt.textwidth = 80
opt.formatoptions = "qrnj1"
opt.formatlistpat =
  [[^\\s*[\\[({]\\\?\\([0-9]\\+\\\|[iIvVxXlLcCdDmM]\\+\\\|[a-zA-Z]\\)[\\]:.)}]\\s\\+\\\|^\\s*[-+o*]\\s\\+]]
opt.complete = ".,w,b,u,t,i,k,kspell,s"
opt.pumheight = 30
opt.dictionary = { "/usr/share/dict/spanish", "/usr/share/dict/words" }

-- Others
opt.completeopt = { "menu", "menuone", "noselect" }
opt.hidden = true
opt.cul = true
opt.signcolumn = "yes"
opt.cmdheight = 1
opt.updatetime = 250
opt.gdefault = true

-- Disable nvim intro
opt.shortmess:append "sI"

-- Numbers
opt.number = true
opt.numberwidth = 2
opt.relativenumber = true

-- Indenline
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = -1
opt.smartindent = true
opt.smarttab = true

-- Folding
opt.foldlevel = 99

-- Mapping
opt.timeoutlen = 400
opt.ttimeoutlen = 50

-- reading and writing files
opt.fileformats = "unix"
opt.writebackup = false
opt.autowrite = true

-- The swap file
opt.swapfile = false

-- command line editing
opt.wildmode = "longest:full,full"
opt.wildignore:append("*.swp,*.bak")
opt.wildignore:append("*.pyc,*.class,*.sln,*.Master,*.csproj,*.csproj.user,*.cache,*.dll,*.pdb,*.min.*,bundle.*")
opt.wildignore:append("*/.git/**/*,*/.hg/**/*,*/.svn/**/*")
opt.wildignore:append("*/min/*,*/vendor/*")
opt.wildignore:append("*/node_modules/*,*/bower_components/*")
opt.wildignore:append("*/java/*,*/target/*,*/out/*,*/_build/**/*")
opt.wildignore:append("tags,cscope.*")
opt.wildignore:append("*.tar.*")
opt.wildignorecase = true

-- Replace grep command
if vim.fn.executable("rg") then
  opt.grepprg = "rg --vimgrep"
  opt.grepformat = "%f:%l:%c:%m"
end

-- diagnostics
vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = false,
  update_in_insert = false,
  severity_sort = true,
  float = { source = "always" },
})

local signs = { Error = "● ", Warn = "● ", Hint = "● ", Info = "● " }

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append "<>hl"

g.mapleader = " "
g.auto_save = false

-- disable builtin vim plugins
local disabled_built_ins = {
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "gzip",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "rrhelper",
    "spellfile_plugin",
    "matchit",
}

for _, plugin in pairs(disabled_built_ins) do
    g["loaded_" .. plugin] = 1
end

-- Use relative & absolute line numbers in 'n' & 'i' modes respectively
vim.cmd[[ au InsertEnter * set norelativenumber ]]
vim.cmd[[ au InsertLeave * set relativenumber ]]

-- Don't show any numbers inside terminals
vim.cmd [[ au TermOpen term://* setlocal nonumber norelativenumber ]]

-- Don't show status line on certain windows
vim.cmd [[ au TermOpen term://* setfiletype terminal ]]
vim.cmd [[ let hidden_statusline = luaeval('{"NvimTree"}') | autocmd BufEnter,BufWinEnter,WinEnter,CmdwinEnter,TermEnter * nested if index(hidden_statusline, &ft) >= 0 | set laststatus=0 | else | set laststatus=2 | endif ]]

-- Open a file from its last left off position
vim.cmd [[ au BufReadPost * if expand('%:p') !~# '\m/\.git/' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif ]]
