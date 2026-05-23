-- Desactiva el texto virtual (errores inline) solo para archivos Markdown
vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        -- deactivate spelling
        vim.opt_local.spell = false

        -- deactivate inline errors (diagnostic)
        vim.diagnostic.enable(false, { bufnr = 0 })

        -- activate render markdown
        local ok, render = pcall(require, "render-markdown")
        if ok then
            render.enable()
        end

        -- Adjust text for long paragraph
        vim.opt_local.wrap = true
        vim.opt_local.linebreak = true
    end,
})
