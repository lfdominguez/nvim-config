vim.cmd('augroup lsp') 
vim.cmd('au!') 
vim.cmd("au FileType java lua require('jdtls').start_or_attach({cmd = {'/home/luis/Progs/jdt-language-server/start_server.sh'}})") 
vim.cmd('augroup end') 
