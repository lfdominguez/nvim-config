-- Entrypoint for my Neovim configuration!

local execute = vim.api.nvim_command
local fn = vim.fn

local pack_path = fn.stdpath("data") .. "/site/pack"
local fmt = string.format

function ensure (user, repo)
  -- Ensures a given github.com/USER/REPO is cloned in the pack/packer/start directory.
  local install_path = fmt("%s/packer/start/%s", pack_path, repo, repo)
  if fn.empty(fn.glob(install_path)) > 0 then
    execute(fmt("!git clone --depth=1 https://github.com/%s/%s %s", user, repo, install_path))
    execute(fmt("packadd %s", repo))
  end
end

-- Bootstrap essential plugins required for installing and loading the rest.
ensure("wbthomason", "packer.nvim")
ensure("lewis6991", "impatient.nvim")

-- my/init get's called after some plugins (nvim stuff) so I have to be sure it's set before
vim.g["mapleader"] = " "
vim.g["maplocalleader"] = " "
vim.opt.termguicolors = true
vim.g.did_load_filetypes = 1

require('impatient')
require('h3r3t1c.init')
