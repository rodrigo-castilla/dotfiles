-- =========== PLUGINS ============
vim.keymap.set("n", "<leader>fz", function()
    Snacks.picker.files({
        cwd = vim.fn.expand("~"),
        hidden = true,
    })
end, { desc = "Fzf at HOME (snacks-picker)" })

-- my-anchors.lua
local anchors = require("util.my-anchors")

anchors.setup()

vim.keymap.set("n", "<leader>an", anchors.anchor_new, { desc = "Anchor New" })
vim.keymap.set("n", "<leader>al", anchors.anchor_list, { desc = "Anchor List" })
vim.keymap.set("n", "<leader>au", anchors.anchor_update, { desc = "Anchor Update" })
vim.keymap.set("n", "<leader>ad", anchors.anchor_delete, { desc = "Anchor Delete" })

-- =========== EDITOR =============
