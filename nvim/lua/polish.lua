vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0 -- Ya de paso, quitamos Ruby también

-- ~/.config/nvim/lua/polish.lua
vim.g.autoformat_enabled = true -- Habilita el formateo automático globalmente

-- Configuración específica por lenguaje (opcional)
-- Esto asegura que use null-ls (donde vive Black) para formatear
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.py", "*.cpp", "*.c" },
  callback = function() vim.lsp.buf.format { async = false } end,
})

vim.opt.paste = false
