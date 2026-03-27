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
          ["<M-h>"] = { function() require("astrocore.buffer").nav(-1) end, desc = "Previous buffer" },
          ["<M-l>"] = { function() require("astrocore.buffer").nav(1) end, desc = "Next buffer" },
        },

        i = {
          ["<C-x>"] = { "<Esc>", desc = "toggle normal mode" },

          -- Mover el cursor con Alt + hjkl en modo Insert
          ["<M-h>"] = { "<Left>", desc = "Move cursor left" },
          ["<M-j>"] = { "<Down>", desc = "Move cursor down" },
          ["<M-k>"] = { "<Up>", desc = "Move cursor up" },
          ["<M-l>"] = { "<Right>", desc = "Move cursor right" },

          ["<C-h>"] = { "<C-o><C-w>h", desc = "Mover a la ventana de la izquierda" },
          ["<C-j>"] = { "<C-o><C-w>j", desc = "Mover a la ventana de abajo" },
          ["<C-k>"] = { "<C-o><C-w>k", desc = "Mover a la ventana de arriba" },
          ["<C-l>"] = { "<C-o><C-w>l", desc = "Mover a la ventana de la derecha" },
        },

        v = {
          ["<C-x>"] = { "<Esc>", desc = "toggle normal mode" },
        },
      },
    },
  },
}
