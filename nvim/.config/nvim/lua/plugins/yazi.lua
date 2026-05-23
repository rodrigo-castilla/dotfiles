return {
    "mikavilpas/yazi.nvim",
    event = "VeryLazy",
    keys = {
        {
            "<leader>fy",
            function()
                require("yazi").yazi(nil, os.getenv("HOME"))
            end,
            desc = "Yazi at HOME",
        },
        {
            "<leader>fY",
            function()
                require("yazi").yazi(nil, vim.fn.expand("."))
            end,
            desc = "Yazi (cwd)",
        },
    },
    opts = {
        open_for_directories = false,
    },
}
