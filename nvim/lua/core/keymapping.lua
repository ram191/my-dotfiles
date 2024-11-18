-- Key Mappings
local function map(mode, lhs, rhs, opts)
  local options = { noremap=true }if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map('n', '<c-p>', '<cmd>Telescope find_files<cr>')
map('n', '<leader>', '<cmd>lua vim.diagnostic.open_float()<CR>')
map('n', 'ca', '<cmd>lua vim.lsp.buf.code_action()<CR>') 
