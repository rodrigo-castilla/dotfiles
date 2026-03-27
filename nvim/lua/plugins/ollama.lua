return {
  "David-Kunz/gen.nvim",
  keys = {
    -- Configuramos "Espacio + i + a" para llamar a la IA
    { "<leader>ia", ":Gen<CR>", mode = { "n", "v" }, desc = "Menú de IA" },
  },
  opts = {
    model = "deepseek-r1:8b", -- Conectamos con tu cerebro local
    show_prompt = true,
    show_model = true,
  },
}
