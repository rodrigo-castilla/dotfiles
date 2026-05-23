return {
    "3rd/image.nvim",
    opts = {
        backend = "kitty", -- or "iterm2"
        integrations = {
            markdown = {
                enabled = true,
                clear_in_insert_mode = false,
                download_remote_images = true,
                only_render_image_at_cursor = false,
                filetypes = { "markdown", "vimwiki" },
            },
        },
        max_width = nil,
        max_height = nil,
        max_height_window_percentage = math.huge,
        window_overlap_clear_enabled = false,
        window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
    },
}
