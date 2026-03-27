return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        -- --- MODO NORMAL ---
        n = {
          ["<Leader>u<C-u>"] = { ":PlantumlOpen<CR>", desc = "PlantUML Preview (Browser)" },
          ["<Leader>u<C-U>"] = { ":PlantumlStart<CR>", desc = "PlantUML Preview (No Browser)" },
          ["<Leader>ip"] = { ":LivePreview start <C-r>%<CR>" },
          ["<Leader>it"] = {
            function()
              local neotest = require "neotest"
              neotest.run.run(vim.fn.expand "%")
              neotest.summary.open()
            end,
            desc = "Run Test File & Show Summary",
          },
          ["gh"] = { "0", desc = "Start of line" },
          ["gl"] = { "$", desc = "End of line" },
          ["gH"] = { "H0", desc = "Start of screen" },
          ["gL"] = { "L$", desc = "End of screen" },
          ["<C-x>"] = { "i", desc = "toggle insert mode" },

          -- Navegación de Paneles de Tmux (Alt + hjkl)
          ["<M-h>"] = { "<cmd>silent !tmux select-pane -L<CR>", desc = "Tmux pane left" },
          ["<M-j>"] = { "<cmd>silent !tmux select-pane -D<CR>", desc = "Tmux pane down" },
          ["<M-k>"] = { "<cmd>silent !tmux select-pane -U<CR>", desc = "Tmux pane up" },
          ["<M-l>"] = { "<cmd>silent !tmux select-pane -R<CR>", desc = "Tmux pane right" },

          -- Navegación de Buffers de Neovim (Ctrl + Shift + h/l)
          ["H"] = { function() require("astrocore.buffer").nav(-1) end, desc = "Previous buffer" },
          ["L"] = { function() require("astrocore.buffer").nav(1) end, desc = "Next buffer" },
        },

        -- --- MODO INSERT ---
        i = {
          ["<C-x>"] = { "<Esc>", desc = "toggle normal mode" },

          -- Mover el cursor dentro del texto
          ["<M-h>"] = { "<Left>", desc = "Move cursor left" },
          ["<M-j>"] = { "<Down>", desc = "Move cursor down" },
          ["<M-k>"] = { "<Up>", desc = "Move cursor up" },
          ["<M-l>"] = { "<Right>", desc = "Move cursor right" },

          -- Movimiento entre divisiones nativas de Neovim (splits)
          ["<C-h>"] = { "<C-o><C-w>h", desc = "Mover a la ventana de la izquierda" },
          ["<C-j>"] = { "<C-o><C-w>j", desc = "Mover a la ventana de abajo" },
          ["<C-k>"] = { "<C-o><C-w>k", desc = "Mover a la ventana de arriba" },
          ["<C-l>"] = { "<C-o><C-w>l", desc = "Mover a la ventana de la derecha" },
        },

        -- --- MODO VISUAL ---
        v = {
          ["<C-x>"] = { "<Esc>", desc = "toggle normal mode" },
        },
      },
    },
  },
}
