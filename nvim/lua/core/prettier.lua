vim.cmd([[autocmd BufWritePre *.js Prettier]])
vim.cmd([[autocmd BufWritePost *.php silent !./vendor/bin/pint %:p]])
vim.g['prettier#autoformat_config_present'] = 1
vim.g['prettier#autoformat_require_pragma'] = 0
vim.g['prettier#autoformat_config_file'] = ''
vim.g['prettier#autoformat'] = 1
