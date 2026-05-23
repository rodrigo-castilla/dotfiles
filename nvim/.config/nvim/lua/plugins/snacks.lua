return {
    {
        "folke/snacks.nvim",
        opts = {
            picker = {
                enabled = true,
                -- Configuramos el comportamiento de las ventanas de búsqueda
                win = {
                    input = {
                        keys = {
                            -- 1. Forzamos ESC para que SIEMPRE cierre (en modo normal e insertar)
                            ["<Esc>"] = { "close", mode = { "n", "i" } },

                            -- 2. Usamos una función directa para Ctrl+C para evitar recursividad.
                            -- Esto simplemente detiene el modo insertar sin disparar "close".
                            ["<C-c>"] = {
                                function()
                                    vim.cmd("stopinsert")
                                end,
                                mode = "i",
                                desc = "Ir a modo normal",
                            },
                        },
                    },
                },
            },
        },
        keys = {
            {
                "<leader>F",
                function()
                    Snacks.picker.lsp_symbols({
                        -- Lista exhaustiva para cubrir JS, Go, Java, Python, etc.
                        symbols = {
                            "Class", -- Clases (Java, Python, JS)
                            "Function", -- Funciones clásicas (Go, Python, JS)
                            "Method", -- Métodos (Java, Go, Python)
                            "Constructor", -- Constructores
                            "Interface", -- Interfaces (Java, TS, Go)
                            "Struct", -- Estructuras (Go)
                            "Variable", -- AQUÍ es donde caen las arrow functions de JS/TS
                            "Constant", -- Algunas constantes globales en JS
                            "Module", -- Para ver la estructura de archivos grandes
                            "Property", -- Propiedades de objetos/clases
                        },
                        -- Filtramos para que no nos llene de variables locales pequeñas
                        -- (Opcional: si quieres TODO, puedes comentar la línea de abajo)
                        filter = { default = true },
                    })
                end,
                desc = "Omni-Explorer (LSP Symbols)",
            },
        },
    },
}
