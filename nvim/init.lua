require("plugins")
require("core/keymapping")
require("core/theme")
require("core/cmp")
require("core/lsp")
require("core/treesitter")
require("core/telescope")
require("core/harpoon")
require("core/prettier")
require("core/templ")

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

vim.g['php_cs_fixer_fix_on_save'] = 1
vim.g.copilot_assume_mapped = true
vim.filetype.add({ extension = { templ = "templ" } })
vim.api.nvim_create_autocmd({ "BufWritePre" }, { pattern = { "*.templ" }, callback = vim.lsp.buf.format })

local parser_config = require('nvim-treesitter.parsers').get_parser_configs()

parser_config.blade = {
  install_info = {
    url = "https://github.com/EmranMR/tree-sitter-blade",
    files = {"src/parser.c"},
    branch = "main",
  },
  filetype = "blade"
}

parser_config.gotmpl = {
  install_info = {
    url = "https://github.com/ngalaiko/tree-sitter-go-template",
    files = {"src/parser.c"}
  },
  filetype = "gotmpl",
  used_by = {"gohtmltmpl", "gotexttmpl", "gotmpl", "yaml"}
}

vim.g['bracey_server_port'] = 8080
