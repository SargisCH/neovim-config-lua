vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")
vim.g.mapleader = " "
vim.opt.incsearch = true
vim.opt.relativenumber = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.cursorline = true
vim.opt.clipboard:append("unnamedplus") -- use sytem clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])

