vim.opt["number"] = true
vim.opt["relativenumber"] = true
vim.opt["numberwidth"] = 2
vim.opt["wildmenu"] = true
vim.opt["ruler"] = true
vim.opt["modelines"] = 2
vim.opt["backspace"] = "eol,start,indent"
do end (vim.opt.whichwrap):append("<,>,h,l")
do end (vim.opt)["synmaxcol"] = 500
vim.opt["ignorecase"] = true
vim.opt["smartcase"] = true
vim.opt["hlsearch"] = true
vim.opt["incsearch"] = true
vim.opt["hidden"] = true
vim.opt["showmatch"] = true
vim.opt["matchtime"] = 2
vim.opt["errorbells"] = false
vim.opt["visualbell"] = false
vim.opt["timeoutlen"] = 500
vim.opt["splitbelow"] = true
vim.opt["splitright"] = true
vim.opt["joinspaces"] = false
vim.opt["foldlevel"] = 2
vim.opt["grepprg"] = "rg --vimgrep --no-heading --smart-case"
vim.opt["autoread"] = true
vim.opt["cursorline"] = false
vim.opt["showmode"] = false
vim.opt["encoding"] = "utf8"
vim.opt["expandtab"] = true
vim.opt["smarttab"] = true
vim.opt["list"] = true
vim.opt["showbreak"] = "\226\134\170 "
vim.opt["listchars"] = {extends = "\226\159\169", nbsp = "\226\144\163", precedes = "\226\159\168", tab = "\226\134\146 ", trail = "\226\128\162"}
vim.opt["fcs"] = "eob: "
vim.opt["virtualedit"] = "block"
vim.opt["shiftwidth"] = 4
vim.opt["softtabstop"] = 4
vim.opt["linebreak"] = true
vim.opt["textwidth"] = 100
vim.opt["autoindent"] = true
vim.opt["smartindent"] = true
vim.opt["wrap"] = true
vim.opt["signcolumn"] = "yes"
vim.opt["inccommand"] = "split"
vim.opt["backup"] = false
vim.opt["swapfile"] = false
vim.opt["background"] = "dark"
do end (vim.opt.shortmess):append("Ic")
do end (vim.opt)["completeopt"] = "noinsert,menuone,noselect"
vim.opt["pumheight"] = 20
do end (vim.opt.diffopt):append("internal,algorithm:histogram,indent-heuristic,vertical")
do end (vim.opt)["clipboard"] = "unnamedplus"
vim.g["netrw_banner"] = 0
vim.g["netrw_winsize"] = 15
vim.g["netrw_liststyle"] = 3
vim.g["netrw_browse_split"] = 4
vim.g["netrw_altv"] = 1
vim.g["loaded_python_provider"] = 0
vim.g["loaded_ruby_provider"] = 0
vim.g["loaded_node_provider"] = 0
vim.g["loaded_perl_provider"] = 0
vim.g["loaded_python3_provider"] = 0
vim.g["vimsyn_embed"] = "l"
vim.cmd("augroup vimrc")
vim.cmd("autocmd!")
vim.cmd("augroup END")
vim.cmd("syntax enable")
vim.cmd("au vimrc InsertEnter * set nohlsearch")
vim.cmd("au vimrc BufRead,BufNewFile *.md,*.rst setlocal spell spelllang=en_us")
vim.cmd("au vimrc FileType gitcommit setlocal spell spelllang=en_us")
vim.cmd("au vimrc BufReadPost * silent! normal! g`\"zv")
vim.cmd("au vimrc TextYankPost * silent! lua vim.highlight.on_yank{higroup='IncSearch', timeout=150}")
