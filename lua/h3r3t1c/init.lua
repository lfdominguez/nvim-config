require('h3r3t1c.options')

local packer_path = vim.fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"

if vim.fn.empty(vim.fn.glob(packer_path)) > 0 then
  vim.fn.system({
    "git",
    "clone",
    "--depth=1",
    "https://github.com/wbthomason/packer.nvim",
    packer_path,
  })
end

vim.cmd([[ packadd packer.nvim ]])

require('h3r3t1c.packages')
require('h3r3t1c.mapping')
