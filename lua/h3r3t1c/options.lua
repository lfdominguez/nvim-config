local opt = vim.opt
local g = vim.g

opt.completeopt = { "menuone", "noselect" }
opt.undofile = true
opt.ruler = false
opt.hidden = true
opt.ignorecase = true
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.cul = true
opt.mouse = "a"
opt.signcolumn = "yes"
opt.cmdheight = 1
opt.updatetime = 250
opt.timeoutlen = 400
opt.clipboard = "unnamedplus"

-- disable nvim intro
opt.shortmess:append "sI"

-- disable tilde on end of buffer
opt.fillchars = { eob = " " }

-- Numbers
opt.number = true
opt.numberwidth = 2
opt.relativenumber = true

-- Indenline
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true

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
