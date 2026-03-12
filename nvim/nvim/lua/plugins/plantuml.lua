return {
  {
    "tyru/open-browser.vim",
    lazy = true,
  },
  {
    "weirongxu/plantuml-previewer.vim",
    ft = { "plantuml", "puml", "uml" },
    dependencies = { "tyru/open-browser.vim" }, -- importante!
    config = function()
      -- Usar wslview para abrir el navegador de Windows desde WSL
      vim.g.plantuml_previewer_browser = "powershell.exe /c start"
      vim.g.plantuml_previewer_autocmd = 1

      -- Añade esto para ayudar a open-browser a encontrar el ejecutable
      --vim.g.open_browser_browser_commands = {
      --{
      --name = "wslview",
      --args = { "{browser}", "{url}" },
      --},
      --}
    end,
  },
  {
    "aklt/plantuml-syntax",
    ft = "plantuml", -- Isso faz o plugin carregar apenas em arquivos .puml
    lazy = true,
  },
}
