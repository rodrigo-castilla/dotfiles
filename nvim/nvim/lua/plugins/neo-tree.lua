return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    source_selector = {
      winbar = true, -- Muestra pestañas en la parte superior para cambiar de fuente
      statusline = false,
    },
    sources = {
      "filesystem",
      "buffers",
      "git_status",
    },
    filesystem = {
      -- Esto permite que Neo-tree maneje múltiples fuentes si lo deseas
      group_empty_dirs = true,
      follow_current_file = { enabled = true },
    },
  },
}
