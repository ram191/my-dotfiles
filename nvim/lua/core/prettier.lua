vim.cmd([[autocmd BufWritePre *.js Prettier]])
vim.cmd([[autocmd BufWritePre *.ts Prettier]])
vim.cmd([[autocmd BufWritePre *.tsx Prettier]])
vim.cmd([[autocmd BufWritePost *.php silent !./vendor/bin/pint %:p]])
vim.cmd([[autocmd BufWritePost *.blade.php silent !blade-formatter --write %:p]])
vim.g['prettier#autoformat_config_present'] = 1
vim.g['prettier#autoformat_require_pragma'] = 0
vim.g['prettier#autoformat_config_file'] = ''
vim.g['prettier#autoformat'] = 1
