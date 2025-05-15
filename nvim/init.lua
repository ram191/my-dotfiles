require("plugins")
require("core/keymapping")
require("core/theme")
require("core/cmp")
require("core/lsp")
require("core/treesitter")
require("core/telescope")
require("core/harpoon")
require("core/templ")
require("core/conform")

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
vim.opt.scrolloff = 999
vim.opt.ignorecase = true
vim.opt.termguicolors = true

vim.g['php_cs_fixer_fix_on_save'] = 1
vim.g.copilot_assume_mapped = true
vim.g.copilot_enabled = 0
vim.filetype.add({ extension = { templ = "templ" } })

vim.api.nvim_create_autocmd({ "BufWritePre" }, { pattern = { "*.templ" }, callback = vim.lsp.buf.format })
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = "*/node_modules/*",
  callback = function()
    vim.diagnostic.enable(false)
  end
})

-- Bracey
vim.g['bracey_server_port'] = 8080

vim.api.nvim_create_autocmd("FileType", {
  pattern = {"typescriptreact", "javascriptreact"},
  callback = function()
    vim.bo.commentstring = "{/* %s */}"
  end,
})

-- local lsp_formatting = function(bufnr)
--     vim.lsp.buf.format({
--         filter = function(client)
--             -- apply whatever logic you want (in this example, we'll only use null-ls)
--             return client.name == "null-ls"
--         end,
--         bufnr = bufnr,
--     })
-- end

-- if you want to set up formatting on save, you can use this as a callback
-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- add to your shared on_attach callback
-- local on_attach = function(client, bufnr)
--     if client.supports_method("textDocument/formatting") then
--         vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
--         vim.api.nvim_create_autocmd("BufWritePre", {
--             group = augroup,
--             buffer = bufnr,
--             callback = function()
--                 lsp_formatting(bufnr)
--             end,
--         })
--     end
-- end


-- local null_ls = require("null-ls")
-- null_ls.setup({
--     sources = {
--         -- null_ls.builtins.formatting.stylua,
--         null_ls.builtins.formatting.prettierd,
--         -- null_ls.builtins.diagnostics.eslint,
--         null_ls.builtins.completion.spell,
--     },
--     on_attach = on_attach,
-- })

