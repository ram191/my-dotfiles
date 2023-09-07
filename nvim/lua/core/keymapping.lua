-- Key Mappings
local function map(mode, lhs, rhs, opts)
  local options = { noremap=true }if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map('n', '<c-p>', '<cmd>Telescope find_files<cr>')
map('i', '{', '{}<Esc>i')
map('i', '<leader>l', 'logger.DefaultLogger.Sugar().Error(err)')
