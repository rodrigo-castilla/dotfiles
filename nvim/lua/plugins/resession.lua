return {
  {
    "stevearc/resession.nvim",
    opts = {
      extensions = {
        oil = {},
      },
    },
  },

  {
    "AstroNvim/astrocore",
    opts = {
      mappings = {
        n = {
          ["<Leader>SS"] = {
            function()
              vim.ui.input({ prompt = "Dirsession's name: " }, function(input)
                if input and input ~= "" then require("resession").save(input, { dir = "dirsession" }) end
              end)
            end,
            desc = "Save this dirsession",
          },
        },
      },
    },
  },
}
