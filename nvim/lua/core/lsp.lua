-- LSP setup for Neovim 0.11+.
-- Uses the new vim.lsp.config + vim.lsp.enable API (nvim-lspconfig v3 deprecated
-- the require('lspconfig').setup() framework). nvim-lspconfig is still installed
-- because vim.lsp.config references its lsp/<server>.lua tables for default cmd
-- / filetypes / root_markers.
--
-- See :help lspconfig-nvim-0.11

-- Shared capability table for nvim-cmp completion source.
-- Pass this into each server config so completion items include nvim-cmp
-- extras (trigger characters, edit ranges, etc.).
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Buffer-local keymaps (set on LspAttach). See :help vim.diagnostic.* and
-- :help vim.lsp.buf.* for the underlying APIs.
local function on_attach(ev)
  local bufopts = { buffer = ev.buf }
  vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

  vim.keymap.set('n', 'gD',         vim.lsp.buf.declaration,   bufopts)
  vim.keymap.set('n', 'gd',         vim.lsp.buf.definition,    bufopts)
  vim.keymap.set('n', 'K',          vim.lsp.buf.hover,         bufopts)
  vim.keymap.set('n', 'gi',         vim.lsp.buf.implementation,bufopts)
  vim.keymap.set('n', '<C-k>',      vim.lsp.buf.signature_help,bufopts)
  vim.keymap.set('n', '<space>wa',  vim.lsp.buf.add_workspace_folder,    bufopts)
  vim.keymap.set('n', '<space>wr',  vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl',  function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D',   vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn',  vim.lsp.buf.rename,          bufopts)
  vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr',         vim.lsp.buf.references,      bufopts)
  vim.keymap.set('n', '<space>f',   function()
    vim.lsp.buf.format { async = true }
  end, bufopts)
end

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', { clear = true }),
  callback = on_attach,
})

-- Global diagnostic mappings (work regardless of which buffer the cursor is in).
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d',       vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d',       vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- ---------------------------------------------------------------------------
-- Per-server configs.
--
-- Notes on field migration from old lspconfig.*.*.setup{...} API:
--   * root_dir = function -> root_markers = {...} (preferred, simpler)
--   * root_dir = lspconfig.util.root_pattern(...) -> same, but pass the
--     marker filenames straight to root_markers
--   * single_file_support: no longer needed - vim.lsp auto-supports single
--     files; if the old config had single_file_support = false, just drop it.
--   * filetypes / cmd / settings / on_attach / on_init / capabilities: unchanged
-- ---------------------------------------------------------------------------

-- Enable snippet capability broadcast on completion (used by lua_ls on_init too).
local _ = vim.lsp.protocol.make_client_capabilities() -- ensure the protocol module is loaded

vim.lsp.config('clangd', {
  capabilities = capabilities,
})

vim.lsp.config('rust_analyzer', {
  capabilities = capabilities,
  settings = { ['rust-analyzer'] = {} },
})

vim.lsp.config('pyright', {
  capabilities = capabilities,
})

vim.lsp.config('ts_ls', {
  capabilities = capabilities,
  on_attach = on_attach,
  root_markers = { 'package.json' },
  -- (single_file_support was false in old config - dropped; vim.lsp supports
  -- single files by default)
})

vim.lsp.config('gopls', {})

vim.lsp.config('golangci_lint_ls', {})

vim.lsp.config('bashls', {})

vim.lsp.config('jsonls', {})

vim.lsp.config('html', {})

vim.lsp.config('svelte', {})

vim.lsp.config('prismals', {})

vim.lsp.config('intelephense', {
  filetypes = { 'php' },
})

vim.lsp.config('jedi_language_server', {})

vim.lsp.config('vimls', {})

vim.lsp.config('templ', {})

vim.lsp.config('denols', {
  on_attach = on_attach,
  root_markers = { 'deno.json', 'deno.jsonc' },
})

vim.lsp.config('lua_ls', {
  settings = { Lua = {} },
  on_init = function(client)
    local ws = client.workspace_folders and client.workspace_folders[1]
    if ws and (vim.loop.fs_stat(ws.name .. '/.luarc.json')
              or vim.loop.fs_stat(ws.name .. '/.luarc.jsonc')) then
      return
    end
    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        version = 'LuaJIT',
      },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
        },
      },
    })
  end,
})

vim.lsp.config('solidity', {
  cmd = { 'nomicfoundation-solidity-language-server', '--stdio' },
  filetypes = { 'solidity' },
  root_markers = { '.git' }, -- approximates the old root_dir = find_git_ancestor
})

-- (Old config referenced 'phpactor' for blade + php in a commented-out block;
-- leaving it out since the comment shows it was intentionally disabled.)

-- Activate every configured server.
for _, name in ipairs({
  'clangd',
  'rust_analyzer',
  'pyright',
  'ts_ls',
  'gopls',
  'golangci_lint_ls',
  'bashls',
  'jsonls',
  'html',
  'svelte',
  'prismals',
  'rust_analyzer', -- duplicate in old config; deduped here, harmless
  'intelephense',
  'jedi_language_server',
  'vimls',
  'templ',
  'denols',
  'lua_ls',
  'solidity',
}) do
  vim.lsp.enable(name)
end
