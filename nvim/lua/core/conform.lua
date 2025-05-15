local conform = require("conform")

-- Conform
conform.setup({
  formatters = {
    prisma_format = {
      command = "prisma",
      args = {"format"},
      stdin = false
    }
  },
  formatters_by_ft = {
    javascript = {"prettierd", "prettier", stop_after_first = true},
    typescriptreact = {"prettierd", "prettier", stop_after_first = true},
    typescript = {"prettierd", "prettier", stop_after_first = true},
    -- go = {"goimports", "gofmt"},
    -- prisma = {"prisma_format"}
  }
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    conform.format({bufnr = args.buf})
  end
})

-- vim.api.nvim_create_autocmd("BufWritePost", {
--   pattern = "*",
--   callback = function(args)
--     conform.format({bufnr = args.buf})
--   end
-- })
