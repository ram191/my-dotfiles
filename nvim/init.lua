require("plugins")
require("core/keymapping")
require("core/theme")
require("core/lsp")
require("core/cmp")

-- Vim options
-- vim.opt.background = "dark"
vim.opt.clipboard = "unnamedplus"
vim.opt.completeopt = {"noinsert", "menuone", "noselect"}
vim.opt.cursorline = true
vim.opt.hidden = true
vim.opt.inccommand = "split"
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.title = true
vim.opt.ttimeoutlen = 0
vim.opt.wildmenu = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.g.mkdp_port = "7890"

-- Enable formatting on save
vim.cmd([[autocmd BufWritePre *.js Prettier]])

-- Set Prettier as the default formatter
vim.g['prettier#autoformat_config_present'] = 1
vim.g['prettier#autoformat_require_pragma'] = 0
vim.g['prettier#autoformat_config_file'] = ''
