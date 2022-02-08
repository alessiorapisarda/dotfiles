vim.cmd([[
    autocmd TermOpen * setlocal listchars= nonumber norelativenumber nocursorline
    autocmd TermOpen * startinsert

    augroup _alpha
    autocmd!
    autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
    augroup end

    augroup _lsp
    autocmd!
    autocmd BufWritePre * lua vim.lsp.buf.formatting()
    augroup end
]])
