return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        n = {
          ["<Leader>u<C-u>"] = { ":PlantumlOpen<CR>", desc = "PlantUML Preview (Browser)" },
          ["<Leader>u<C-U>"] = { ":PlantumlStart<CR>", desc = "PlantUML Preview (No Browser)" },
          ["<Leader>ip"] = { ":LivePreview start <C-r>%<CR>" },
          ["<Leader>it"] = {
            function()
              local neotest = require "neotest"
              -- Ejecuta el test en el archivo actual
              neotest.run.run(vim.fn.expand "%")
              -- Abre el panel de resumen inmediatamente
              neotest.summary.open()
            end,
            desc = "Run Test File & Show Summary",
          },
          ["H"] = { "0", desc = "Start of line" },
          ["L"] = { "$", desc = "End of line" },
          ["gH"] = { "H0", desc = "Start of screen" },
          ["gL"] = { "L$", desc = "End of screen" },
          ["<C-x>"] = { "i", desc = "toggle insert mode" },
        },

        i = {
          ["<C-x>"] = { "<Esc>", desc = "toggle normal mode" },
        },

        v = {
          ["<C-x>"] = { "<Esc>", desc = "toggle normal mode" },
        },
      },
    },
  },
}
